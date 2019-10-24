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

直方图的横轴表示组间隔（class intervals)，不一定需要纵轴（vertical scale)。每一个柱形（block）的面积表示所占总体的百分比。

#### 2. Drawing a Histogram

如何计算柱形的高度：高度=组百分比/区间长度

#### 3. The Density Scale 密度标度

通常在直方图的纵轴上使用密度标度（density scale），此时柱形的高度代表了聚集度（crowding），即每单位横坐标所占的百分比（percentage per horizontal unit）。所以直方图的总面积应该是100%。

#### 4. Variables

* 变量（variable）是指，随每一次实验而发生变化的特性（characteristic）。
* 变量的类型：`定性的`（qualitative）或`定量的`（quantitative）。其中定量型变量又分为`离散型`（discrete）和`连续型`（continuous）。
* 离散型变量：变量值具有固定间隔，可以一一列举（For a discrete variable, the values can only differ by `fixed amounts`.），比如家庭成员数。
* 连续型变量：变量值不存在一个最小间隔（the difference can be arbitrarily small），比如年龄。
* 直方图分布表（distribution table）组距（class interval）的选择，一般先选取`10至15`组区间，并根据效果进行调整。另外应注意`端点约定`问题（endpoint convention）。端点约定是指刚好落在边界上的数值如何处理。对于离散型变量，可以使区间关于变量值居中（center the class intervals at the possible values）。

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

1. 直方图通过面积来表示百分比，其由一系列柱形组成。每一个柱形的面积表示其所对应的的分组区间（class interval）所占总体的比例。
2. 在密度标度（density scale）下，柱形的高度等于每单位分组区间所占总体的百分比。
3. 在密度标度下，面积被称作百分比，总的面积等于100%。两个分组区间的总面积等于其对应的总体比例。
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

$$ SD=\sqrt{(\frac{\sum{X_i^{2}}}{N})-(\frac{\sum{X_i}}{N})^{2}} $$

* 对于一组数据，

$$ 当 X_i+\Delta：\bar{X}增加\Delta，SD不变；$$
$$ 当X_i\cdot{\Delta}：\bar{X}和SD均\cdot{\Delta} $$

#### 7. Using a Statistical Calculator

Pass

#### 8. Review Exercises

#### 9. Summary

* 一组典型的数字可以通过平均数（average）和标准差（SD）来进行概括（summarize）。
* 一组数据的`平均数`等于`数据的总和`除以`数据个数`。
* 平均数位于直方图的“重心”，即左右两边观测值之和相等。而中位数位于直方图的“中心”，即左右两边观测值数量相同。
* 平方均值（r.m.s.）衡量一组数据的绝对大小，不计正负。其值等于所有观测值先平方和，再求平均，再开根号。
* 标准差（SD）衡量一组数据相对平均值的距离，或观测值偏离实际中心（指平均数）的平均距离。更准确地说，`标准差是观测值相对平均值偏差的平方均值`。
* 大约68%的观测值都位于距离平均值±1SD的区间内，95%的观测值都位于距离平均值±2SD的区间内。这个规律并非绝对。
* 如果某项研究得出了关于年龄具有某些效果的结论，那么需要明确研究数据是横向研究（同一时间点不同对象）还是纵向研究（不同时间点同一对象）。

### Chapter 5. The Normal Approximation for Data 数据的正态近似...P96

#### 1. The Normal Curve

![the standard units](https://raw.githubusercontent.com/ccabbey/imagehosting/master/blog/20191022103424.png)

#### 2. Finding Areas under the Normal Curve

#### 3. The Normal Approximation for Data

#### 4. Percentiles

#### 5. Percentiles and the Normal Curve

#### 6. Change of Scale

#### 7. Review Exercises

#### 8. Summary

### Chapter 6. Measurement Error...P115

#### 1. Introduction

#### 2. Chance Error

#### 3. Outliers

#### 4. Bias

#### 5. Review Exercises

#### 6. Special Review Exercises

#### 7. Summary and Overview

### Chapter 7. Plotting Points and Lines...P128

#### 1. Reading Points off a Graph

#### 2. Plotting Points

#### 3. Slope and Intercept

#### 4. Plotting Lines

#### 5. The Algebraic Equation for a Line

## PART III. CORRELATION AND REGRESSION...P135

### Chapter 8. Correlation...P137

#### 1. The Scatter Diagram

#### 2. The Correlation Coefficient

#### 3. The SD Line

#### 4. Computing the Correlation Coefficient

#### 5. Review Exercises

#### 6. Summary

### Chapter 9. More about Correlation...P159

#### 1. Features of the Correlation Coefficient

#### 2. Changing SDs

#### 3. Some Exceptional Cases

#### 4. Ecological Correlations

#### 5. Association is Not Causation

#### 6. Review Exercises

#### 7. Summary

### Chapter 10. Regression...P176

#### 1. Introduction

#### 2. The Graph of Averages

#### 3. The Regression Method for Individuals

#### 4. The Regression Fallacy

#### 5. There Are Two Regression Lines

#### 6. Review Exercises

#### 7. Summary

### Chapter 11. The R.M.S. Error for Regression...P198

#### 1. Introduction

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
