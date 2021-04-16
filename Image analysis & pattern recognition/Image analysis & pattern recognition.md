# 3.Image Enhancement(79-125)

grey-level transformation

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210404153016437.png" alt="image-20210404153016437" style="zoom:50%;" />

## simple point processing

### gamma correction

当系数大于1，系数越大对比度越大

当系数小于1，可以把暗的部分点亮，本来就亮的部分被点亮的不多

当图像有冲淡的感觉可以用它

记这副变化图：横轴是输入，纵轴是输出

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405164351357.png" alt="image-20210405164351357" style="zoom:50%;" />

### log transformation

g = clog(1+f)

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405164908461.png" alt="image-20210405164908461" style="zoom:50%;" />

<u>log变换可以扩展低灰度值，压缩高灰度值，有助于表达低灰度值区域的细节，弱化图像对比度，与gamma变换<1时效果类似</u>

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405165113649.png" alt="image-20210405165113649" style="zoom:80%;" />

### Piecewise Linear Transformation

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405170108659.png" alt="image-20210405170108659" style="zoom:50%;" />

## histogram equalization

问下图：

![image-20210405170458514](C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405170458514.png)

https://www.jianshu.com/p/902126aa054e

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405171803022.png" alt="image-20210405171803022" style="zoom:150%;" />

https://www.jianshu.com/p/902126aa054e

<u>看一下下图的视频，理解公式含义</u>![image-20210405171031509](C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405171031509.png)

## image smoothing

下图去看一些机器学习中对卷积的相关解释会更好

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405171303843.png" alt="image-20210405171303843" style="zoom:50%;" />



Image smoothing filters are used for blurring and for noise 

reduction（These filters are <u>also known as averaging or low pass filters</u>）

噪音是图像中变化比较大的区域，也就是高频信息

#### 理想低通滤波器（没看，我觉得不考）

https://www.cnblogs.com/vincentcheng/p/9261557.html

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405171707420.png" alt="image-20210405171707420" style="zoom:50%;" />

### Gaussian lowpass filtering(GLPF)

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405190707143.png" alt="image-20210405190707143" style="zoom:50%;" />

重要是D_0的选取，标准差代表数据离散程度，如果D_0小，那么高斯分布中心区域更加聚集，平滑效果越差；反之，则更离散，平滑效果越明显 D_0 = sigema^2

## image sharpening

就是低通滤波的补集

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405190914743.png" alt="image-20210405190914743" style="zoom:50%;" />

<u>理想高通滤波器保留了edge信息</u>

<u>High-boost filtering没看（p101）</u>

线性滤波器的缺点：

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405191959446.png" alt="image-20210405191959446" style="zoom:50%;" />

note: The size of the mask establishes the relative size of the objects that will be blended with the background.

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405192050272.png" alt="image-20210405192050272" style="zoom:50%;" />



### median filter

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405192232731.png" alt="image-20210405192232731" style="zoom:50%;" />

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405192351735.png" alt="image-20210405192351735" style="zoom:50%;" />

median filter可以保留边缘信息

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405192446725.png" alt="image-20210405192446725" style="zoom:50%;" />

均值滤波器在某些时候会导致噪声的spread

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405192554880.png" alt="image-20210405192554880" style="zoom:50%;" />

### Mean vs. Median Filter

Mean filter blurs the step edge. Median filter preserves the step edge.

Mean filter further blurs the smooth edge. Median filter preserves the smooth edge.

<u>p117-120没看</u>

root signal定义

![image-20210405192937664](C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405192937664.png)

<u>Although Median filter preserves image edges, it removes image details such as corner, thin lines / curves and other fine details.</u>

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405193309933.png" alt="image-20210405193309933" style="zoom:50%;" />

# 5.Morphological Image Processing（181-225）

These geometric characteristics is often easier to be extracted/measured from binary images.

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405201627460.png" alt="image-20210405201627460" style="zoom:50%;" />

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405201819726.png" alt="image-20210405201819726" style="zoom:50%;" />

## Morphological Operators

### Dilation

<u>The main application of dilation is to remove small holes from the interior of an object.</u>

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405202016225.png" alt="image-20210405202016225" style="zoom:50%;" />

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405202056349.png" alt="image-20210405202056349" style="zoom:50%;" />![image-20210405202154552](C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405202154552.png)

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405202056349.png" alt="image-20210405202056349" style="zoom:50%;" /><img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405202154552.png" alt="image-20210405202154552" style="zoom:67%;" />

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210406095311812.png" alt="image-20210406095311812" style="zoom:50%;" />

### Erosion

The main application of erosion is to remove small noise 

artifacts from an image.

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405203416988.png" alt="image-20210405203416988" style="zoom:50%;" />![image-20210405203433664](C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405203433664.png)

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405203445761.png" alt="image-20210405203445761" style="zoom:50%;" />

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210406095250292.png" alt="image-20210406095250292" style="zoom:50%;" />

### Opening

<u>白圆圈是开操作(先腐蚀后膨胀是开操作)</u>

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405203802876.png" alt="image-20210405203802876" style="zoom:50%;" />

Note that the outward pointing corners are rounded, where the inward pointing corners remain unchanged

使图像的轮廓变得光滑， 使狭窄的连接断开、消除细毛刺

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405204635317.png" alt="image-20210405204635317" style="zoom:50%;" />

<u>注意开操作中的外尖角与内尖角</u>

<u>Opening is often performed to clear an image of noise whilst retaining the original object size. Care must be taken that the operation does not distort the shape size of the object if this is significant.</u>

<u>The opening operation tends to flatten the sharp peninsular projections on the object.</u>

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405205057892.png" alt="image-20210405205057892" style="zoom:50%;" />

### closing

两者间是对偶关系

黑圆圈是闭操作(先膨胀后腐蚀是开操作)

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405205313839.png" alt="image-20210405205313839" style="zoom:50%;" />

<u>Note that the inward pointing corners are rounded, where the outward pointing corners remain unchanged</u>.

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210405205426152.png" alt="image-20210405205426152" style="zoom:50%;" />

<u>上图需要问一下，没明白图象是怎样生成的，比如尖角</u>

<img src="https://pic1.zhimg.com/v2-bb056562e39cfe26201c7f90417a1c40_b.jpg" alt="形态学应用——图像开运算与闭运算- 知乎" style="zoom:50%;" />

<u>The classic application of closing is to fill holes in a region whilst retaining the original object size.</u>

<u>Dilation fills the holes and erosion restores the original region size</u>

<u>In addition to filling holes the closing operation tends to fill the ‘bays’ on the edge of a region.</u>

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210406095140312.png" alt="image-20210406095140312" style="zoom:50%;" />

下图可能会考

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210406101126331.png" alt="image-20210406101126331" style="zoom:50%;" />

### application

边缘检测

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210406101258703.png" alt="image-20210406101258703" style="zoom:50%;" />

区域填充

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210406101716264.png" alt="image-20210406101716264" style="zoom:50%;" />

连接件检测

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210406101919113.png" alt="image-20210406101919113" style="zoom: 50%;" />

<u>Noise pixels outside the object area are removed by opening with *B* while noise pixels inside the object area are removed by closing with *B*.</u>

下图用的挺好的但是我没看懂

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210406102212011.png" alt="image-20210406102212011" style="zoom:50%;" />

# 8.Understand Pattern Recognition & Decision Theory(2-35)

Pattern recognition is to perceive a pattern, extract the relevant information, understand the content of the information and make decision automatically by machine or computer.

## decision theory

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210409212906852.png" alt="image-20210409212906852" style="zoom:67%;" />

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210409213041853.png" alt="image-20210409213041853" style="zoom: 50%;" /><img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410093031007.png" alt="image-20210410093031007" style="zoom: 67%;" />

<u>posterior probability</u>

哪个大就认为是哪个

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410093044448.png" alt="image-20210410093044448" style="zoom:50%;" />

先验概率：要判断的东西当条件

后验概率：要判断的东西不当条件

## MAP

所以判断错误的概率是

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410094337411.png" alt="image-20210410094337411" style="zoom:50%;" />

这种方法得到的后验概率最大，用1减去后的误差概率就最小，称为MAP rule

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410095158049.png" alt="image-20210410095158049" style="zoom:50%;" />

判断一个类别出错的概率=判断为其他所有概率的和

<u>后验概率和p(x)的计算方法</u>

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410100357557.png" alt="image-20210410100357557" style="zoom:50%;" />![image-20210410101026172](C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410101026172.png)

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410101043910.png" alt="image-20210410101043910" style="zoom:50%;" />

<u>上图是一个例题</u>

<u>上图的例题自己应用一下</u>

<u>w如果你想妥善的分类，必须知道这两个量：p(w)和p(x|w)</u>

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410101441772.png" alt="image-20210410101441772" style="zoom:50%;" />

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410101715139.png" alt="image-20210410101715139" style="zoom:50%;" />

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410101737699.png" alt="image-20210410101737699" style="zoom:50%;" />

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410103324734.png" alt="image-20210410103324734" style="zoom:50%;" />

下图没懂

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410103459772.png" alt="image-20210410103459772" style="zoom:67%;" />

## MAP rule的别名

### minimum error rate classifier

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410104047999.png" alt="image-20210410104047999" style="zoom:50%;" />

由于每次分类依据的是最大的那个概率，所以误差最小，叫做最小误差分类器，而某个类别的误差等于1减这个类别的概率也等于其他所有类别的概率和

## Bayesian decision rule

### 错误判断的代价系数λ_ki

本该为i，错分为k，<u>代价函数如下图</u>

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410104531290.png" alt="image-20210410104531290" style="zoom:50%;" />

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410104629296.png" alt="image-20210410104629296" style="zoom:50%;" />

### conditional risk

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410105258421.png" alt="image-20210410105258421" style="zoom:50%;" />

### LRT

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410105615665.png" alt="image-20210410105615665" style="zoom:50%;" />

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210410105628676.png" alt="image-20210410105628676" style="zoom:50%;" />

#### P29-P35有两道例题，都是LRT方法

# 12.Feature Extraction/Dimension Reduction v. Machine Learning

## Eigen-decomposition

<img src="C:\Users\hmydw\AppData\Roaming\Typora\typora-user-images\image-20210411110224586.png" alt="image-20210411110224586" style="zoom:50%;" />