## Crude prevalence ratio Class 2 Obesity  

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
dataprev_1 <- dataprev %>% filter(type_obesity == "Class 1 Obesity" | type_obesity == "Class 2 Obesity")

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
poisson_fit <- glm(atelectasis ~ type_obesity + age + sex + sleep_apnea,
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



## Crude prevalence ratio Class 3 Obesity  

# Prepare subset of BMI class 1 and 3:   
dataprev_2 <- dataprev %>% filter(type_obesity == "Class 1 Obesity" | type_obesity == "Class 3 Obesity")

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
poisson_fit <- glm(atelectasis ~ type_obesity + 
                     age + sex + sleep_apnea,
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
model_output_prev_2_adj <- cbind(
  Estimate = exp(coef(poisson_fit)),
  `Robust SE` = se,
  Lower = exp(coef(poisson_fit) - qnorm(0.975) * se),
  Upper = exp(coef(poisson_fit) + qnorm(0.975) * se)
)

# Coerce model_output into a data frame
model_output_prev_2_adj <- as.data.frame(round(model_output_prev_2_adj, 2))
model_output_prev_2_adj


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

table_output <- rbind.data.frame(table_output_prev_1,
                                 table_output_prev_2)

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

table_output2 <- rbind.data.frame(table_output_prev_1_adj,
                                  table_output_prev_2_adj)

table2 <- dplyr::bind_cols(table_output, table_output2) %>%
  rownames_to_column(var = "Category") %>%
  mutate_at("Category", str_replace, "type_obesity", "")

flextable(table2) %>%
  save_as_docx(path = paste0(tabfolder, "/Table2.docx"))
