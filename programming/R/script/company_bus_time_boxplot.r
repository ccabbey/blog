#PURPOSE:
##原始数据为从2019年6月至10月的公司班车到达时间，其中9月23日之后（包括9月23日）对班车路线进行了优化。
##目标是绘制boxplot，对比优化前后各路线到达时间，并添加均值线。
##数据源文件名: busTime.xlsx

library(readxl)
library(ggplot2)
library(tidyverse)
# set workspace

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

#read original excel data
bt <- read_excel("busTime.xlsx")

# convert to long data
bt_long<-gather(bt,busNo,time,'01号线':'10号线')

#For boxplot: add variable 'group' to bt_long to mark data before 2019-9-23 and after
bt_long<-mutate(bt_long,grp=if_else(日期<as.Date('2019-9-23'),true='before',false='after'))

#manual ajust $group factors order to ('before','after')
bt_long$grp<-factor(bt_long$grp,levels=c('before','after'))

#convert $time format to standard datetime format(POSIX UTC)
bt_long$time<-as.POSIXct(bt_long$time,tz='UTC')

#for avg line: summarize mean by $group and $busNo from bt_long, pipeline %>% operator is needed
avgs<-bt_long %>% group_by(busNo,grp) %>% summarise(mean=mean(time,na.rm = T))

#creating const array for _tolerence and _timeScale and constant for _nominal
##tolerence aka tol is to define the limits of y-axis
##nominal aka nom is to define the target time
tol<-as.POSIXct(c('1899-12-31 07:50:00','1899-12-31 09:30:00'),tz = 'UTC')
nom<-as.POSIXct('1899-12-31 08:30:00',tz='UTC')

#draw ggplot

g<-ggplot(data=bt_long,aes(x=busNo,y=time))+
  geom_boxplot(aes(fill=grp))+
  geom_point(data=avgs,aes(x=busNo,y=mean,shape=grp,color=grp),show.legend = F)+
  geom_step(data=avgs,aes(x=busNo,y=mean,group=grp,color=grp),linetype='dashed',show.legend = F)+
  #optional, geom_step can be replaced by geom_line
  geom_hline(color='#0066CC',yintercept = nom)+
  ylim(tol)+
  scale_fill_discrete(name='',labels=c('优化前','优化后'))+
  ggtitle('班车优化前后到达时间对比',subtitle = '数据范围：2019年6月~10月')+
  xlab('路线')+
  ylab('到达时间')+
  theme_bw()+
  #for more, if want to adjust legend position
  theme(legend.position = c(0.85,1.05),legend.background = element_blank(),legend.direction = 'horizontal')
g

