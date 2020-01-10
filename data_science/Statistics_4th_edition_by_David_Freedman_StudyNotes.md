# Study Notes of Statistics,4th edition by David Freedman

author: Alex Li

This is my study notes collection on *Statistics,4th edition* by `David Freedman`

```temporarily ignored section
below are section that have been studied but not yet organized.

## PART I. DESIGN OF EXPERIMENTS...P19

### Chapter 1. Controlled Experiments...P21

#### 1. The Salk Vaccine Field Trial

#### 2. The Portacaval Shunt

#### 3. Historical Controls

#### 4. Summary

### Chapter 2. Observational Studies...P30

#### 1. Introduction

#### 2. The Clofibrate Trial

#### 3. More Examples

#### 4. Sex Bias in Graduate Admissions

#### 5. Confounding

#### 6. Review Exercises

#### 7. Summary and Overview

```

## PART II. DESCRIPTIVE STATISTICS 描述性统计...P47

### Chapter 3. The Histogram 直方图...P49

#### 1.Introduction

直方图的横轴表示组距（class intervals)，不一定需要纵轴（vertical scale)。每一个柱形（block）的面积表示所占总体的百分比。

#### 2. Drawing a Histogram

如何计算柱形的高度：高度=组百分比/组距

#### 3. The Density Scale 密度标度

通常在直方图的纵轴上使用密度标度（density scale），此时柱形的高度代表了聚集度（crowding），即每单位横坐标所占的百分比（percentage per horizontal unit）。所以直方图的总面积应该是100%。

>Definitions: If the frequency of the ith bar is $f_i$, then its relative frequency is $r_i=f_i/n$, where n is the sample size. Its density is $d_i=r_i/w_i$, where $w_i$ is its width. Ordinarily, you should make a density histogram only if each bar has the same width.

延伸资料：[频率（frequency）、相对频率(relative frequency)和密度(density)有什么区别？](https://math.stackexchange.com/questions/2666834/what-is-the-difference-between-frequency-and-density-in-a-histogram)

#### 4. Variables

* 变量（variable）是指，随每一次实验而发生变化的特性（characteristic）。
* 变量的类型：`定性的`（qualitative）或`定量的`（quantitative）。其中定量型变量又分为`离散型`（discrete）和`连续型`（continuous）。
* 离散型变量：变量值具有固定间隔，可以一一列举（For a discrete variable, the values can only differ by `fixed amounts`.），比如家庭成员数。
* 连续型变量：变量值不存在一个最小间隔（the difference can be arbitrarily small），比如年龄。
* 直方图分布表（distribution table）组距（class interval）的选择，一般先选取`10至15`组距，并根据效果进行调整。另外应注意`端点约定`问题（endpoint convention）。端点约定是指刚好落在边界上的数值如何处理。对于离散型变量，可以使区间关于变量值居中（center the class intervals at the possible values）。

#### 5. Controlling for a Variable

Pass

#### 6. Cross-Tabulation 交叉表

交叉表是在分布表（对应一个变量）的基础上，把额外的变量（比如年龄）以分组的形式增加维度，同时在每个分组内进行treatment group和control group的对比。[add P47 picture]

#### 7. Selective Breeding 选择育种

本节讲述了Robert Tryon对于心理学家Charles Spearman在1927年提出的“一般智力（general intelligence）”理论的验证。

Spearman提出，智力测验的分数由两个因素组成：一般智力因素和能力因素。前者是先天决定的基础智力，可以遗传；后者是后天获得的能力，对于不同的测试有所不同。

Tryon在小鼠上进行了选择育种实验，选择方法是：通过把小鼠放在迷宫中，并统计小鼠在最终走出迷宫前，走错的总次数作为得分。得分高（“笨”组）的老鼠相互繁殖，得分低（“聪明”组）的老鼠相互繁殖。7代之后，两组之间的分数分布已经非常之大，几乎不重叠了。

然而，除了走迷宫这项测试外，在其他测试中（比如区分形状和光线强度），两组老鼠几乎没有差别。这与Spearman的“一般智力”理论相悖。不过，Tryon的确证明了某些心理学差异是可以被选择性遗传的，“聪明”的老鼠看起来更不合群，更适应迷宫中的生活，“笨”的老鼠却完全相反。

#### 8. Review Exercises

#### 9. Summary...P56

1. 直方图通过面积来表示百分比，其由一系列柱形组成。每一个柱形的面积表示其所对应的的组距（class interval）所占总体的比例。
2. 在密度标度（density scale）下，柱形的高度等于每单位组距所占总体的百分比。
3. 在密度标度下，面积被称作百分比，总的面积等于100%。两个组距的总面积等于其对应的总体比例。
4. 变量是研究对象的特征（A variable is a characteristic of the subjects in a study），变量分为定性型和定量型，定量型变量又分为离散型和连续型。
5. 混合因素（confounding factor）可以通过交叉表（cross-tab）来进行控制。

### Chapter 4. The Average and the Standard Deviation 平均数和标准差...P75

#### 1. Introduction

* 直方图可以用于概括大量的数据的特征。通常，可以使用直方图的中心和关于中心的散布程度，来更加“激进地”概括数据特征。
* 平均数（average）和中位数（median）都是用来找到数据集的中心（center）。
* 标准差（standard deviation）用于衡量关于平均数的散布（spread），四分位数（interquartile）也用于衡量散布。

#### 2. The Average

* 平均数等于一组数字的总和，除以数字的个数。平均数是一种很强大的汇总数据的方法，代价是消除（smoothing away）了个体差异。
* 横向研究（cross-sectional study）：在同一个时间点上比较不同（组）的个体。
* 纵向研究（longitudinal study）：在不同的时间点上比较同一（组）个体。
* 如果一项研究的得出了与年龄影响有关（effects of age）的结论，需要知道数据来源是横向的还是纵向的。

#### 3. The Average and the Histogram

* A histogram balances when supported at the average.把直方图看做一个跷跷板，支点是平均数，那么直方图将处于平衡状态。
* 在直方图的横轴上同时标注平均数和中位数，那么将有如下的性质：
  * 小于等于平均数的数值之和=大于等于平均数的数值之和。
  * 小于等于中位数的数值个数=大于等于平均数的数值个数。对于使用density scale的直方图，即中位数左右（包括中位数本身）`面积`相等。
* 中位数与平均数的相对位置：
  * 左偏型：平均数大于中位数
  * 对称型：平均数近似于中位数
  * 右偏型：平均数小于中位数
  * 可以理解为，中位数总是倾向于靠近分布集中的位置，但平均数总是想靠近“尾巴”的方向，因为尾巴（极大极小值）具有更大的权重。![Figure 7. The tails of a histogram](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191021190933.png)

#### 4. The Root-Mean-Square 平方均值(r.m.s.)

* 均方根（root-mean-square, abbr. r.m.s.），又叫平方均值（quadratic mean），平方开方数。其是指，所有数据（entries）的平方和的平均数的平方根，即：先平方，再平均，再开方。

$$ r.m.s.=\sqrt{\frac{\sum{x_i^{2}}}{n}} $$

* 平方均值总是比绝对平均值要大一点（参考[均值不等式](https://baike.baidu.com/item/%E5%9D%87%E5%80%BC%E4%B8%8D%E7%AD%89%E5%BC%8F/8046796?fr=aladdin)），除非所有的数据都相等。

$$ Q_n=\sqrt{\frac{x_1^2+x_2^2+\cdots+x_n^2}{n}}，平方均值 $$
$$ A_n=\sqrt{\frac{x_1+x_2+\cdots+x_n}{n}} ，算数平均值 $$
$$ Q_n \geq A_n $$

* 平方均值的意义？参考：[计算交流电的电流有效值](https://en.wikipedia.org/wiki/Root_mean_square)，[THE ROOT-MEAN-SQUARE](http://www.analytictech.com/mb313/rootmean.htm)。

>The easiest way to do this is to just erase the signs and compute the average of the new set. But ... that's not how statisticians decided to do it. For reasons of their convenience, they chose a different approach. Instead of wiping out the signs, they square every number (which makes them all positive), then take the square root of the average.

#### 5. The Standard Deviation 标准差

* 想象一组数据在平均值附近散布开来，其散布的程度则可以用标准差（standard deviation, SD）衡量。
* 标准差用来衡量一组数据偏离`平均值`的程度，类似于`平均偏差`（average deviation）。
* 粗略估算，约68%的观测值（entries）分布在距离平均数一个标准差（即avg ± 1SD）的范围内。约95%的观测值分布在距离平均数两个标准差（即avg ± 2SD）的范围内，剩余的5%在两个标准差之外。这一规律对很多观测都适用，但并不是绝对的。（引申：6Sigma的原理？）

#### 6. Computing the Standard Deviation

* SD = r.m.s deviation from average。即，SD表示观测值相对平均值偏差的平方均值。

$$ SD=\sqrt{\frac{\sum{(X_i-\bar{X})^{2}}}{N}} $$

* 为什么不推荐使用方差（variance）？虽然方差和标准差具有相似的效果，但标准差和观测值具有相同的单位，而方差的单位是观测值单位的平方，不便于理解。
* SD的另一种简便求法：平方数的平均数 - 平均数的平方，再求平方根。但这种方法的精度很容易受到圆整误差影响。

$$ SD=D(X)=E(X^2)-E^2(X) ,\ 其中E(X)=\bar{X}$$

* 上结论易证：

$$\begin{aligned}
D(X)=&\sum_{i=1}^n\frac{(X_i-E(X))^2}{n}\\
&=X_1^2+E^2(X)-2X_1E(X)+\dots\\
&=\frac{(X_1^2+\dots+X_n^2)+nE^2(X)-2E(X)(X_1+\dots+X_n)}{n}\\
&=E(X^2)+E^2(X)-2E^2(X)\\
&=E(X^2)-E^2(X)
\end{aligned}$$

* 对于一组数据，

$$当X_i\pm\Delta时:\bar{X}\pm\Delta，SD不变；\\
当X_i\cdot{\Delta}时：\bar{X}和SD均\cdot{\Delta}$$

#### 7. Using a Statistical Calculator

Pass

#### 8. Review Exercises(CH4)

#### 9. Summary

* 一组典型的数字可以通过平均数（average）和标准差（SD）来进行概括（summarize）。
* 一组数据的`平均数`等于`数据的总和`除以`数据个数`。
* 平均数位于直方图的“重心”，即左右两边观测值之和相等。而中位数位于直方图的“中心”，即左右两边观测值数量相同。
* 平方均值（r.m.s.）衡量一组数据的绝对大小，不计正负。其值等于所有观测值先平方和，再求平均，再开根号。
* 标准差（SD）衡量一组数据相对平均值的距离，或观测值偏离实际中心（指平均数）的平均距离。更准确地说，`标准差是观测值相对平均值偏差的平方均值`。
* 大约68%的观测值都位于距离平均值±1SD的区间内，95%的观测值都位于距离平均值±2SD的区间内。这个规律并非绝对。
* 如果某项研究得出了关于年龄具有某些效果的结论，那么需要明确研究数据是横向研究（同一时间点不同对象）还是纵向研究（不同时间点同一对象）。

### Chapter 5. The Normal Approximation for Data 正态近似...P96

#### 1. The Normal Curve

标准正态分布（钟型曲线）的`概率密度`是：

$$ y=\frac{100\%}{\sqrt{2\pi}}e^{-x^2/2}, \textnormal{where}\ e= 2.71828.... $$

![the standard units](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191022103424.png)

正态曲线函数的数学推导起源于de Moivre（棣莫弗）关于二项分布的研究。参考：[The Normal Curve-wiki](https://zh.wikipedia.org/wiki/%E6%AD%A3%E6%80%81%E5%88%86%E5%B8%83)

使用`标准单位`（standard units, Also called standard scores, z-scores, sigma-scores）可以将直方图的横坐标转换为标准正态曲线的横坐标。1 标准单位=1 SD（也叫做Sigma）。

常用百分比（标准单位下）：

* ±1 SD（±1 Sigma）区间面积：68.27%
* ±2 SD（±2 Sigma）区间面积：95.45%
* ±3 SD（±3 Sigma）区间面积：99.73%，对应约2700PPM

在进行标准单位变换时，密度标度（density scale）也需要进行变换，例如由：Percent Per Inch转化为Percent Per Standard Unit。转换公式为
$$ 1PPSU=\frac{100\%}{1SU}=\frac{100\%}{1SD\ inch}=\frac{1}{SD}\cdot\frac{100\%}{1\ inch}=\frac{1}{SD}\cdot1PP\ inch$$

参考上方的正态分布图，由于SD=3 inch，因此转为为标准单位后，10 PPinch=3 x 10 PPSU=30 PPSU，相当于PPSU的尺度被“压缩”了。

#### 2. Finding Areas under the Normal Curve

计算正态曲线包围面积的方法：

![types of area](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191029142947.png)

1. 内对称型：直接查正态分布表中对应的z值即可
2. 外对称型：100%减去例1的面积
3. 内单边型：例1的基础上除以2
4. 不对称型：以中轴分割，左右侧分别按照例3计算，然后相加
5. 外单边型：等于50%加上互补的半边面积，再用100%减去

#### 3. The Normal Approximation for Data

对一组数据进行正态近似的步骤：

1. 计算平均值和标准差
2. 将数据转换为标准单位（standard units）
3. 通过上一章的方法查表计算区间面积
4. 得到近似比例

#### 4. Percentiles 百分位数

对于服从正态分布的数据，可以用平均数和标准差作为统计概括。对于不服从正态分布的数据（比如人均收入分布等长尾（long tail）型数据），可以使用百分位数（percentiles）来进行概括。

注意：百分位数（percentile）是数据中的某个具体值，而百分位秩（percentile rank）是百分比。

四分位距（interquartile range）等于一组数据（从小到大排列）的3/4位数减去1/4位数。

$$ interquartile\ range=\textnormal{75th\ percentile-25th\ percentile} $$

#### 5. Percentiles and the Normal Curve

当直方图服从正态分布时，可以通过标准正态曲线来估计百分位数。

#### 6. Change of Scale 尺度变换

* 尺度变换是指对一组数据的比例尺（scale）进行变换。尺度变换不会影响其对应的标准单位。
* 数据整体加a，平均值也加a，标准差不变。
* 数据整体乘以a，平均值和标准差都会乘以a。

#### 7. Review Exercises(CH5)

#### 8. Summary

1. 标准正态曲线关于0对称，曲线覆盖的总面积是100%。
2. `标准单位`（standard units）描述观测值距离平均数多少个标准差（SD）。
3. 多数直方图的形状都与正态曲线近似。
4. 如果一组观测值服从正态曲线分布，那么观测值落在某个区间（interval）的百分比，等于转化成正态曲线后，组距对应的面积，面积可以通过查正态分布表进行估算。这个过程叫做正态近似（normal approximation）。
5. 如果一组观测值的直方图很好的服从正态分布，那么可以通过`平均数`和`标准差`来概括这组数据。
6. 无论一组观测值的直方图是否服从正态分布，都可以通过使用`百分位数`（percentiles）来进行概括。
7. `尺度变换`（change of scale）：对（一组数据的）每一个观测值加（减）固定值，平均数也会加减相应值，但SD不变。对每一个观测值乘（除）固定值，平均数和SD都会乘除相应值，如果乘除的固定值为负，则要去除括号。

### Chapter 6. Measurement Error 测量误差...P115

#### 1. Introduction(CH6)

#### 2. Chance Error 随机误差

无论测量方法如何精确，测量总是会存在误差。

重复测量得到的数据，通过计算标准差可以估计单次测量中随机误差的大小。

$$ 测量值=真实值(exact\ value)+随机误差(chance\ error) $$

上述公式蕴含的数学意义是：测量值的标准差一定等于随机误差的标准差，因为其本质是尺度变换（change of scale，参考CH5）。

#### 3. Outliers 离群值

通常，极端的测量值被视为离群值或异常值（outliers），如位于5个标准差之外的测量值。

即使在严谨的实验中，也会出现误差很大的测量值，即所谓的异常值。由于正态分布实在是太普遍，因此一般都会选择忽略异常值。如果选择不忽略异常值，或证明异常值不是由随机误差导致，那么只能说明一点：这组数据不服从正态分布。

#### 4. Bias 偏差

偏差（bias），又称系统误差（systematic error），对于同一组测量值，`偏差`的方向都是相同的，而`随机误差`的方向是随机的。

考虑系统误差时，测量值的组成为：

$$ 测量值=真实值(exact\ value)+系统误差(bias)+随机误差(chance\ error) $$

随机误差的大小可以通过重复测量进行估计，但系统误差只能通过与`外部标准`（external standard）或`理论推测`（theoretical prediction）比较来估计。

参考资料：Accuracy, Precision, and Bias

![Accuracy, Precision, and Bias](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191030224551.png)

>We consider both bias and precision with respect to how well an estimator performs over many, many samples of the same size. The average of these multiple samples is called the expected value of the estimator.  
Bias is a measure of how far the expected value of the estimate is from the true value of the parameter being estimated.  
Precision is a measure of how similar the multiple estimates are to each other, not how close they are to the true value (which is bias).  
Precision and bias are two different components of Accuracy.

参考资料：[Precision and Bias](http://www.statisticalengineering.com/Weibull/precision-bias.html)

#### 5. Review Exercises(CH6)

PASS

#### 6. Special Review Exercises(CH6)

PASS

#### 7. Summary and Overview

1. 无论测量过程多么严谨，随机误差（chance error）总是存在的。但可通过进行重复测量（replicate measurement）来估计随机误差的大小。
2. 在相同条件下进行重复测量，并计算测量值的标准差，即为随机误差的近似大小。
3. 偏差（系统误差）会导致测量值向某一方向发生`固定`偏离。
   $$测量值=真实值(exact\ value)+系统误差(bias)+随机误差(chance\ error)$$
4. 测量值中出现少量的离群值（outliers）的正常的，但平均数和标准差SD会严重的收到离群值的影响。在这种情况下，直方图不会服从正态曲线，常见的做法是排除离群值，然后重新计算。

### Chapter 7. Plotting Points and Lines...P128

#### 1. Reading Points off a Graph

PASS

#### 2. Plotting Points

PASS

#### 3. Slope and Intercept 斜率和截距

基本概念：

* 直线上任意两点AB间，水平距离叫做run，竖直距离叫做rise/fall(取决于升高还是下降)。$slope(斜率)=rise/run$
* 截距(intercept)是指直线在x=0位置的高度。一般坐标系xy轴都相交于0，有些特殊的坐标系相交于别的位置，这种情况下，截距仍然是x=0处的高度。

#### 4. Plotting Lines

PASS

#### 5. The Algebraic Equation for a Line 直线的代数方程

直线的一般方程为：$y=mx+b,slope=m,intercept=b$

## PART III. CORRELATION AND REGRESSION...P135

### Chapter 8. Correlation 相关...P137

#### 1. The Scatter Diagram 散点图

直方图（histogram）适合研究单个变量，而散点图适合研究两个独立变量。

自变量和因变量：

* 自变量（independent variable）：用来预测或解释因变量的一个或多个变量，用x表示。
* 因变量（dependent variable）：被预测或被解释的变量，用y表示。

#### 2. The Correlation Coefficient 相关系数

相关系数（correlation coefficient）是用来衡量线性关联（linear association），或是散点关于直线的聚集程度的指标，用r来表示。

两个变量间的关系可用5个统计量概括（如下图所示）：

* 自变量（x-values）的平均值和SD
* 因变量（y-values）的平均值和SD
* 相关系数r

![Summarizing a scatter diagram](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191031235216.png)

![the correlation coefficient](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191031235333.png)

**相关系数r的计算方法：**

将自变量和因变量转化成标准单位（Standard units），即$x_{SU}=(x-\bar{x})/\sigma$，相关系数r等于标准单位的xy乘积之和的平均数。公式为：

$$ r=\frac{\sum_{1}^{n}{(x_{SU}\times {y_{SU})}}}{n}$$

`参考资料：为什么r的范围是-1~+1？`

对上式做一下转化，变为下图所示公式，根据柯西不等式可知，ABS(r)≤1。

![correlation coefficient](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191109215729.png)

r的另一种计算方法（协方差？）：

$$ r=\frac{cov(x,y)}{(SD\ of\ x)\times (SD\ of\ y)},\ 其中\ cov(x,y)=(\bar{xy})-(\bar{x}\times \bar{y})$$

**相关系数r的图形意义（graphic interpretation）：**

* 在自变量和因变量的数据分布具有相同的平均值和SD的情况下，相关系数r可以是-1到+1之间的任意值。r越接近0，散点分布越散乱（formless），越接近1，散点越向直线聚拢（clustered）。当r=1时，称为完全相关（perfect correlation），即所有的散点均在一条直线上，这条线称为`标准差线（SD Line）`。
* 当相关系数为正时，那么散点群（cloud）总体上是斜向上的方向，即正相关；反之是斜向下的方向，即负相关。
* 标准差线（SD Line）是散点向其聚集的假想直线。也可以看做：距离均值点$(\bar{x},\bar{y})$具有相同标准差距离的所有点，即$(\bar{x}\pm{n\ SD},\bar{y}\pm{n\ SD})$的集合。
* 标准差线的斜率为$k=SD_y/SD_x$。

![Plotting the SD line.](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191109163902.png)

*注意：r=0.8并不意味着80%的散点聚集在一条直线附近，也不代表其线性度（linearity）是r=0.4数据集的两倍。*

//todo:相关系数r的数学意义将在回归一章中说明

* 相关系数的原理：
  * 把数据集的均值点看做原点，并划分出四个象限；
  * 考虑公式$r=\sum{x\cdot y}/n$，如果数据落在一、三象限，那么公式中正数的比例就会增加，得到正相关的可能性也会增大，反之则负相关的可能性更大。

![How the correlation coefficient works.](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191125133127.png)

#### 3. The SD Line

标准差线（SD Line）是指：。这是一条直线，其斜率为$k=SD_y/SD_x$。

#### 4. Computing the Correlation Coefficient

内容合并至本章SECTION 2

#### 5. Review Exercises(CH8)

#### 6. Summary(CH8)

合并至正文

### Chapter 9. More about Correlation...P159

#### 1. Features of the Correlation Coefficient

相关系数r没有单位，也不受尺度变换(change of scale)的影响。尺度变换包括：

* 交换x和y的位置（关于y=x镜像）
* 对x或y加减相同的数（平移）
* 对x或y乘除相同的数（缩放）

#### 2. Changing SDs

散点图的（绝对）聚集度取决于x和y的标准差，SD越小，散点看上去就约聚集(clusterd)，但这并不意味相关系数就大，因为r衡量的是“相对的”聚集度，即散点分布在四个区间内的比例。

![The effect of changing SDs.](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191125125351.png)
![How the correlation coefficient works.](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191125133127.png)

The r.m.s. vertical distance to the SD line equals:

$$ \sqrt{2(1-\left|r\right|}\times the\ vertical\ SD$$

#### 3. Some Exceptional Cases

相关系数r衡量线性相关性，而不是普遍的相关性。

相关系数准确地说应该是`线性相关系数`。其只对椭圆状分布（football-shaped）的散点有效。当有离群值（outliers）和非线性关系时，相关系数将严重失真。

然而，绝大部分散点图中都会出现或多或少的离群值，如果有足够证据识别出离群值，那么应该舍弃离群值后再计算r。

#### 4. Ecological Correlations

很多生态学、经济学、社会学中的数据都是基于比率或平均数得出（rates or averages）。这样会夸大相关性，因为这些统计量使个体差异平滑化。面对使用统计描述量绘制的散点图，要警惕被误导。参考下图：

![Ecological correlations are usually too big](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191125211535.png)

#### 5. Association is Not Causation 相关性不等于因果性

Correlation measures association. But association is not the same as causation.

相关性可以衡量两个变量的关联，但关联并不一定以为着因果关系。也可能表明有一个（或多个）混杂变量在同时影响这两个变量。思考如下案例：

* 问：受教育程度和失业率。在大萧条时期（1929-1933），受教育程度更高的人更倾向于拥有更短的失业时间。这能说明受教育可以使你避免失业吗？
* 答：混淆的变量是`年龄`。看起来受教育确实可以降低失业率。然而，随着时间推移，平均受教育程度在逐渐提高（现在仍是这样）。实际上，雇主并不倾向雇佣受教育程度高的人，而是倾向于雇佣年轻的人，而年轻的人受教育程度普遍较高，因此造成了这种假象。
* 问：物种的分布广度和时间跨度。腹足动物的化石记录显示，分布广度越大的动物，存活时间跨度越长，其相关系数r=0.64。一种说法认为，更广的分布可以降低，物种因毁灭性灾难导致灭绝的几率。这种说法对吗？
* 答：这种说法有一定说服力，但其有一个隐含假设，即所有地区的腹足动物留下化石记录的概率是相同的。然而，另一种理论认为，问题出在化石记录本身，并不是只有分布广的动物时间跨度才长，而是其留下化石记录的几率较大，因为有些地区并不容易产生化石，动物曾经存在的记录也无从考证，从而造成这种`统计假象`。

A statistical artifact(统计假象) is an inference that results from bias in the collection or manipulation of data.

#### 6. Review Exercises(CH9)

#### 7. Summary(CH9)

### Chapter 10. Regression...P176

#### 1. Introduction(CH10)

回归方法描述一个变量如何依赖于另一个变量。回归线（regression line）穿过平均点（point of averages）。

y关于x的回归线`估计`了对应每一个x值的y值的平均数。之所以说估计，是因为由于随机误差的影响，实际样本的不同x值，对应的y值的平均数，不可能完全落在同一条直线。因此，回归方法是对`平均值变化`的估计：

平均来看，x每增加1个SD，相应的y增加r个SD。其中r是y与x的相关系数。

#### 2. The Graph of Averages 平均数图

（接第1节）回归线是平均数图的平滑形式（smoothed version）。如果不考虑随机误差的影响，那么回归线和平均数图必然重合为同一条直线。

![平均数图](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191226210236.png)

注意：如果变量间存在非线性相关，不应该使用回归线。

#### 3. The Regression Method for Individuals 用于个体的回归方法

回归线可以用于预测个体值，但如果需要外推较远的数值（比如预测超过2米身高的父亲对应儿子的身高），或是属于不同类的对象（比如根据本校学生样本的结果外推其他学校，或是根据艺术课的结果外推数理课），要特别小心。

#### 4. The Regression Fallacy 回归谬误

考虑如下的案例：某学前班企图提高儿童的智商。儿童入学前接受学前测试，毕业后接受一次学后测试。两次测试的平均分接近100，SD约为15。由此看似乎学前班没有什么效果。然而进一步分析发现，学前测试中低于平均分的儿童在学后测试中平均提高了5分。相反，在学前测试中高于平均分的儿童，在学后测试中平均降低了5分。这能说明学前班的作用是将智商平均化吗？或是聪明的儿童与较笨的儿童一起玩后，两者的差异将逐渐减小吗？

然而，并没有什么特殊的原因或是结论。实际上，在所有的测试--复测（test-reTest）情形中，测试中最低的那部分，在复测时会平均有所提高，反之亦然。这种现象叫做`“回归效应”`。如果误以为回归效应是由于某些重要因素引起，而非普通的随机变化，那么就犯了`回归谬误`。

高尔顿（Galton）在研究父子身高关系时最先发现了回归效应。回归效应是由观察得到的事实，其本质是由于机会变异（chance variability），也就是“运气”。

回归模型的基本方程式是：考试的观察分数=真实分数+机会误差。假设某总体的真实分数服从N(100,15)的正态分布，再假设机会误差为正值或负值的概率相同，大小为5。那么一个真实分数为135的人，在考试时可能得分130或140。现在假设一个人的考试得分是140（如图），那么他的真实分数可能是135或145，但是总的来说，135的可能性要大一些。为什么？因为真实分数为135的人要比145的人多（正态分布的性质）！对于低分的人，也是同样的道理。这就是回归效应的本质。

![回归效应模型](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191226212224.png)

附：在《女士品茶》中，提到了另一种反证方式。

>假设不发生这种向平均值的回归，那么从平均意义上看，高身材父亲的儿子将与他们的父亲一样高，在这种情况下，一些儿子的身材必须高于他们的父亲，以抵消身材比父亲矮小者的影响，使平均值不变。高身材者这一代人的儿子也将如此，那么会有一些儿子身材更高。这个过程将一代一代延续下去。同样地，将会有一部分儿子身材比他们的父亲矮小，而且有一部分孙子将更加矮小，如此下去，不用多少代，人类种族就将由特别高和特别矮的两极构成。 上述的情形并没有发生，人类的身高在平均意义上趋向于保持稳定。只有当非常高的父亲其儿子平均身材变矮，而非常矮的父亲其儿子的平均身材变高，才能出现这种稳定。向平均值回归是一种保持稳定性的现象，它使得某给定物种代际之间大致相同。

#### 5. There Are Two Regression Lines

通常，我们使用y关于x的回归线，即每一个x对应的所有y的平均值的回归线。不过，也可以使用每一个y对应的所有x的平均值的回归线。这两者分别对应使用x预测y，或使用y预测x。一般来说，前者比较符合直观感受。

![两种回归线](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191226215029.png)

#### 6. Review Exercises

#### 7. Summary

（略，已整理合并至章节中）

### Chapter 11. The R.M.S. Error for Regression 回归的均方根误差...P198

#### 1. Introduction(CH11)

#### 2. Computing the R.MLS. Error

#### 3. Plotting the Residuals

#### 4. Looking at Vertical Strips

#### 5. Using the Normal Curve Inside a Vertical Strip

#### 6. Review Exercises

#### 7. Summary

### Chapter 12. The Regression Line...P220

#### 1. Slope and Intercept

#### 2. The Method of Least Squares

#### 3. Does the Regression Make Sense?

#### 4. Review Exercises

#### 5. Summary and Overview

## PART V. PROBABILITY...P237

### Chapter 13. What Are the Chances?...P239

#### 1. Introduction

#### 2. Conditional Probabilities

#### 3. The Multiplication Rule

#### 4. Independence

#### 5. The Collins Case

#### 6. Review Exercises

#### 7. Summary

### Chapter 14. More about Chance...P255

#### 1. Listing the Ways

#### 2. The Addition Rule

#### 3. Two FAQs (Frequently Asked Questions)

#### 4. The Paradox of the Chevalier De Méré

#### 5. Are Real Dice Fair?

#### 6. Review Exercises

#### 7. Summary

### Chapter 15. The Binomial Formula...P273

#### 1. Introduction

#### 2. The Binomial Formula

#### 3. Review Exercises

#### 4. Special Review Exercises

#### 5. Summary and Overview

## PART V. CHANCE VARIABILITY...P289

### Chapter 16. The Law of Averages...P291

#### 1. What Does the Law of Averages Say?

#### 2. Chance Processes

#### 3. The Sum of Draws

#### 5. Review Exercises

#### 6. Summary

### Chapter 17. The Expected Value and Standard Error...P306

#### 1. The Expected Value

#### 2. The Standard Error

#### 3. Using the Normal Curve

#### 4. A Short-Cut

#### 5. Classifying and Counting

#### 6. Review Exercises

#### 7. Postscript

#### 8. Summary

### Chapter 18. The Normal Approximation for Probability Histograms...P326

#### 1. Introduction

#### 2. Probability Histograms

#### 3. Probability Histograms and the Normal Curve

#### 4. The Normal Approximation

#### 5. The Scope of the Normal Approximation

#### 6. Conclusion

#### 7. Review Exercises

#### 8. Summary

## PART VI. SAMPLING...P349

### Chapter 19. Sample Surveys...P351

#### 1. Introduction

#### 2. The Literary Digest Poll

#### 3. The Year the Polls Elected Dewey

#### 4. Using Chance in Survey Work

#### 5. How Well Do Probability Methods Work?

#### 6. A Closer Look at the Galiup Poll

#### 7. Telephone Surveys

#### 8. Chance Error and Bias

#### 9. Review Exercises

#### 10. Summary

### Chapter 20. Chance Errors in Sampling...P373

#### 1. Introduction

#### 2. The Expected Value and Standard Error

#### 3. Using the Normal Curve

#### 4. The Correction Factor

#### 5. The Gallup Poll

#### 6. Review Exercises

#### 7. Summary

### Chapter 21. The Accuracy of Percentages...P393

#### 1. Introduction

#### 2. Confidence Intervals

#### 3. Interpreting a Confidence Interval

#### 4. Caveat Emptor

#### 5. The Gallup Poll

#### 6. Review Exercises

#### 7. Summary

### Chapter 22. Measuring Employment and Unemployment...P413

#### 1. Introduction

#### 2. The Design of the Current Population Survey

#### 3. Carrying out the Survey

#### 4. Weighting the Sample

#### 5. Standard Errors

#### 6. The Quality of the Data

#### 7. Bias

#### 8. Review Exercises

#### 9. Summary

### Chapter 23. The Accuracy of Averages...P427

#### 1. Introduction

#### 2. The Sample Average

#### 3. Which SE?

#### 4. A Reminder

#### 5. Review Exercises

#### 6. Special Review Exercises

#### 7. Summary and Overview

## PART VII. CHANCE MODELS...P457

### Chapter 24. A Model for Measurement Error...P459

#### 1. Estimating the Accuracy of an Average

#### 2. Chance Models

#### 3. The Gauss Model

#### 4. Conclusion

#### 5. Review Exercises

#### 6. Summary

### Chapter 25. Chance Models in Genetics...P476

#### 1. How Mendel Discovered Genes

#### 2. Did Mendel’s Facts Fit His Model?

#### 3. The Law of Regression

#### 4. An Appreciation of the Model

#### 5. Review Exercises

#### 6. Summary and Overview

## PART VIII. TESTS OF SIGNIFICANCE...P491

### Chapter 26. Tests of Significance...P493

#### 1. Introduction

#### 2. The Null and the Alternative

#### 3. Test Statistics and Significance Levels

#### 4. Making a Test of Significance

#### 5. Zero-One Boxes

#### 6. The t-Test

#### 7. Review Exercises

#### 8. Summary

### Chapter 27. More Tests for Averages...P519

#### 1. The Standard Error for a Difference

#### 2. Comparing Two Sample Averages

#### 3. Experiments

#### 4. More on Experiments

#### 5. When Does the z-Test Apply?

#### 6. Review Exercises

#### 7. Summary

### Chapter 28. The Chi-Square Test...P541

#### 1. Introduction

#### 2. The Structure of the x2-Test

#### 3. How Fisher Used the x2-Test

#### 4. Testing Independence

#### 5. Review Exercises

#### 6. Summary

### Chapter 29. A Closer Look at Tests of Significance...P563

#### 1. Was the Result Significant?

#### 2. Data Snooping

#### 3. Was the Result Important?

#### 4. The Role of the Model

#### 5. Does the Difference Prove the Point?

#### 6. Conclusion

#### 7. Review Exercises

#### 8. Special Review Exercises

#### 9. Summary and Overview
