<br/>
<p align="center">
  <a href="https://github.com/javimangal/preoperative-atelectasis">
    <img src="PABA.jpg" alt="PABA logo" width="80%">
  </a>
</p>

[![Static Badge](https://img.shields.io/badge/peer_reviewed_article-10.1213%2FANE.0000000000007166-yellow)](https://doi.org/10.1213/ane.0000000000007166)
[![Repository DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10211242.svg)](https://doi.org/10.5281/zenodo.10211242) [![Dataverse](https://img.shields.io/badge/Dataverse%20DOI-10.7910/DVN/4JZZLB-red)](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/4JZZLB) [![Preprint DOI](https://img.shields.io/badge/preprint_DOI-10.1101%2F2024.01.11.24301138v2-%23000080?label=medRxiv&link=https%3A%2F%2Fwww.medrxiv.org%2Fcontent%2F10.1101%2F2024.01.11.24301138v2)](https://www.medrxiv.org/content/10.1101/2024.01.11.24301138v2)

# Description

This repository contains the documentation for reproducibility of the study ***"Preoperative atelectasis in patients with obesity undergoing bariatric surgery: a cross-sectional study"***. The current status of the repository is reflective of the [original research paper](https://doi.org/10.1213/ane.0000000000007166) published in the peer-reviewed journal [*Anesthesia & Analgesia*](https://journals.lww.com/anesthesia-analgesia/pages/default.aspx). The linked dataset for this study can be found in the [Harvard Dataverse](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/4JZZLB). 

The manuscript was priorly published as a preprint, available through [medRxiv](https://www.medrxiv.org/content/10.1101/2024.01.11.24301138v2).  

This study was presented as a [poster](docs/manuscript/Poster-WEON-2024.pdf) in the Annual Netherlands Epidemiology Congress [WEON 2024](https://weon.nl/). 

## Getting started

In order to replicate these analyses, I suggest that the user follows these steps:
1. Install [R and RStudio](https://posit.co/download/rstudio-desktop/) on your computer if you haven't done so. (Note that these analyses were conducted under R version 4.3.3 and RStudio 2023.12.1).
2. [Clone this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository). If you do not know how to do this, [you can follow these instructions](https://docs.github.com/en/desktop/overview/getting-started-with-github-desktop). Alternatively, you can go to [zenodo](https://zenodo.org/doi/10.5281/zenodo.10211241) and download the ZIP file, unpack it, and place it in a folder in your computer.
3. You should now have all these files in your computer with an identical folder structure (described in the following section).
4. In the main directory, open the file named ***preoperative_atelectasis.Rproj*** in RStudio.
5. You can navigate through the folders on the right-bottom panel of R Studio. Open the **R** folder. You should now see a series of files starting with ***Part\_*** and ending with ***.qmd***.
6. Open one of these files. You can run every chunk of code sequentially to reproduce the analyses. Make sure to respect the order and if something fails, I recommend that you start running al chunks of code from the beginning. If you don't know how to run a chunk of code, you can [imitate what this person is doing](https://youtu.be/RPF6gGyeJmg?feature=shared&t=30). If you get a message saying "Access denied", change from *Visual* to *Source* mode which can be done with the Ctrl+Shift+F4 command.   

I recommend that the **.qmd** files are opened and ran in sequential order, although some may only be interested in one of the parts of the analyses. If you are not able to follow the prior steps, you may also consider reviewing the [PDF reports](docs/reports) documenting the analyses. The sequence of these files is as follows:

-   [Part 1](R/Part_1_Overview_and_missing_data.qmd). Application of selection criteria and assessment of missing data. [PDF](docs/reports/Part_1_Overview_and_missing_data.pdf)
-   [Part 2](R/Part_2_Descriptives.qmd). Descriptive analyses. [PDF](docs/reports/Part_2_Descriptives.pdf)
-   [Part 3](R/Part_3_Independent_variables.qmd). Assessment of relationships between independent variables. [PDF](docs/reports/Part_3_Independent_variables.pdf)
-   [Part 4](R/Part_4_Outcomes.qmd). Assessment of outcomes. [PDF](docs/reports/Part_4_outcomes.pdf)
-   [Part 5](R/Part_5_Statistical_Modelling_Atelectasis.qmd). Statistical modelling: Atelectasis. [PDF](docs/reports/Part_5_Statistical_Modelling_Atelectasis.pdf)
-   [Part 6](R/Part_6_Statistical_Modelling_SpO2.qmd). Mediation analysis of the effect of BMI on SpO2, mediated through atelectasis. [PDF](docs/reports/Part_6_Statistical_Modelling_SpO2.pdf)
-   [Part 7](R/Part_7_Posthoc_analysis.qmd). Posthoc analyses. [PDF](docs/reports/Part_7_Posthoc_analysis.pdf)
-   [Part 8](R/Part_8_Statistical_Modelling_Low_SpO2.qmd). Mediation analysis of the effect of BMI on SpO2, mediated through atelectasis, distinguishing between high and low SpO2 values. [PDF](docs/reports/Part_8_Statistical_Modelling_Low_SpO2.pdf)

Although I have made significant efforts to ensure reproducibility of this project, I encourage you to [contact me](mailto:j.mancillagalindo@uu.nl) or post a request in this repository in case you encounter any issues.   

## Project Structure

The project structure distinguishes three kinds of folders:
- read-only (RO): not edited by either code or researcher
- human-writeable (HW): edited by the researcher only.
- project-generated (PG): folders generated when running the code; these folders can be deleted or emptied and will be completely reconstituted as the project is run.

```         
.
├── .gitignore
├── CITATION.cff
├── LICENSE
├── README.md
├── preoperative_atelectasis.Rproj
├── data                  <- All project data files
│   ├── processed         <- The final, canonical data sets for modeling. (PG)
│   ├── raw               <- The original, immutable data. (RO)
│   └── temp              <- Intermediate data that has been transformed. (PG)
├── docs                  <- Documentation for users (HW)
│   ├── manuscript        <- Manuscript source, docx. (HW)
│   ├── reports           <- Project reports, pdf. (HW)
│   └── DAG               <- Directed Acyclic Graph documentation, txt. (HG)
├── results
│   ├── output_figures    <- Figures for the manuscript or reports (PG)
│   └── output_tables     <- Output tables for the manuscript (PG)
└── R                     <- Source code for this project (HW)
│   ├── scripts           <- Scripts sourced in main R markdown documents (PG)
│   └── sessions          <- Text files with information of R sessions (PG)
└── renv                  <- Packaging dependencies (RO)
```

## Documentation

The full documentation with comments of statistical analyses can be found in the [reports folder](docs/reports). Each PDF file documents sequential parts of the analyses, identified as Part 1 to Part 8 files as mentioned before. These reports describe the operating system of R and package versions dependencies to reproduce each part of the analyses. I have also included package dependencies in the **renv** folder in a lockfile. 

## License

This project is licensed under the terms of the [MIT License](/LICENSE).

This project structure repository is adapted from the [Utrecht University simple R project template](https://github.com/UtrechtUniversity/simple-r-project), which builds upon the [Good Enough Project](https://github.com/bvreede/good-enough-project) Cookiecutter template by Barbara Vreede (2019).
