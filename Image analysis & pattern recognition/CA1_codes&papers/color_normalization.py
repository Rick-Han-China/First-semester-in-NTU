import cv2
import matplotlib.pyplot as plt
img=cv2.imread('country.jpg')
ar=img[:,:,0].flatten()
plt.hist(ar, bins=256, density=1,facecolor='r',edgecolor='r',stacked=True)
ag=img[:,:,1].flatten()
plt.hist(ag, bins=256, density=1, facecolor='g',edgecolor='g',stacked=True)
ab=img[:,:,2].flatten()
plt.hist(ab, bins=256, density=1, facecolor='b',edgecolor='b')

plt.savefig('color.jpg',dpi=400,bbox_inches = 'tight')

plt.show()