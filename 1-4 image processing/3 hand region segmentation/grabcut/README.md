# This is the Grabcut method we used for hand region detection
## Reference: https://github.com/xiumingzhang/grabcut

## grabcut
A MATLAB Implementation of GrabCut (Excluding Border Matting and User Editing)

This project implements

    @article{rother2004grabcut,
      title={Grabcut: Interactive foreground extraction using iterated graph cuts},
      author={Rother, Carsten and Kolmogorov, Vladimir and Blake, Andrew},
      journal={ACM Transactions on Graphics (TOG)},
      volume={23},
      number={3},
      pages={309--314},
      year={2004},
      publisher={ACM}
    }

## Applying the detection box mat file - in the /detection_result folder 
## and frame images in /frames folder 
## run run_all.m 
## automatical hand region detection will be implemented
## results are stored in /result folder