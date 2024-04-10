## Crude prevalence ratio BMI 40-45 

# Prepare variable by using 0 and 1 as required by the model code:
dataprev <- data %>%
  mutate(atelectasis = as.numeric(
    as.character(
      fct_recode(atelectasis,
                 "0" = "No",
                 "1" = "Yes"
      )
    )
  ))

# Prepare subset of BMI class 1 and 2:   
dataprev_1 <- dataprev %>% 
  filter(type_obesity == "30-35" | type_obesity == "40-45") %>% 
  droplevels()

poisson_fit <- glm(atelectasis ~ type_obesity,
                   data = dataprev_1,
                   family = poisson(link = log)
)

tidy(poisson_fit, exponentiate = TRUE, conf.int = TRUE)


# Robust standard errors:
covmat <- vcovHC(poisson_fit, type = "HC0")
covmat

# Calculate the standard error
se <- sqrt(diag(covmat))

# Bind together model output
#  1. exponentiated coefficients
#  2. robust standard errors
#  3. 95% confidence intervals
# Note that qnorm(0.975) approximately equals 1.96
model_output_prev_1 <- cbind(
  Estimate = exp(coef(poisson_fit)),
  `Robust SE` = se,
  Lower = exp(coef(poisson_fit) - qnorm(0.975) * se),
  Upper = exp(coef(poisson_fit) + qnorm(0.975) * se)
)

# Coerce model_output into a data frame
model_output_prev_1 <- as.data.frame(round(model_output_prev_1, 2))
model_output_prev_1



## Adjusted prevalence ratio  Class 2 Obesity
poisson_fit <- glm(
  atelectasis ~ type_obesity + age + sex + altitude_cat,
  data = dataprev_1,
  family = poisson(link = log)
)

tidy(poisson_fit, exponentiate = TRUE, conf.int = TRUE)

# Robust standard errors:
covmat <- vcovHC(poisson_fit, type = "HC0")
covmat

# Calculate the standard error
se <- sqrt(diag(covmat))

# Bind together model output
#  1. exponentiated coefficients
#  2. robust standard errors
#  3. 95% confidence intervals
# Note that qnorm(0.975) approximately equals 1.96
model_output_prev_1_adj <- cbind(
  Estimate = exp(coef(poisson_fit)),
  `Robust SE` = se,
  Lower = exp(coef(poisson_fit) - qnorm(0.975) * se),
  Upper = exp(coef(poisson_fit) + qnorm(0.975) * se)
)

# Coerce model_output into a data frame
model_output_prev_1_adj <- as.data.frame(round(model_output_prev_1_adj, 2))
model_output_prev_1_adj



## Crude prevalence ratio BMI 45-50  

# Prepare subset of BMI class 1 and 3:   
dataprev_2 <- dataprev %>% 
  filter(type_obesity == "30-35" | type_obesity == "45-50") %>% 
  droplevels()

poisson_fit <- glm(atelectasis ~ type_obesity,
                   data = dataprev_2,
                   family = poisson(link = log)
)

tidy(poisson_fit, exponentiate = TRUE, conf.int = TRUE)


# Robust standard errors:
covmat <- vcovHC(poisson_fit, type = "HC0")
covmat

# Calculate the standard error
se <- sqrt(diag(covmat))

# Bind together model output
#  1. exponentiated coefficients
#  2. robust standard errors
#  3. 95% confidence intervals
# Note that qnorm(0.975) approximately equals 1.96
model_output_prev_2 <- cbind(
  Estimate = exp(coef(poisson_fit)),
  `Robust SE` = se,
  Lower = exp(coef(poisson_fit) - qnorm(0.975) * se),
  Upper = exp(coef(poisson_fit) + qnorm(0.975) * se)
)

# Coerce model_output into a data frame
model_output_prev_2 <- as.data.frame(round(model_output_prev_2, 2))
model_output_prev_2


## Adjusted prevalence ratio  Class 2 Obesity
poisson_fit <- glm(
  atelectasis ~ type_obesity + age + sex + sleep_apnea + asthma,
  data = dataprev_2,
  family = poisson(link = log)
)

#No conversion when adjusting for altitude category. 
#Thus, altitude category was excluded for adjustment in this model. 

tidy(poisson_fit, exponentiate = TRUE, conf.int = TRUE)

# Robust standard errors:
covmat <- vcovHC(poisson_fit, type = "HC0")
covmat

# Calculate the standard error
se <- sqrt(diag(covmat))

# Bind together model output
#  1. exponentiated coefficients
#  2. robust standard errors
#  3. 95% confidence intervals
# Note that qnorm(0.975) approximately equals 1.96
model_output_prev_2_adj <- cbind(
  Estimate = exp(coef(poisson_fit)),
  `Robust SE` = se,
  Lower = exp(coef(poisson_fit) - qnorm(0.975) * se),
  Upper = exp(coef(poisson_fit) + qnorm(0.975) * se)
)

# Coerce model_output into a data frame
model_output_prev_2_adj <- as.data.frame(round(model_output_prev_2_adj, 2))
model_output_prev_2_adj


## Crude prevalence ratio BMI >50    

# Prepare subset of BMI class 1 and 3:   
dataprev_3 <- dataprev %>% 
  filter(type_obesity == "30-35" | type_obesity == "≥50") %>% 
  droplevels()

poisson_fit <- glm(atelectasis ~ type_obesity,
                   data = dataprev_3,
                   family = poisson(link = log)
)

tidy(poisson_fit, exponentiate = TRUE, conf.int = TRUE)


# Robust standard errors:
covmat <- vcovHC(poisson_fit, type = "HC0")
covmat

# Calculate the standard error
se <- sqrt(diag(covmat))

# Bind together model output
#  1. exponentiated coefficients
#  2. robust standard errors
#  3. 95% confidence intervals
# Note that qnorm(0.975) approximately equals 1.96
model_output_prev_3 <- cbind(
  Estimate = exp(coef(poisson_fit)),
  `Robust SE` = se,
  Lower = exp(coef(poisson_fit) - qnorm(0.975) * se),
  Upper = exp(coef(poisson_fit) + qnorm(0.975) * se)
)

# Coerce model_output into a data frame
model_output_prev_3 <- as.data.frame(round(model_output_prev_3, 2))
model_output_prev_3



## Adjusted prevalence ratio  Class 2 Obesity
poisson_fit <- glm(
  atelectasis ~ type_obesity + age + sex + altitude_cat,
  data = dataprev_3,
  family = poisson(link = log)
)

tidy(poisson_fit, exponentiate = TRUE, conf.int = TRUE)

# Robust standard errors:
covmat <- vcovHC(poisson_fit, type = "HC0")
covmat

# Calculate the standard error
se <- sqrt(diag(covmat))

# Bind together model output
#  1. exponentiated coefficients
#  2. robust standard errors
#  3. 95% confidence intervals
# Note that qnorm(0.975) approximately equals 1.96
model_output_prev_3_adj <- cbind(
  Estimate = exp(coef(poisson_fit)),
  `Robust SE` = se,
  Lower = exp(coef(poisson_fit) - qnorm(0.975) * se),
  Upper = exp(coef(poisson_fit) + qnorm(0.975) * se)
)

# Coerce model_output into a data frame
model_output_prev_3_adj <- as.data.frame(round(model_output_prev_3_adj, 2))
model_output_prev_3_adj


## Table 2
# Merge output table for unadjusted models:   
table_output_prev_1 <- model_output_prev_1 %>%
  dplyr::slice(2) %>%
  rename(PR = Estimate, SE = `Robust SE`) %>%
  mutate("95%CI" = paste(Lower, Upper, sep = "-")) %>%
  select(-c(Lower, Upper))

table_output_prev_2 <- model_output_prev_2 %>%
  dplyr::slice(2) %>%
  rename(PR = Estimate, SE = `Robust SE`) %>%
  mutate("95%CI" = paste(Lower, Upper, sep = "-")) %>%
  select(-c(Lower, Upper))

table_output_prev_3 <- model_output_prev_3 %>%
  dplyr::slice(2) %>%
  rename(PR = Estimate, SE = `Robust SE`) %>%
  mutate("95%CI" = paste(Lower, Upper, sep = "-")) %>%
  select(-c(Lower, Upper))


table_output <- rbind.data.frame(
  table_output_prev_1,
  table_output_prev_2,
  table_output_prev_3
  )

#Calculate E-values for adjusted models   
evalue_model_1 <- evalues.RR(
  est = model_output_prev_1_adj$Estimate[2],
  lo = model_output_prev_1_adj$Lower[2],
  hi = model_output_prev_1_adj$Upper[2]
) %>% 
  data.frame %>% 
  dplyr::slice(2)

evalue_model_2 <- evalues.RR(
  est = model_output_prev_2_adj$Estimate[2],
  lo = model_output_prev_2_adj$Lower[2],
  hi = model_output_prev_2_adj$Upper[2]
) %>% 
  data.frame %>% 
  dplyr::slice(2)

evalue_model_3 <- evalues.RR(
  est = model_output_prev_3_adj$Estimate[2],
  lo = model_output_prev_3_adj$Lower[2],
  hi = model_output_prev_3_adj$Upper[2]
) %>% 
  data.frame %>% 
  dplyr::slice(2)

evalues <- rbind(
  evalue_model_1,
  evalue_model_2,
  evalue_model_3
) %>% 
  select(-upper) %>% 
  rename(
    Evalue = point, 
    Evalue_lower = lower) %>% 
  round(2)


# Merge output table for adjusted models:  
table_output_prev_1_adj <- model_output_prev_1_adj %>%
  dplyr::slice(2) %>%
  rename(aPR = Estimate, aSE = `Robust SE`) %>%
  mutate("a95%CI" = paste(Lower, Upper, sep = "-")) %>%
  select(-c(Lower, Upper))

table_output_prev_2_adj <- model_output_prev_2_adj %>%
  dplyr::slice(2) %>%
  rename(aPR = Estimate, aSE = `Robust SE`) %>%
  mutate("a95%CI" = paste(Lower, Upper, sep = "-")) %>%
  select(-c(Lower, Upper))

table_output_prev_3_adj <- model_output_prev_3_adj %>%
  dplyr::slice(2) %>%
  rename(aPR = Estimate, aSE = `Robust SE`) %>%
  mutate("a95%CI" = paste(Lower, Upper, sep = "-")) %>%
  select(-c(Lower, Upper))

table_output2 <- rbind.data.frame(
  table_output_prev_1_adj,
  table_output_prev_2_adj,
  table_output_prev_3_adj
  )

# Merge two tables   
table2 <- dplyr::bind_cols(table_output, table_output2, evalues) %>%
  rownames_to_column(var = "Category") %>%
  mutate_at("Category", str_replace, "type_obesity", "")

flextable(table2) %>%
  save_as_docx(path = paste(tabfolder, "/Table2_appendage.docx", sep = ""))
