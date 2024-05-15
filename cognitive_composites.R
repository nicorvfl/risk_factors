#First step: normalization

base$mmse <- scale(base$mmse_total_pre)
base$fcsrt_free_recall <- scale(base$totalfreerecall_base)
base$fcsrt_total_recall <- scale(base$totalfreerecall_2_base)
base$logical_memory_inm <- scale(base$imm_recalltotal_base)
base$claves <- scale(base$score_wais_bruto_base)
base$tmt_a <- scale(base$tima_trail_a_base)
base$tmt_b <- scale(base$tima_trail_b_base)
base$span_dir <- scale(base$forwardtotcorrect_base)
base$span_inv <- scale(base$backwardtotcorrect_base)
base$span_sec <- scale(base$sequencetotcorrect_base)
base$stroop_pc <- scale(base$stroop_pc_base)
base$stroop_p <- scale(base$stroop_p_base)
base$stroop_c <- scale(base$stroop_c_base)
base$logical_memory_dif <- scale(base$delayed_recalltotal_base)
base$cst <- scale(base$shifting_score_base)
base$cst_a <- scale(base$csta_base)
base$cst_c <- scale(base$tiempo_parte_c_base)
base$flu_fon <- scale(base$p_total_score_base)
base$animaltotcorrect_vc_base <- as.numeric(base$animaltotcorrect_vc_base)
base$flu_sem <- scale(base$animaltotcorrect_vc_base)
base$animaltotcorrect_vc_base <- as.numeric(base$animaltotcorrect_vc_base)
base$tmt_shifting <- base$tmt_b - base$tmt_a
base$country_pre <- as.factor(base$country_pre)

#Calculations

base$ntb_global <- rowMeans(base[, c("fcsrt_free_recall", "fcsrt_total_recall",
                                     "logical_memory_dif", "logical_memory_inm", "claves",
                                     "tmt_a", "tmt_b", "span_dir", "flu_sem", "span_inv",
                                     "span_sec", "stroop_pc", "cst", "flu_fon")])

base$ntb_memoria <- rowMeans(base[,c("fcsrt_free_recall","fcsrt_total_recall",
                                     "logical_memory_inm","logical_memory_dif")], na.rm = TRUE)


base$ntb_velocidad <- rowMeans(base[,c("stroop_c","cst_a","tmt_a","claves")], na.rm = TRUE)
base$ntb_ejecutivo <- rowMeans(base[,c("cst_c","stroop_c","tmt_shifting","flu_fon",
                                       "claves","span_dir","span_inv")], na.rm = TRUE)

