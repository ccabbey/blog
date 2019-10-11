# import busTime
library(readxl)
library(ggplot2)
library(tidyverse)
bt <- read_excel("C:/Users/li1a.CIEROOFSYSTEMS/OneDrive/公共桌面/Project_busTimeBoxplot/busTime.xlsx")
# import headCount
hc <- read_excel("C:/Users/li1a.CIEROOFSYSTEMS/OneDrive/公共桌面/Project_busTimeBoxplot/headCount.xlsx")
# convert bt to long data
bt_long<-gather(bt,busNo,time,'01号线':'10号线')
hc_long<-gather(hc,busNo,ratio,'01号线':'10号线')
#draw arrival time boxplot using ggplot2
g<-ggplot(data=bt_long,aes(x=busNo,y=time))
g+geom_boxplot()+theme_bw()+ggtitle('班车到达时间','201906-201910')
#draw ratio boxplot using ggplot2
g<-ggplot(data=hc_long,aes(x=busNo,y=ratio))
g+geom_boxplot()+theme_bw()+ggtitle('班车上座率','201906-201910')