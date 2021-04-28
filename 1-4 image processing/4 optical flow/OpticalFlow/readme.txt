This is the code package for computing the optical flow of the segemenated frames.
Reference: https://people.csail.mit.edu/celiu/OpticalFlow/

Running dependency: 
* Ubuntu 18.04
* MATLAB R2018a
* g++ (Ubuntu 6.5.0-2ubuntu1~18.04) 6.5.0 20181026

Configuration: 
In Matlab, after you configure mex appropriately, change directory to "mex" and run the following command:
 
mex Coarse2FineTwoFrames.cpp OpticalFlow.cpp GaussianPyramid.cpp


The optical results and the plots are stored in /result. 
Each video sample we computed 3 optical flows: (1) fps 60, (2)fps 30, (3)fps 20.