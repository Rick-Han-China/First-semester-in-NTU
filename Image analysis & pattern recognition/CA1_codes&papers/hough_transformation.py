# coding=utf-8
# 导入python包
import cv2

# 读取彩色图片
img = cv2.imread('hough.jpg')
# 转换为灰度图片
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
# 进行二值化处理
ret,binary = cv2.threshold(gray, 127, 255, cv2.THRESH_BINARY)

# 寻找轮廓
contours, hierarchy = cv2.findContours(binary, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

# 绘制不同的轮廓
draw_img0 = cv2.drawContours(img.copy(),contours,0,(0,255,255),3)
draw_img1 = cv2.drawContours(img.copy(),contours,1,(255,0,255),3)
draw_img2 = cv2.drawContours(img.copy(),contours,2,(255,255,0),3)
draw_img3 = cv2.drawContours(img.copy(), contours, -1, (255, 255, 0), 3)

# 打印结果
print ("contours:类型：",type(contours))
print ("第0 个contours:",type(contours[0]))
print ("contours 数量：",len(contours))

print ("contours[0]点的个数：",len(contours[0]))
print ("contours[1]点的个数：",len(contours[1]))

# 显示并保存结果
# cv2.imshow("img", img)
# cv2.imshow("draw_img0", draw_img0)
# cv2.imshow("draw_img1", draw_img1)
# cv2.imshow("draw_img2", draw_img2)
cv2.imwrite("houghres1.jpg", draw_img3)
cv2.imshow("draw_img3", draw_img3)

cv2.waitKey(0)
cv2.destroyAllWindows()