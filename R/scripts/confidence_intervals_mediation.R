#### I built this specific script with assistance of OpenAI's GPT-3
#### language model (version 3.5) on 6 April 2024. My prompts asked
#### for suggestions on how to readapt my code to make the functions 
#### work with the boot package, which I am familiar with. Therefore,
#### all code other than the definition of functions is my own.  

### Confidence intervals BMI linear model  
# Confidence intervals for the BMI term, shows value before exponentiating:   

# Function to extract coefficients
coefficients_function <- function(data, indices) {
  fit <- glm(
    spo2_fraction ~ BMI,
    weights = weight1,
    data = data[indices, ],
    family = quasibinomial(link = "logit")
  )
  return(coef(fit)["BMI"])
}

# Bootstrap resampling
set.seed(2023)

boot_results <- boot(
  data = data_spo2_low_linear,
  statistic = coefficients_function,
  R = 10000
)

# Compute confidence intervals
boot_ci <- boot.ci(boot_results, type = "all")

boot_ci

#Save exponentiated values 
beta_model_linear_BMI <- round(exp(model_linear_BMI$coefficients[2]),2)
ci_lower_model_linear_BMI <- round(exp(boot_ci$bca[4]),2)
ci_higher_model_linear_BMI <- round(exp(boot_ci$bca[5]),2)



### Confidence intervals BMI plus atelectasis linear model  
# Confidence intervals for the BMI term, shows value before exponentiating:  

# Function to extract coefficients
coefficients_function <- function(data, indices) {
  fit <- glm(
    spo2_fraction ~ BMI + atelectasis_percent,
    weights = weight,
    data = data[indices, ],
    family = quasibinomial(link = "logit")
  )
  return(coef(fit)["BMI"])
}

# Bootstrap resampling
set.seed(2023)

boot_results <- boot(
  data = data_spo2_low_linear,
  statistic = coefficients_function,
  R = 10000
)

# Compute confidence intervals
boot_ci <- boot.ci(boot_results, type = "all")

boot_ci

#Save exponentiated values 
beta_BMI <- round(exp(model_linear_BMI_atelectasis$coefficients[2]),2)
ci_lower_BMI <- round(exp(boot_ci$bca[4]),2)
ci_higher_BMI <- round(exp(boot_ci$bca[5]),2)


# Confidence intervals for the BMI term, shows value before exponentiating:  

# Function to extract coefficients
coefficients_function <- function(data, indices) {
  fit <- glm(
    spo2_fraction ~ BMI + atelectasis_percent,
    weights = weight,
    data = data[indices, ],
    family = quasibinomial(link = "logit")
  )
  return(coef(fit)["atelectasis_percent"])
}

# Bootstrap resampling
set.seed(2023)

boot_results <- boot(
  data = data_spo2_low_linear,
  statistic = coefficients_function,
  R = 10000
)

# Compute confidence intervals
boot_ci <- boot.ci(boot_results, type = "all")

boot_ci

#Save exponentiated values 
beta_atelectasis <- round(exp(model_linear_BMI_atelectasis$coefficients[3]),2)
ci_lower_atelectasis <- round(exp(boot_ci$bca[4]),2)
ci_higher_atelectasis <- round(exp(boot_ci$bca[5]),2)

# Create a table 
tableS <- data.frame(
  Characteristic = c(
    "Total effect of BMI", 
    "BMI",
    "Direct and indirect effects of BMI",
    "BMI",
    "Atelectasis percent"
  ),
  OR = c(
    "", 
    beta_model_linear_BMI,
    "",
    beta_BMI,
    beta_atelectasis
  ),
  CI = c(
    "", 
    paste0(ci_lower_model_linear_BMI,"—",ci_higher_model_linear_BMI),
    "",
    paste0(ci_lower_BMI,"—",ci_higher_BMI),
    paste0(ci_lower_atelectasis,"—",ci_higher_atelectasis)
  )
) %>% rename("95%CI" = CI)

# Save table   

flextable(tableS) %>%
  save_as_docx(path = paste0(tabfolder, "/TableS.docx"))
