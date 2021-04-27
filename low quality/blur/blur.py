# This is the script used for blurring the image.
import cv2
import numpy as np
import os.path
import glob

def clamp(pv):
    if pv > 255:
        return 255
    if pv < 0:
        return 0
    else:
        return pv


def gaussian_noise(image):
    h, w, c = image.shape
    for row in range(h):
        for col in range(w):
            s = np.random.normal(0, 20, 3)
            b = image[row, col, 0]  # blue
            g = image[row, col, 1]  # green
            r = image[row, col, 2]  # red
            image[row, col, 0] = clamp(b + s[0])
            image[row, col, 1] = clamp(g + s[1])
            image[row, col, 2] = clamp(r + s[2])
    cv2.imshow("noise image",   image)


if __name__ == "__main__":
    count = 0
    for jpgfile in glob.glob(r'E:\Parkinson\3yp_parkinson\video&frames\frames\PATIENTS\23\R\main\*.jpg'):
        img_R = cv2.imread(jpgfile,cv2.IMREAD_ANYCOLOR)
        blurred_5 =  cv2.GaussianBlur(img_R, (15, 5), 0)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\blur\result\patients\23\R\5',os.path.basename(jpgfile)), blurred_5)

        blurred_25 =  cv2.GaussianBlur(img_R, (15, 25), 0)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\blur\result\patients\23\R\25',os.path.basename(jpgfile)), blurred_25)

        blurred_55 =  cv2.GaussianBlur(img_R, (15, 55), 0)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\blur\result\patients\23\R\55',os.path.basename(jpgfile)), blurred_55)

        blurred_105 =  cv2.GaussianBlur(img_R, (15, 105), 0)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\blur\result\patients\23\R\105',os.path.basename(jpgfile)), blurred_105)

        count = count + 1
        print(count)



    for jpgfile in glob.glob(r'E:\Parkinson\3yp_parkinson\video&frames\frames\PATIENTS\23\L\main\*.jpg'):
        img_L = cv2.imread(jpgfile,cv2.IMREAD_ANYCOLOR)
        blurred_5 =  cv2.GaussianBlur(img_L, (15, 5), 0)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\blur\result\patients\23\L\5',os.path.basename(jpgfile)), blurred_5)

        blurred_25 =  cv2.GaussianBlur(img_L, (15, 25), 0)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\blur\result\patients\23\L\25',os.path.basename(jpgfile)), blurred_25)

        blurred_55 =  cv2.GaussianBlur(img_L, (15, 55), 0)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\blur\result\patients\23\L\55',os.path.basename(jpgfile)), blurred_55)

        blurred_105 =  cv2.GaussianBlur(img_L, (15, 105), 0)
        cv2.imwrite(os.path.join(r'E:\Parkinson\3yp_parkinson\lowquality\blur\result\patients\23\L\105',os.path.basename(jpgfile)), blurred_105)

        count = count + 1
        print(count)
