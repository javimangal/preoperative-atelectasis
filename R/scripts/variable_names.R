for (variable in names(data)) {
  if (variable == "ID") {
    data$ID <- as.character(data$ID)
  }

  if (variable == "age") {
    units(data$age) <- "years"
    table1::label(data$age) <- "Age"
  }

  if (variable == "sex") {
    data$sex <- data$sex %>% 
      factor() %>% 
      fct_recode("1"="Woman", "2"="Man") %>% 
      as.character() %>% 
      factor(
        levels = c("1","2"),
        labels = c("Woman","Man")
        )
    table1::label(data$sex) <- "Sex"
  }

  if (variable == "weight") {
    units(data$weight) <- "kilograms (kg)"
    table1::label(data$weight) <- "Weight"
  }

  if (variable == "height") {
    units(data$height) <- "meters (m)"
    table1::label(data$height) <- "Height"
  }

  if (variable == "BMI") {
    units(data$BMI) <- "kg/m²"
    table1::label(data$BMI) <- "Body mass index"
  }

  if (variable == "type_obesity") {
    data$type_obesity <- factor(data$type_obesity)
    table1::label(data$type_obesity) <- "Obesity class"
  }

  if (variable == "ARISCAT") {
    units(data$ARISCAT) <- "score"
    table1::label(data$ARISCAT) <- "ARISCAT"
  }

  if (variable == "ARISCAT_group") {
    data$ARISCAT_group <- factor(data$ARISCAT_group)
    table1::label(data$ARISCAT_group) <- "ARISCAT risk group"
  }

  if (variable == "ASA") {
    data$ASA <- factor(data$ASA)
    table1::label(data$ASA) <- "ASA physical status"
  }

  if (variable == "spo2_VPO") {
    units(data$spo2_VPO) <- "%"
    table1::label(data$spo2_VPO) <- "Oxygen saturation (SpO2)"
  }

  if (variable == "surgical_procedure") {
    data$surgical_procedure <- factor(data$surgical_procedure)
    table1::label(data$surgical_procedure) <- "Surgical procedure"
  }

  if (variable == "CORADS") {
    data$CORADS <- factor(data$CORADS, ordered = TRUE)
    table1::label(data$CORADS) <- "CO-RADS"
  }

  if (variable == "atelectasis") {
    data$atelectasis <- factor(data$atelectasis) %>%
      relevel("Yes", "No") # Relevel for convenience to visualize 2x2 tables.
    table1::label(data$atelectasis) <- "Atelectasis"
  }

  if (variable == "atelectasis_location") {
    data$atelectasis_location <- factor(data$atelectasis_location)
    table1::label(data$atelectasis_location) <- "Atelectasis location"
  }

  if (variable == "atelectasis_percent") {
    units(data$atelectasis_percent) <- "%"
    table1::label(data$atelectasis_percent) <- "Percentage of atelectasis"
  }

  if (variable == "hb") {
    units(data$hb) <- "g/dL"
    table1::label(data$hb) <- "Hemoglobin"
  }

  if (variable == "hct") {
    units(data$hct) <- "%"
    table1::label(data$hct) <- "Hematocrit"
  }

  if (variable == "leu") {
    units(data$leu) <- "10³/µL"
    table1::label(data$leu) <- "WBC count"
  }

  if (variable == "neu_percent") {
    units(data$neu_percent) <- "%"
    table1::label(data$neu_percent) <- "Neutrophils (percent)"
  }

  if (variable == "neu_absolute") {
    units(data$neu_absolute) <- "10³/µL"
    table1::label(data$neu_absolute) <- "Neutrophils (absolute)"
  }

  if (variable == "linf_percent") {
    units(data$linf_percent) <- "%"
    table1::label(data$linf_percent) <- "Lymphocytes (percent)"
  }

  if (variable == "linf_absolute") {
    units(data$linf_absolute) <- "10³/µL"
    table1::label(data$linf_absolute) <- "Lymphocytes (absolute)"
  }

  if (variable == "mon_percent") {
    units(data$mon_percent) <- "%"
    table1::label(data$mon_percent) <- "Monocytes (percent)"
  }

  if (variable == "mon_absolute") {
    units(data$mon_absolute) <- "10³/µL"
    table1::label(data$mon_absolute) <- "Monocytes (absolute)"
  }

  if (variable == "platelets") {
    units(data$platelets) <- "cells/µL"
    table1::label(data$platelets) <- "Platelets"
  }

  if (variable == "glucose") {
    units(data$glucose) <- "mg/dL"
    table1::label(data$glucose) <- "Glucose"
  }

  if (variable == "urea") {
    units(data$urea) <- "mg/dL"
    table1::label(data$urea) <- "Urea"
  }

  if (variable == "creatinine") {
    units(data$creatinine) <- "mg/dL"
    table1::label(data$creatinine) <- "Creatinine"
  }

  if (variable == "state_residence") {
    data$state_residence <- as.factor(data$state_residence)
    table1::label(data$state_residence) <- "State of residence"
  }

  if (variable == "altitude") {
    data$altitude <- as.numeric(data$altitude)
    units(data$altitude) <- "meters"
    table1::label(data$altitude) <- "Mean altitude"
  }

  if (variable == "surgery_performed") {
    data$surgery_performed <- factor(data$surgery_performed)
    table1::label(data$surgery_performed) <- "Surgery performed"
  }
  
  if (variable == "myocardial_infarction") {
    data$myocardial_infarction <- factor(data$myocardial_infarction)
    table1::label(data$myocardial_infarction) <- "Acute Myocardial Infarction"
  }
  
  if (variable == "tuberculosis") {
    data$tuberculosis <- factor(data$tuberculosis)
    table1::label(data$tuberculosis) <- "Tuberculosis"
  }
  
  if (variable == "asthma") {
    data$asthma <- factor(data$asthma)
    table1::label(data$asthma) <- "Asthma"
  }
  
  if (variable == "COPD") {
    data$COPD <- factor(data$COPD)
    table1::label(data$COPD) <- "COPD"
  }
  
  if (variable == "oxygen_use") {
    data$oxygen_use <- factor(data$oxygen_use)
    table1::label(data$oxygen_use) <- "Oxygen use"
  }
  
  if (variable == "sleep_apnea") {
    data$sleep_apnea <- factor(data$sleep_apnea)
    table1::label(data$sleep_apnea) <- "Obstructive sleep apnea"
  }
  
  if (variable == "CPAP_use") {
    data$CPAP_use <- factor(data$CPAP_use)
    table1::label(data$CPAP_use) <- "CPAP"
  }
  
  if (variable == "hypertension") {
    data$hypertension <- factor(data$hypertension)
    table1::label(data$hypertension) <- "Hypertension"
  }

  if (variable == "diabetes") {
    data$diabetes <- factor(data$diabetes)
    table1::label(data$diabetes) <- "Diabetes"
  }

  if (variable == "hypothyroidism") {
    data$hypothyroidism <- factor(data$hypothyroidism)
    table1::label(data$hypothyroidism) <- "Hypothyroidism"
  }

  if (variable == "dyslipidemia") {
    data$dyslipidemia <- factor(data$dyslipidemia)
    table1::label(data$dyslipidemia) <- "Dyslipidemia"
  }

  if (variable == "antidepressant_use") {
    data$antidepressant_use <- factor(data$antidepressant_use)
    table1::label(data$antidepressant_use) <- "Antidepressants use"
  }

  if (variable == "other_comorb") {
    data$other_comorb <- factor(data$other_comorb)
    table1::label(data$other_comorb) <- "Other comorbidities"
  }

  if (variable == "rapid_covid_test") {
    data$rapid_covid_test <- as.factor(data$rapid_covid_test)
  }

  if (variable == "PCR_covid") {
    data$PCR_covid <- as.factor(data$PCR_covid)
  }

  if (variable == "prior_covid19") {
    data$prior_covid19 <- factor(data$prior_covid19)
    table1::label(data$prior_covid19) <- "Prior COVID-19"
  }
}

rm(variable)
