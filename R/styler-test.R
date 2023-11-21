table1::label(data$age) <- "Age"
units(data$age) <- "years"

table1::label(data$sex) <- "Sex"
data$sex <- factor(data$sex,
  levels = c(1, 2),
  labels = c("Woman", "Man")
)


table1::label(data$weight) <- "Weight"
units(data$weight) <- "kilograms (kg)"

table1::label(data$height) <- "Height"
units(data$height) <- "meters (m)"

table1::label(data$type_obesity) <- "Obesity class"
data$type_obesity <- factor(data$type_obesity,
  levels = c(1, 2, 3),
  labels = c(
    "Class 1 Obesity",
    "Class 2 Obesity",
    "Class 3 Obesity"
  )
)

table1::label(data$ARISCAT) <- "ARISCAT"
units(data$ARISCAT) <- "score"

table1::label(data$ARISCAT_group) <- "ARISCAT risk group"
data$ARISCAT_group <- factor(data$ARISCAT_group,
  levels = c(1, 2, 3),
  labels = c(
    "Low Risk",
    "Intermediate Risk",
    "High Risk"
  )
)


table1::label(data$ASA) <- "ASA physical status"
data$ASA <- factor(data$ASA,
  levels = c(1, 2, 3),
  labels = c("ASA 1", "ASA 2", "ASA 3")
)

table1::label(data$spo2_VPO) <- "Oxygen saturation (SpO2)"
units(data$spo2_VPO) <- "%"

table1::label(data$surgical_procedure) <- "Surgical procedure"
data$surgical_procedure <- factor(data$surgical_procedure,
  levels = c(1, 2, 3, 4),
  labels = c(
    "SG", # 'SG' = Sleeve Gastrectomy
    "RYGB", # 'RYGB' = Roux-en-Y gastric bypass
    "OAGB", # 'OAGB' = One anastomosis gastric bypass
    "LBGS" # 'LBGS' = lap-band to sleeve
  )
)

table1::label(data$CORADS) <- "CO-RADS"
data$CORADS <- factor(data$CORADS,
  levels = c(1, 2, 3, 4),
  labels = c(
    "CO-RADS 1",
    "CO-RADS 2",
    "CO-RADS 3",
    "CO-RADS 4"
  ),
  ordered = TRUE
)

table1::label(data$atelectasis) <- "Atelectasis"
data$atelectasis <- factor(data$atelectasis,
  levels = c(0, 1),
  labels = c("No", "Yes")
) %>%
  relevel("Yes", "No") # Relevel done for convenience to visualize 2x2 tables.

table1::label(data$atelectasis_location) <- "Atelectasis location"
data$atelectasis_location <- factor(data$atelectasis_location,
  levels = c(1, 2),
  labels = c("Unilateral", "Bilateral")
)

table1::label(data$atelectasis_percent) <- "Percentage of atelectasis"
units(data$atelectasis_percent) <- "%"

table1::label(data$hb) <- "Hemoglobin"
units(data$hb) <- "g/dL"

table1::label(data$hct) <- "Hematocrit"
units(data$hct) <- "%"

table1::label(data$leu) <- "WBC count"
units(data$leu) <- "10³/µL"

table1::label(data$neu_percent) <- "Neutrophils (percent)"
units(data$neu_percent) <- "%"

table1::label(data$neu_absolute) <- "Neutrophils (absolute)"
units(data$neu_absolute) <- "10³/µL"

table1::label(data$linf_percent) <- "Lymphocytes (percent)"
units(data$linf_percent) <- "%"

table1::label(data$linf_absolute) <- "Lymphocytes (absolute)"
units(data$linf_absolute) <- "10³/µL"

table1::label(data$mon_percent) <- "Monocytes (percent)"
units(data$mon_percent) <- "%"

table1::label(data$mon_absolute) <- "Monocytes (absolute)"
units(data$mon_absolute) <- "10³/µL"

table1::label(data$platelets) <- "Platelets"
units(data$platelets) <- "cells/µL"

table1::label(data$glucose) <- "Glucose"
units(data$glucose) <- "mg/dL"

table1::label(data$urea) <- "Urea"
units(data$urea) <- "mg/dL"

table1::label(data$creatinine) <- "Creatinine"
units(data$creatinine) <- "mg/dL"

data$rapid_covid_test <- as.factor(data$rapid_covid_test) %>%
  fct_recode(negative = "0")

data$PCR_covid <- as.factor(data$PCR_covid) %>% fct_recode(negative = "0")

table1::label(data$state_residence) <- "State of residence"
data$state_residence <- as.factor(data$state_residence)

data$altitude <- as.numeric(data$altitude)
table1::label(data$altitude) <- "Mean altitude"
units(data$altitude) <- "meters"

table1::label(data$surgery_performed) <- "Surgery performed"
data$surgery_performed <- factor(data$surgery_performed,
  levels = c(0, 1),
  labels = c("No", "Yes")
)

table1::label(data$hypertension) <- "Hypertension"
data$hypertension <- factor(data$hypertension,
  levels = c(0, 1),
  labels = c("No", "Yes")
)

table1::label(data$diabetes) <- "Diabetes"
data$diabetes <- factor(data$diabetes,
  levels = c(0, 1),
  labels = c("No", "Yes")
)

table1::label(data$sleep_apnea) <- "Obstructive sleep apnea"
data$sleep_apnea <- factor(data$sleep_apnea,
  levels = c(0, 1),
  labels = c("No", "Yes")
)

table1::label(data$hypothyroidism) <- "Hypothyroidism"
data$hypothyroidism <- factor(data$hypothyroidism,
  levels = c(0, 1),
  labels = c("No", "Yes")
)

table1::label(data$dyslipidemia) <- "Dyslipidemia"
data$dyslipidemia <- factor(data$dyslipidemia,
  levels = c(0, 1),
  labels = c("No", "Yes")
)

table1::label(data$antidepressant_use) <- "Antidepressants use"
data$antidepressant_use <- factor(data$antidepressant_use,
  levels = c(0, 1),
  labels = c("No", "Yes")
)

table1::label(data$prior_covid19) <- "Prior COVID-19"
data$prior_covid19 <- factor(data$prior_covid19,
  levels = c(0, 1),
  labels = c("No", "Yes")
)

table1::label(data$other_comorb) <- "Other comorbidities"
data$other_comorb <- factor(data$other_comorb,
  levels = c(0, 1),
  labels = c("No", "Yes")
)

str(data)
