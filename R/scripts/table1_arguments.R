# Group variables by distribution:
normal <- c(
  "age",
  "height",
  "hb",
  "hct",
  "leu",
  "neu_absolute",
  "linf_absolute",
  "mon_absolute",
  "platelets",
  "urea",
  "creatinine"
)
nonormal <- c(
  "weight",
  "BMI",
  "spo2_VPO",
  "neu_percent",
  "linf_percent",
  "glucose",
  "atelectasis_percent",
  "mon_percent",
  "altitude"
)

# Then apply statement to use output to render table 1:
for (name in normal) {
  cat(name, "=", switch(EXPR = name,
    '"Mean (SD)",'
  ), "\n")
}
for (name in nonormal) {
  cat(name, "=", switch(EXPR = name,
    '"Median [Q1, Q3]",'
  ), "\n")
}

# Log abbreviations to render table 1

abbreviations <- sort(
  c(
    "body-mass index (BMI)",
    "peripheral saturation of oxygen (SpO2)",
    "COVID-19 Reporting and Data System (CO-RADS)",
    "sleeve gastrectomy (SG)",
    "roux-en-Y gastric bypass (RYGB)",
    "one anastomosis gastric bypass (OAGB)",
    "lap-band to gastric sleeve (LBGS)",
    "coronavirus disease (COVID-19)",
    "Assess Respiratory Risk in Surgical Patients in Catalonia (ARISCAT)",
    "white blood cell (WBC)"
  )
)
abbreviations_stats <- sort(
  c(
    "standard deviation (SD)",
    "interquartile range (IQR)",
    "percentage (%)",
    "25th percentile (Q1)",
    "75th percentile (Q3)"
  )
)

# Render funtion for table
rndr <- function(x, name, ...) {
  if (!is.numeric(x)) {
    return(render.categorical.default(x))
  }
  what <- switch(name,
    age = "Mean (SD)",
    height = "Mean (SD)",
    hb = "Mean (SD)",
    hct = "Mean (SD)",
    leu = "Mean (SD)",
    neu_absolute = "Mean (SD)",
    linf_absolute = "Mean (SD)",
    mon_absolute = "Mean (SD)",
    platelets = "Mean (SD)",
    urea = "Mean (SD)",
    creatinine = "Mean (SD)",
    weight = "Median [Q1, Q3]",
    BMI = "Median [Q1, Q3]",
    spo2_VPO = "Median [Q1, Q3]",
    neu_percent = "Median [Q1, Q3]",
    linf_percent = "Median [Q1, Q3]",
    glucose = "Median [Q1, Q3]",
    atelectasis_percent = "Median [Q1, Q3]",
    mon_percent = "Median [Q1, Q3]",
    altitude = "Median [Q1, Q3]"
  )
  parse.abbrev.render.code(c("", what))(x)
}

# Generate table 1:
table1 <- table1(
  ~ sex + age + weight + height + BMI + surgical_procedure +
    ARISCAT_group + CORADS + spo2_VPO + altitude + myocardial_infarction + 
    hypertension + diabetes + asthma + COPD + sleep_apnea + oxygen_use + 
    CPAP_use + hypothyroidism + dyslipidemia + antidepressant_use |
    type_obesity,
  data = data,
  overall = c(left = "Total"),
  render = rndr,
  caption = "Table 1. Clinical characteristics of patients, according to obesity class.",
  footnote = c(abbreviations, abbreviations_stats)
)

# Save as word document:
properties <- prop_section(
  page_size = page_size(
    orient = "landscape",
    width = 8.3, height = 11.7
  ),
  type = "continuous",
  page_margins = page_mar()
)

t1flex(table1) %>%
  save_as_docx(
    path = paste(tabfolder, "/Table1.docx", sep = ""),
    pr_section = properties
  )
