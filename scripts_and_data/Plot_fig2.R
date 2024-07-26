
######## LIBRARIES ########
# plotting
library("ggeffects") # this is for the predictions 
library("patchwork") 
library("sjPlot") 
library("ggplot2") 
library("ggpubr") 
#other
library("data.table") 
library("tidyverse") #package for pipe _ data wrangling (info: a pipe is this "%>%")
library("lubridate")

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
                                        error.plot = "crossbar",
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



# Session info:

# R version 4.3.2 (2023-10-31 ucrt)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 19045)
# 
# Matrix products: default
# 
# 
# locale:
#   [1] LC_COLLATE=German_Austria.utf8  LC_CTYPE=German_Austria.utf8    LC_MONETARY=German_Austria.utf8 LC_NUMERIC=C                   
# [5] LC_TIME=German_Austria.utf8    
# 
# time zone: Europe/Vienna
# tzcode source: internal
# 
# attached base packages:
#   [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
#   [1] lubridate_1.9.3   forcats_1.0.0     stringr_1.5.1     dplyr_1.1.3       purrr_1.0.2       readr_2.1.5       tidyr_1.3.0      
# [8] tibble_3.2.1      tidyverse_2.0.0   data.table_1.15.0 ggpubr_0.6.0      ggplot2_3.4.4     sjPlot_2.8.15     patchwork_1.2.0  
# [15] ggeffects_1.4.0   glmmTMB_1.1.9    
# 
# loaded via a namespace (and not attached):
#   [1] gtable_0.3.4        TMB_1.9.9           xfun_0.42           bayestestR_0.13.2   rstatix_0.7.2       insight_0.19.8     
# [7] lattice_0.22-5      tzdb_0.4.0          numDeriv_2016.8-1.1 vctrs_0.6.4         tools_4.3.2         sjstats_0.18.2     
# [13] generics_0.1.3      sandwich_3.1-0      fansi_1.0.5         pkgconfig_2.0.3     Matrix_1.6-4        DHARMa_0.4.6       
# [19] lifecycle_1.0.4     compiler_4.3.2      sjmisc_2.8.9        munsell_0.5.0       codetools_0.2-19    carData_3.0-5      
# [25] car_3.1-2           pillar_1.9.0        nloptr_2.0.3        MASS_7.3-60         abind_1.4-5         boot_1.3-28.1      
# [31] multcomp_1.4-25     nlme_3.1-164        tidyselect_1.2.0    sjlabelled_1.2.0    stringi_1.8.3       performance_0.10.8 
# [37] mvtnorm_1.2-4       splines_4.3.2       grid_4.3.2          colorspace_2.1-0    cli_3.6.1           magrittr_2.0.3     
# [43] survival_3.5-7      utf8_1.2.4          broom_1.0.5         TH.data_1.1-2       withr_3.0.0         scales_1.3.0       
# [49] backports_1.4.1     timechange_0.3.0    estimability_1.4.1  modelr_0.1.11       emmeans_1.10.0      lme4_1.1-35.1      
# [55] ggsignif_0.6.4      hms_1.1.3           zoo_1.8-12          coda_0.19-4.1       knitr_1.45          mgcv_1.9-0         
# [61] rlang_1.1.1         Rcpp_1.0.11         xtable_1.8-4        glue_1.6.2          rstudioapi_0.15.0   minqa_1.2.6        
# [67] R6_2.5.1  

