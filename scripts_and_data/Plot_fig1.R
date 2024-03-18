
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

# load data for Figure 1A
data_for_fig1A <- fread("data_for_Fig1A.csv")
# load data for Figure 1B (it uses the same data as the glm models)
data_for_fig1B <- fread("data_for_glmm.csv")


######## PLOTTING ########

# plot histogram for figure 1A
Allhist <- gghistogram(data_for_fig1A,"Day_of_the_year", y="count",fill = "cyan3", 
                       xlab = "Day of the year", ylab = "Captures", bins=40,add_density = TRUE,
                       xlim = c(75,225),
                       # palette = c("green4","black"),
)+ theme_classic()

# plot histogram for figure 1B
hist_FirstLast <- gghistogram(data_for_fig1B,"Day_of_the_year",y="count",fill = "Arrival", 
                              xlab = "Day of the year",ylab = "Captures",bins=40,
                              palette = c("green4","black"),   xlim=c(75,225),
                              legend.title ="Capture event",)+ theme_classic()


# combine plots and create a PDF of Figure 1
pdf(file = "Figure_1.pdf",   # The directory you want to save the file in
    width = 10, # The width of the plot in inches
    height = 5) 
Allhist + hist_FirstLast + plot_annotation(tag_levels = 'a', tag_prefix = '(', tag_suffix = ')')
dev.off()



