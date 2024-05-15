#I start with each component

base$libra_heart_disease <- ifelse(base$heart_failure_pre == 1 | 
                                     base$myocardial_infarction_pre == 1 |
                                     base$arritmia_pre == 1 |
                                     base$cardiac_surgery_pre == 1, 1,0) 

base$libra_diabetes <- ifelse(base$hba1c_base > 6.5, 1.3,0) 

base$libra_colesterolemia <- ifelse(base$ldl_base > 130 |
                                      base$hdl_base < 40, 1.4,0)

#base$diastolic <- (base$bp_diastolic1_base+base$bp_diastolic2_base)/2
#base$systolic <- (base$bp_systolic1_base+base$bp_systolic2_base)/2
base$libra_hipertension <- ifelse(base$bp_diastolic1_base > 85 | 
                                    base$bp_systolic1_base > 130, 1.6, 0) 

base$libra_depresion <- ifelse(base$gds_total_score_base > 6, 2.1, 0) 

base$libra_obesidad <- ifelse(base$bmi_base >= 30, 1.6,0)

base$libra_tabaquismo <- ifelse(base$tobacco_pre ==1, 1.5,0)

base$libra_sedentarismo <- ifelse(base$ipaq_score_base ==0 | 
                                    base$ipaq_score_base == 1,1.1,0)

base$libra_enf_renal <- ifelse(base$creatinine_base > 1.1,1.1,0)

base$libra_alcoholismo <- ifelse(base$ifa18_base <= 5 & #menor a 5-6 latas por semana
                                   base$ifa19_base < 5 & #vino menor a 5-6 vasos por semana
                                   base$ifa20_base < 5 &#vino blanco igual que el anterior
                                   base$ifa21_base < 2, #menos de 1 medida por semana (licor)
                                 -1,0)

base$libra_dieta <- ifelse(base$mind_score_class == "healthy",-1.7,0)

base$libra_actividad_cognitiva <- ifelse(base$education_pre ==16 &
                                           base$cdr_communal_5_base == 1,-3.2,0)


#TOTAL SCORE
base$libra_total_score <- rowSums(base[, c("libra_actividad_cognitiva",
                                           "libra_alcoholismo",
                                           "libra_colesterolemia",
                                           "libra_depresion",
                                           "libra_diabetes",
                                           "libra_dieta",
                                           "libra_enf_renal",
                                           "libra_heart_disease",
                                           "libra_hipertension",
                                           "libra_obesidad",
                                           "libra_sedentarismo",
                                           "libra_tabaquismo")])

length(base$libra_total_score)

#I DELETE NA's
base <- base[complete.cases(base[, c("libra_actividad_cognitiva",
                                     "libra_alcoholismo",
                                     "libra_colesterolemia",
                                     "libra_depresion",
                                     "libra_diabetes",
                                     "libra_dieta",
                                     "libra_enf_renal",
                                     "libra_heart_disease",
                                     "libra_hipertension",
                                     "libra_obesidad",
                                     "libra_sedentarismo",
                                     "libra_tabaquismo")]), ]

#Oh, I have only 956 full records
length(base$libra_total_score)
