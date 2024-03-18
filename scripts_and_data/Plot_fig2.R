
######## LIBRARIES ########
#plotting
library("ggeffects") # this is for the predictions 
library("patchwork")
library("sjPlot")
#other
library("data.table")
library("smatr")
library("MASS")
library("magrittr")
library("ggplot2")
library("tidyr")
library("dplyr")    
library("readxl") #library to import Excel files 
library("tidyverse") #package for pipe _ data wrangling (info: a pipe is this "%>%")
library("lubridate")
library("foreach")
library("parallel")
library("ggpubr")
library("splitstackshape") #for easy splitting 
library("ggpubr")
library("scales")
library("grDevices")

# PLEASE SET YOUR WORKING DIRECTORY TO THE PATH CONTAINING THE DATA (.csv) files

# load data for Figure 2
data_for_fig2 <- fread("data_for_Fig2.csv")

# customize plot colors
adjusted_colors <- adjustcolor(c("black", "green3"), alpha.f = 0.3)

# create horizontal boxplots of days of first and last captures
plot_box_last_Firstarrival <- ggboxplot(data_for_fig2, x = "ID", y = "Day_of_the_year",
                                        ylab = "Day of the year",xlab = "Individual identificator",size=0.6,
                                        desc_stat="median_q1q3",
                                        legend.title ="Capture event",
                                        color = "black",palette = adjusted_colors, # this adds transparent colors but for both outline and fill
                                        fill =  "Arrival",
                                        bxp.errorbar=F,
                                        width = 0.5,
                                        # add = c("dotplot"),
                                        #dot.size=0.02,
                                        error.plot = "crossbar",
                                        # legend = "right",
                                        #position = position_dodge(1),
                                        #add = "median",
                                        orientation = "horizontal")+
  guides(fill = guide_legend(reverse=TRUE))+
  font("xlab", size = 18)+
  font("ylab", size = 18)+
  font("legend.title", size = 18)+
  font("legend.text", size = 14)

# create a PDF of Figure 2
pdf(file = "Figure_2.pdf",   # The directory you want to save the file in
    width = 16, # The width of the plot in inches
    height = 12) 
plot_box_last_Firstarrival
dev.off()


