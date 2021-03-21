import numpy as np
import cv2


# RGB图像全局直方图均衡化
def hisEqulColor1(img):
    ycrcb = cv2.cvtColor(img, cv2.COLOR_BGR2YCR_CB)
    channels = cv2.split(ycrcb)
    cv2.equalizeHist(channels[0], channels[0])   # 对第1个通道即亮度通道进行全局直方图均衡化并保存
    ycrcb = cv2.merge(channels)
    img = cv2.cvtColor(ycrcb, cv2.COLOR_YCR_CB2BGR)
    return img


# RGB图像进行自适应直方图均衡化，代码同上的地方不再添加注释
def hisEqulColor2(img):
    ycrcb = cv2.cvtColor(img, cv2.COLOR_BGR2YCR_CB)
    channels = cv2.split(ycrcb)
    clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))
    clahe.apply(channels[0], channels[0])

    ycrcb = cv2.merge(channels)
    img = cv2.cvtColor(ycrcb, cv2.COLOR_YCR_CB2BGR)
    return img

if __name__ == '__main__':
    img = cv2.imread('me.jpg')
    img1 = img.copy()
    img2 = img.copy()

    res1 = hisEqulColor1(img1)
    res2 = hisEqulColor2(img2)

    res = np.hstack((img, res1, res2))
    cv2.imwrite('me1.jpg', res)