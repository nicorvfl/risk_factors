#LIBRARIES
library(dplyr)
library(reshape2)
library(summarytools)
library(ggplot2)

#DATABASE

base_cruda <- dataset_MDRF
base <- base_cruda[!is.na(base_cruda$rdz_yn_scr) & base_cruda$rdz_yn_scr == 1,]

#FACTORS
base$country_pre <- as.factor(base$country_pre)
base$male_pre <- as.factor(base$male_pre)


