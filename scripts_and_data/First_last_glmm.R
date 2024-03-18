#libraries
########################## 
#models
library("glmmTMB")
library("buildmer")
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

# PLEASE SET YOUR WORKING DIRECTORY TO THE PATH CONTAINING THE DATA (.csv) files

# load data for glm models
data_for_glm <- fread("data_for_glmm.csv")

#function for green toad scaled mass index, after Landler et al. (2023) "A unified approach to analysis of body condition in green toads"
scaledMassGT <-
  function(x, y) { #"SVL (mm)","mass (g)"
    SMI.gt <- y * (60 / x) ^ 3 
    return(SMI.gt)}

# this block just assures that all parameters have the correct data type
data_for_glm$svl<-as.numeric(data_for_glm$svl)
data_for_glm$mass<-as.numeric(data_for_glm$mass)
data_for_glm$gtSMI<-scaledMassGT(data_for_glm$svl,data_for_glm$mass)
data_for_glm$year<-as.factor(data_for_glm$year)
data_for_glm$ID<-as.factor(data_for_glm$ID)
data_for_glm$Day_of_the_year<-as.numeric(data_for_glm$Day_of_the_year)

######### MODELLING ########
# run generalized linear mixed models using glmmTMB()
# model for first encounters
First_glmm<-glmmTMB(Day_of_the_year ~ gtSMI + svl + (1|ID) + (1|year), 
                    family="gaussian", data=data_for_glm[data_for_glm$Arrival=="First",]) #exchange mass for SMI, no females in this list family=tweedie,
# model for last encounters
Last_glmm<-glmmTMB(Day_of_the_year ~ gtSMI + svl + (1|ID) + (1|year),
                   family="gaussian", data=data_for_glm[data_for_glm$Arrival=="Last",]) #exchange mass for SMI, no females in this list



######## PLOTTING #########

# Plot effects of SVL on date of day of first capture
First_gg <- plot(ggpredict(First_glmm, terms = "svl [all]"), colors = "green3")+
  theme_classic()+
  labs(
    x = "SVL (mm)",
    y = "Day of first capture in the year",
    title = ""
  )
# Plot effects of SVL on date of day of last capture
Last_gg <- plot(ggpredict(Last_glmm, terms = "svl [all]"), colors = "black")+
  theme_classic()+
  labs(
    x = "SVL (mm)",
    y = "Day of last capture in the year",
    title = ""
  )

# Plot effects of SMI on date of day of first capture
First_gg_SMI <- plot(ggpredict(First_glmm, terms = "gtSMI [all]"), colors = "green3")+
  theme_classic()+
  labs(
    x = "SMI (g)",
    y = "Day of first capture in the year",
    title = ""
  )
# Plot effects of SMI on date of day of last capture
Last_gg_SMI <- plot(ggpredict(Last_glmm, terms = "gtSMI [all]"), colors = "black")+
  theme_classic()+
  labs(
    x = "SMI (g)",
    y = "Day of last capture in the year",
    title = ""
  )

# combine plots and create a PDF of Figure 3
pdf(file = "Figure_3.pdf",   # The directory you want to save the file in
    width = 8, # The width of the plot in inches
    height = 8) 
First_gg + Last_gg + First_gg_SMI + Last_gg_SMI + plot_annotation(tag_levels = 'a', tag_prefix = '(', tag_suffix = ')')
dev.off()

#make summary tables for the results 
tab_model(First_glmm,show.intercept = F, show.icc=F,show.stat =T,string.stat="z",
          pred.labels = c("Scaled mass index", "Snout vent length"), file = "Table_1.doc")

tab_model(Last_glmm,show.intercept = F, show.icc=F,show.stat =T,string.stat="z",
          pred.labels = c("Scaled mass index", "Snout vent length"), file = "Table_2.doc")



