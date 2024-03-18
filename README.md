######################
######- README -###### 
######################

###### CORRESPONDING PUBLICATION ######
Burgstaller, S., A. Horvath, M.-L. Aiglsperger, M. Spießberger, M. Staufer and L. Landler. 2024.
Body size and condition, not allochrony cause temporally distinct reproductive peaks in a prolonged breeding anuran. Oecologia xxx:xxx-xxx.


###### AUTHORS ###### 
Stephan Burgstaller 1*, Andras Horvath 1, Marie-Luise Aiglsperger 2, Magdalena Spießberger 1, Martina Staufer 3 and Lukas Landler 1*
1 University of Natural Resources and Life Sciences Vienna, Institute of Zoology, Gregor-Mendel-Strasse 33, 1180 Vienna, Austria
2 University of Vienna, Department of Evolutionary Biology, Djerassiplatz 1, 1030 Vienna, Austria
3 Lindenbauergasse 13, 1110, Vienna, Austria
* Corresponding authors: Stephan Burgstaller, Gregor-Mendel-Strasse 33, 1180 Vienna, stephan.burgstaller@boku.ac.at and Lukas Landler, Gregor-Mendel-Strasse 33, 1180 Vienna, lukas.landler@boku.ac.at


###### AUTHOR CONTRIBUTIONS ######
Stephan Burgstaller and Lukas Landler wrote all scripts and designed the statistical analyses.
Andras Horvath collected most of the data in 2021.
Marie-Luise Aiglsperger collected most of the data in 2023.
Magdalena Spießberger, Martina Staufer and Stephan Burgstaller were involved in the data collection and organization over the whole timespan of the study. 
Stephan Burgstaller and Lukas Landler led the writing of the manuscript. All authors contributed critically to the drafts and gave final approval for publication.


###### ABSTRACT ###### 
Individual phenological life history variations in context of seasonal conditions are well documented in fishes and birds.
However, amphibians, a group heavily affected by habitat loss and fragmentation, have received relatively little attention regarding research on life history adaptations.
Here we present three years of data on the timing of reproductive activity in a suburban green toad population.
We found annually consistent patterns of reproductive activity and investigated whether these were caused by allochrony or individual traits.
Body size (a proxy for age) and body condition significantly affected the timing of reproduction.
However, most individuals showed considerable overlap in their reproductive timeframe, refuting the existence of allochronic subpopulations.
Our findings may indicate life history adaptations in the direction of a faster lifestyle in response to hazardous environments.
We propose to focus further research efforts on phenological variations in the context of environmental conditions, and that the phenology of amphibian populations should be considered more strongly in conservation efforts.


###### LIST OF FILES ######
First_last_glmm.R
Plot_fig1.R
Plot_fig2.R
data_for_Fig1A.csv
data_for_Fig2.csv
data_for_glmm.csv


###### FILE DESCRIPTIONS ######

First_last_glmm.R
R-script to run two generalized linear mixed models for the dependent variables fist and last capture, respectively.
Snout-Vent-Length (SVL) and Scaled-Mass-Index (SMI) are fixed factors in both models.
We included ID and year as random factors in both models.
This script also creates DOC files containing tables showing the results for each model, respectively (Table_1.doc, Table_2.doc).
Furthermore, it dreates a PDF file containing the predictions for the significant effects of each model (Figure_3.pdf).

Plot_fig1.R
R-script to create Figure_1 and export it as a PDF file.

Plot_fig2.R
R-script to create Figure_2 and export it as a PDF file.

data_for_glmm.csv
Data file containing the data used in the script First_last_glmm.R and to create Figure_1B in the script Plot_fig1.R

data_for_Fig1A.csv
Data file containing the data used in the script Plot_fig1.R to plot Figure_1A

data_for_Fig2.csv
Data file containing the data used in the script Plot_fig2.R to plot Figure_2


###### DATA FILE CONTENT (VARIABLES) ######

Data file: data_for_glmm.csv
Each row indicates a capture event
Arrival - factor indicating if the capture was a first or last capture
Year - factor indicating the year of the capture event
date - date on which the capture occurred
ID - unique identifier for each individual
location - loaction at which the capture occurred
mass - mas of the captured animal in gramms
svl - snout-vent-length og the captured animal in millimeters
dead - factor indicating if the captured animal was alive (0) or dead (1)
sex - factor indicating the captured animal's sex (f = female; m = male; u = unsexed)
year -
Day_of_the_year - number indicating the day of the year the capture occurred

Data file: data_for_Fig1A.csv
Each row indicates a capture event
date - date on which the capture occurred
ID - unique identifier for each individual
location - loaction at which the capture occurred
mass - mas of the captured animal in gramms
svl - snout-vent-length og the captured animal in millimeters
dead - factor indicating if the captured animal was alive (0) or dead (1)
sex - factor indicating the captured animal's sex (f = female; m = male; u = unsexed)
year - factor indicating the year of the capture event
Count - always 1; used when creating the histograms so every capture weighs the same
Day_of_the_year - number indicating the day of the year the capture occurred
year -
Day_of_the_year - number indicating the day of the year the capture occurred

Data file: data_for_Fig2.csv
Each row indicates a capture event
Arrival - factor indicating if the capture was a first or last capture
Year - factor indicating the year of the capture event
date - date on which the capture occurred
ID - unique identifier for each individual
location - loaction at which the capture occurred
mass - mas of the captured animal in gramms
svl - snout-vent-length og the captured animal in millimeters
dead - factor indicating if the captured animal was alive (0) or dead (1)
sex - factor indicating the captured animal's sex (f = female; m = male; u = unsexed


###### INFORMATION ON PACKAGES, SOFTWARE & DEPENDENCIES ######

R version 4.3.2 (2023-10-31 ucrt)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 19045)

Matrix products: default

locale:
[1] LC_COLLATE=German_Austria.utf8  LC_CTYPE=German_Austria.utf8   
[3] LC_MONETARY=German_Austria.utf8 LC_NUMERIC=C                   
[5] LC_TIME=German_Austria.utf8    

time zone: Europe/Vienna
tzcode source: internal

attached base packages:
[1] parallel  stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] scales_1.3.0          splitstackshape_1.4.8 ggpubr_0.6.0         
 [4] foreach_1.5.2         lubridate_1.9.3       forcats_1.0.0        
 [7] stringr_1.5.1         purrr_1.0.2           readr_2.1.5          
[10] tibble_3.2.1          tidyverse_2.0.0       readxl_1.4.3         
[13] dplyr_1.1.3           tidyr_1.3.0           ggplot2_3.4.4        
[16] magrittr_2.0.3        MASS_7.3-60           smatr_3.4-8          
[19] data.table_1.15.0     sjPlot_2.8.15         patchwork_1.2.0      
[22] ggeffects_1.4.0       buildmer_2.11         glmmTMB_1.1.8        

loaded via a namespace (and not attached):
 [1] sjlabelled_1.2.0    tidyselect_1.2.0    TH.data_1.1-2       bayestestR_0.13.2  
 [5] sjstats_0.18.2      estimability_1.4.1  timechange_0.3.0    lifecycle_1.0.4    
 [9] survival_3.5-7      compiler_4.3.2      rlang_1.1.1         tools_4.3.2        
[13] utf8_1.2.4          knitr_1.45          ggsignif_0.6.4      abind_1.4-5        
[17] multcomp_1.4-25     withr_3.0.0         numDeriv_2016.8-1.1 grid_4.3.2         
[21] fansi_1.0.5         xtable_1.8-4        colorspace_2.1-0    emmeans_1.10.0     
[25] iterators_1.0.14    insight_0.19.8      cli_3.6.1           mvtnorm_1.2-4      
[29] generics_0.1.3      rstudioapi_0.15.0   performance_0.10.8  modelr_0.1.11      
[33] tzdb_0.4.0          minqa_1.2.6         splines_4.3.2       cellranger_1.1.0   
[37] vctrs_0.6.4         boot_1.3-28.1       Matrix_1.6-4        sandwich_3.1-0     
[41] carData_3.0-5       car_3.1-2           hms_1.1.3           rstatix_0.7.2      
[45] glue_1.6.2          nloptr_2.0.3        codetools_0.2-19    stringi_1.8.3      
[49] gtable_0.3.4        lme4_1.1-35.1       munsell_0.5.0       pillar_1.9.0       
[53] R6_2.5.1            TMB_1.9.9           lattice_0.22-5      backports_1.4.1    
[57] broom_1.0.5         Rcpp_1.0.11         coda_0.19-4.1       nlme_3.1-164       
[61] mgcv_1.9-0          xfun_0.42           zoo_1.8-12          sjmisc_2.8.9       
[65] pkgconfig_2.0.3    
