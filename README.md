# Mat<a href="http://live.ece.utexas.edu/"><img src="http://live.ece.utexas.edu/img/live_logo.png" alt="Laboratory for Image & Video Engineering" width="50"></a>

Matlab library for Image/Video Quality Assessment.

For python library, please check out [PyLIVE](https://github.com/baidut/PyLIVE)

Please go to [lab recourse page](http://live.ece.utexas.edu/research/Quality/index_algorithms.htm) for more resources.

## Installation

Add all folders to path, then you're all set :smiley: 

## Usage

Please cite the corresponding papers in any published work if you use these code. *Bibtex* entries are provided [here](#References).

- [x] `SSIM(img1, img2)`   structural similarity (SSIM) index  `\cite{wang2004SSIM}`   ☻
- [x] `MSSSIM(img1, img2)` multi-scaleSSIM (MS-SSIM) index  `\cite{wang2003MSSSIM}`   ☻
- [x] `IFC(distorted, pristine)`  information fidelity criterion (IFC) index `\cite{sheikh2005IFC}`  ☻✚ :file_folder: [Evaluation of IFC](http://sse.tongji.edu.cn/linzhang/IQA/Evalution_IFC/eva-IFC.htm) 
- [x] `VIF(distorted, pristine)`  [visual information fidelity (VIF) index](http://live.ece.utexas.edu/research/Quality/VIF.htm) `\cite{sheikh2004VIF}`  ☻✚ :file_folder:
- [x] `VIFP(distorted, pristine)` pixel-based VIF  `\cite{sheikh2004VIF}`  ☻
- [ ] `VSNR(distorted, pristine)` visual signal to noise ratio (VSNR)  `\cite{chandler2007VSNR}`  ☻ ✚:file_folder:
- [ ] `MAD(distorted, pristine)` [The Most Apparent Distortion (MAD)](http://vision.eng.shizuoka.ac.jp/mad/)  `\cite{larson2010MAD}`  

---

Unchecked items are under development. 

The meaning of the icons is as follows:

☻ `rgb2gray` is applied for color images

✚ remember `addpath`

:file_folder: require [matlabPyrTools](https://github.com/LabForComputationalVision/matlabPyrTools), remember add `matlabPyrTools` to your path. [Matlab Pyramid Tools](http://www.cns.nyu.edu/~eero/STEERPYR/)

## Notes

- Some metrics are symmetric, *e.g.* `SSIM(img1, img2) == SSIM(img2, img1)` while some are not *e.g.* `VIF(img1, img2) ~= VIF(img2, img1)` 
- When using IQAs to evaluate image enhancement algorithms, we suggest use the original image as distorted, since it has a worse quality than the enhanced one, *e.g.* ` VIF(original, enhanced)`
- We use `IQA(imdist,imorg)` while some original implementation use  `IQA(imorg,imdist)` 

## References

```
@article{wang2004SSIM,
  title={Image quality assessment: from error visibility to structural similarity},
  author={Wang, Zhou and Bovik, Alan C and Sheikh, Hamid R and Simoncelli, Eero P and others},
  journal={IEEE transactions on image processing},
  volume={13},
  number={4},
  pages={600--612},
  year={2004}
}
@inproceedings{wang2003MSSSIM,
  title={Multiscale structural similarity for image quality assessment},
  author={Wang, Zhou and Simoncelli, Eero P and Bovik, Alan C},
  booktitle={The Thrity-Seventh Asilomar Conference on Signals, Systems \& Computers, 2003},
  volume={2},
  pages={1398--1402},
  year={2003},
  organization={Ieee}
}
@article{sheikh2005IFC,
  title={An information fidelity criterion for image quality assessment using natural scene statistics},
  author={Sheikh, Hamid R and Bovik, Alan C and De Veciana, Gustavo},
  journal={IEEE Transactions on image processing},
  volume={14},
  number={12},
  pages={2117--2128},
  year={2005},
  publisher={IEEE}
}
@inproceedings{sheikh2004VIF,
  title={Image information and visual quality},
  author={Sheikh, Hamid R and Bovik, Alan C},
  booktitle={2004 IEEE International Conference on Acoustics, Speech, and Signal Processing},
  volume={3},
  pages={iii--709},
  year={2004},
  organization={IEEE}
}
@article{chandler2007VSNR,
  title={VSNR: A wavelet-based visual signal-to-noise ratio for natural images},
  author={Chandler, Damon M and Hemami, Sheila S},
  journal={IEEE transactions on image processing},
  volume={16},
  number={9},
  pages={2284--2298},
  year={2007},
  publisher={IEEE}
}
@article{larson2010MAD,
  title={Most apparent distortion: full-reference image quality assessment and the role of strategy},
  author={Larson, Eric Cooper and Chandler, Damon Michael},
  journal={Journal of Electronic Imaging},
  volume={19},
  number={1},
  pages={011006},
  year={2010},
  publisher={International Society for Optics and Photonics}
}
```

## Log

* VIF - case sensitive, change `vifsub_est_m` to `vifsub_est_M`