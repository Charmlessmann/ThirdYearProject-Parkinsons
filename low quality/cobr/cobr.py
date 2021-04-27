# This script is used for changing the contrast and brightness of the images
import cv2
import numpy as np
import os.path
import glob

brightness_175 = int((175 - 0) * (255 - (-255)) / (510 - 0) + (-255))
brightness_285 = int((285 - 0) * (255 - (-255)) / (510 - 0) + (-255))
brightness_105 = int((105 - 0) * (255 - (-255)) / (510 - 0) + (-255))

contrast_217 = int((217 - 0) * (127 - (-127)) / (254 - 0) + (-127))
contrast_57 = int((57 - 0) * (127 - (-127)) / (254 - 0) + (-127))
contrast_157 = int((157 - 0) * (127 - (-127)) / (254 - 0) + (-127))

def brightness_change(img, br, co):
    shadow = br
    max = 255

    al_pha = (max - shadow) / 255
    ga_mma = shadow

    br_changed = cv2.addWeighted(img, al_pha,
                          img, 0, ga_mma)

    Alpha = float(131 * (co + 127)) / (127 * (131 - co))
    Gamma = 127 * (1 - Alpha)

    br_n_co_changed = cv2.addWeighted(br_changed, Alpha,
                                 br_changed, 0, Gamma)

    return br_n_co_changed

if __name__ == '__main__':
    test = cv2.imread("test.jpg")

    count = 0
    for jpgfile in glob.glob(r'E:\Parkinson\3yp_parkinson\video&frames\frames\PATIENTS\name\23\L\main\*.jpg'):

        img_L = cv2.imread(jpgfile,cv2.IMREAD_ANYCOLOR)
        #co217 br175
        result_1 = brightness_change(img_L, brightness_175, contrast_217)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\cobr\result\patients\name\23\L\01',os.path.basename(jpgfile)), result_1)

        #co217 br285
        result_2 = brightness_change(img_L, brightness_285, contrast_217)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\cobr\result\patients\name\23\L\02',os.path.basename(jpgfile)), result_2)

        #co57 br105
        result_3 = brightness_change(img_L, brightness_105, contrast_57)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\cobr\result\patients\name\23\L\03',os.path.basename(jpgfile)), result_3)

        #co157 br105
        result_4 = brightness_change(img_L, brightness_105, contrast_157)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\cobr\result\patients\name\23\L\04',os.path.basename(jpgfile)), result_4)

        count = count + 1
        print(count)





    for jpgfile in glob.glob(r'E:\Parkinson\3yp_parkinson\video&frames\frames\PATIENTS\name\23\R\main\*.jpg'):

        img_R = cv2.imread(jpgfile,cv2.IMREAD_ANYCOLOR)
        #co217 br175
        result_1 = brightness_change(img_R, brightness_175, contrast_217)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\cobr\result\patients\name\23\R\01',os.path.basename(jpgfile)), result_1)
        
        #co217 br285
        result_2 = brightness_change(img_R, brightness_285, contrast_217)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\cobr\result\patients\name\23\R\02',os.path.basename(jpgfile)), result_2)

        #co57 br105
        result_3 = brightness_change(img_R, brightness_105, contrast_57)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\cobr\result\patients\name\23\R\03',os.path.basename(jpgfile)), result_3)

        #co157 br105
        result_4 = brightness_change(img_R, brightness_105, contrast_157)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\cobr\result\patients\name\23\R\04',os.path.basename(jpgfile)), result_4)

        count = count + 1
        print(count)

cv2.waitKey(0)
