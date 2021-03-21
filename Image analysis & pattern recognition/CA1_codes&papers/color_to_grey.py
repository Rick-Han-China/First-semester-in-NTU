#转换为灰度图并保存

import cv2
import matplotlib.pyplot as plt
# load image
im = cv2.imread('country.jpg')

# clor space transformation
gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)

# show images
fig = plt.figure()
plt.subplot(121)
plt.gray()
plt.imshow(im)
plt.title(u'color')
plt.axis('off')
# show grey images
plt.subplot(122)
plt.gray()
plt.imshow(gray)
plt.title(u'grey')
plt.axis('off')

plt.savefig('both.jpg',dpi=400,bbox_inches = 'tight')

plt.show()