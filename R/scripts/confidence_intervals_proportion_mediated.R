#### I built this specific script with assistance of OpenAI's GPT-3
#### language model (version 3.5) on 6 April 2024. My prompts asked
#### for suggestions on how to readapt my code to make the functions 
#### work with the boot package, which I am familiar with. Therefore,
#### all code other than the definition of functions is my own.  

### Confidence intervals for the proportion mediated 

# Set seed for reproducibility
set.seed(2023)

# Define function to calculate total effect
calculate_total_effect_BMI <- function(data) {
  model_linear_BMI <- glm(
    spo2_fraction ~ BMI, 
    weights = data$weight1, 
    data = data, 
    family = quasibinomial(link = logit)
  )
  
  total_effect_BMI <- coef(model_linear_BMI)["BMI"]
  return(total_effect_BMI)
}

# Define function to calculate direct effect
calculate_direct_effect_BMI <- function(data) {
  model_linear_BMI_atelectasis <- glm(
    spo2_fraction ~ BMI + atelectasis_percent, 
    weights = data$weight, 
    data = data, 
    family = quasibinomial(link = logit)
  )
  
  direct_effect_BMI <- coef(model_linear_BMI_atelectasis)["BMI"]
  return(direct_effect_BMI)
}

# Define function to calculate proportion mediated
calculate_proportion_mediated <- function(direct_effect_BMI, total_effect_BMI) {
  proportion_mediated <- 1 - (direct_effect_BMI / total_effect_BMI)
  return(proportion_mediated)
}

# Bootstrap function
boot_fun <- function(data, indices) {
  total_effect_BMI <- calculate_total_effect_BMI(data[indices, ])
  direct_effect_BMI <- calculate_direct_effect_BMI(data[indices, ])
  calculate_proportion_mediated(direct_effect_BMI, total_effect_BMI)
}

# Run bootstrap
boot_results <- boot(data = data_spo2_low_linear, statistic = boot_fun, R = 1000)

# Calculate 95% confidence interval
conf_interval <- boot.ci(boot_results, type = "all")

