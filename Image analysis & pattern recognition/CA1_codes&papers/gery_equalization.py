import matplotlib.pyplot as plt
import cv2
img=cv2.imread('grey.jpg')
plt.figure("hist")
arr=img.flatten()
n, bins, patches = plt.hist(arr, bins=256, density=1,edgecolor='None',facecolor='black')

plt.savefig('normalization.jpg',dpi=400,bbox_inches = 'tight')

plt.show()