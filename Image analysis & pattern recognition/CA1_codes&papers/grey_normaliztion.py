# import cv2
# import numpy as np
#
# img = cv2.imread('hive.jpg',0)
# equ = cv2.equalizeHist(img)
# res = np.hstack((img,equ)) #stacking images side-by-side
# cv2.imwrite('res.png',res)
import cv2
import numpy as np

img = cv2.imread('hivein.jpg', 0)

img1 = cv2.equalizeHist(img)  # 全局直方图均衡化
clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))  # 自适应直方图均衡化
cll = clahe.apply(img)

res = np.hstack((img, img1, cll))
cv2.imwrite("res.jpg", res)