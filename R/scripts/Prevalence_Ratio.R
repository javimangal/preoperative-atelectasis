## Crude prevalence ratio

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


poisson_fit <- glm(atelectasis ~ type_obesity,
  data = dataprev,
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
model_output <- cbind(
  Estimate = exp(coef(poisson_fit)),
  `Robust SE` = se,
  Lower = exp(coef(poisson_fit) - qnorm(0.975) * se),
  Upper = exp(coef(poisson_fit) + qnorm(0.975) * se)
)

# Coerce model_output into a data frame
model_output <- as.data.frame(round(model_output, 2))
model_output



## Adjusted prevalence ratio
poisson_fit <- glm(atelectasis ~ type_obesity + age + sex + sleep_apnea,
  data = dataprev,
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
model_output2 <- cbind(
  Estimate = exp(coef(poisson_fit)),
  `Robust SE` = se,
  Lower = exp(coef(poisson_fit) - qnorm(0.975) * se),
  Upper = exp(coef(poisson_fit) + qnorm(0.975) * se)
)

# Coerce model_output into a data frame
model_output2 <- as.data.frame(round(model_output2, 2))
model_output2


## Table 2
table_output <- model_output %>%
  dplyr::slice(2:3) %>%
  rename(PR = Estimate, SE = `Robust SE`) %>%
  mutate("95%CI" = paste(Lower, Upper, sep = "-")) %>%
  select(-c(Lower, Upper))

table_output2 <- model_output2 %>%
  dplyr::slice(2:3) %>%
  rename(aPR = Estimate, aSE = `Robust SE`) %>%
  mutate("a95%CI" = paste(Lower, Upper, sep = "-")) %>%
  select(-c(Lower, Upper))

table2 <- dplyr::bind_cols(table_output, table_output2) %>%
  rownames_to_column(var = "Category") %>%
  mutate_at("Category", str_replace, "type_obesity", "")

flextable(table2) %>%
  save_as_docx(path = paste(tabfolder, "/Table2.docx", sep = ""))
