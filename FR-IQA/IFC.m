function score=IFC(imdist,imorg)

%% the following code is just for testing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin == 0
    f = @IFC;
    disp 'The bigger IFC, the better'
    I = imread('peppers.png');
    fprintf('f(I, I) = %f while f(I, I./2) = %f\n',f(I, I),f(I, I./2));
    return;
end
%% the above code is just for testing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if size(imorg, 3) == 3
    imorg = rgb2gray(imorg);
end

if size(imdist, 3) == 3
    imdist = rgb2gray(imdist);
end

imorg = im2double(imorg);
imdist = im2double(imdist);
[~, score] = evalc('ifcvec(imorg,imdist)');
% score=ifcvec(imorg,imdist);
% -----------COPYRIGHT NOTICE STARTS WITH THIS LINE------------
% Copyright (c) 2005 The University of Texas at Austin
% All rights reserved.
% 
% Permission is hereby granted, without written agreement and without license or royalty fees, to use, copy, 
% modify, and distribute this code (the source files) and its documentation for
% any purpose, provided that the copyright notice in its entirety appear in all copies of this code, and the 
% original source of this code, Laboratory for Image and Video Engineering (LIVE, http://live.ece.utexas.edu)
% at the University of Texas at Austin (UT Austin, 
% http://www.utexas.edu), is acknowledged in any publication that reports research using this code. The research
% is to be cited in the bibliography as:
% 
% H. R. Sheikh, A. C. Bovik, and G. de Veciana, "An Information Fidelity Criterion for Image 
% Quality Assessment Using Natural Scene Statistics," IEEE Transactios on Image Processing, in publication, May 2005.
% 
% 
% IN NO EVENT SHALL THE UNIVERSITY OF TEXAS AT AUSTIN BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, 
% OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY OF TEXAS
% AT AUSTIN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
% 
% THE UNIVERSITY OF TEXAS AT AUSTIN SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
% WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DATABASE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS,
% AND THE UNIVERSITY OF TEXAS AT AUSTIN HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
% 
% -----------COPYRIGHT NOTICE ENDS WITH THIS LINE------------
%
%This is an implementation of the algorithm for calculating the
%Information Fidelity Criterion (IFC) between two images. Please refer
%to the following paper:
%
% H. R. Sheikh, A. C. Bovik, and G. de Veciana, "An Information Fidelity Criterion for Image 
% Quality Assessment Using Natural Scene Statistics," IEEE Transactios on Image Processing, in publication, May 2005.
%Download manuscript draft from http://live.ece.utexas.edu in the
%Publications link
%
%This implementation is slightly differnet from the one used to report
%results in the paper above. The modification have to do with using more
%subands than those used in the paper, better handling of image boundaries,
%and a window that automatically resizes itself based on the scale.
%
%Report bugfixes and comments to hamid.sheikh@ieee.org
%
%----------------------------------------------------------------------
% Prerequisites: The Steerable Pyramid toolbox. Available at
% http://www.cns.nyu.edu/~lcv/software.html
%
%Input : (1) img1: The reference image
%        (2) img2: The distorted image (order is important)
%
%Output: (1) The Information Fidelity between the two images

%Default Usage:
%   Given 2 test images img1 and img2, whose dynamic range is 0-255
%
%   ifc = ifcvec(img1, img2);
%
%Advanced Usage:
%   Users may want to modify the parameters in the code. 
%   (1) MxM is the block size that denotes the size of a vector used in the
%   GSM model.
%   (2) subbands included in the computation
%========================================================================
