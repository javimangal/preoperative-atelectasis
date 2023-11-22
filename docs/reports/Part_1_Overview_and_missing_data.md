---
title: "Preoperative Atelectasis"
subtitle: "Part 1: Overview, selection criteria, and missing data"
author: "Javier Mancilla Galindo"
date: last rendered on "2023-11-22"
output: 
  html_document:
    toc: true
    toc_float: true
    theme: default
    highlight: pygments
---

# Setup 


#### Packages used    

```r
if (!require("pacman", quietly = TRUE)) {
  install.packages("pacman")
}

pacman::p_load(
  tidyverse, # Used for basic data handling and visualization.
  overviewR, # Used to assess missing data.
  table1, #Used to add labels to variables.
  ezknitr #Used to generate html output in a different folder   
)
```

















































