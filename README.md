<br/>
<p align="center">
  <a href="https://github.com/javimangal/preoperative-atelectasis">
    <img src="PABA.jpg" alt="PABA logo" width="80%">
  </a>
</p>

[![DOI](https://zenodo.org/badge/721526178.svg)](https://zenodo.org/doi/10.5281/zenodo.10211241)
[![Dataverse](<https://img.shields.io/badge/Dataverse DOI-10.7910/DVN/4JZZLB-red>)](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/4JZZLB)

# Description 
This repository contains the documentation for reproducibility of the study "Preoperative atelectasis in patients with obesity undergoing bariatric surgery: a cross-sectional study". The linked dataset for this study can be found in the [Harvard Dataverse](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/4JZZLB). The manuscript for this study will be made public shortly as a preprint.     

## Getting started  
In order to replicate these analyses, I suggest that the user follows these steps:  
1. Install [R and RStudio](https://posit.co/download/rstudio-desktop/) on your computer if you haven't done so. (Note that these analyses were conducted under R version 4.3.2 and RStudio 2023.09.1).  
2. [Clone this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository). If you do not know how to do this, [you can follow these instructions](https://docs.github.com/en/desktop/overview/getting-started-with-github-desktop). 
3. You should have all the files with an identical folder structure describe in the section bellow in you computer.   
4. In the main directory, open the file named ***preoperative_atelectasis.Rproj*** in RStudio.  
5. You can navigate through the folders on the right-bottom panel. Open the **R** folder. You should now see a series of files starting with ***Part_*** and ending with ***.qmd***.   
6. Open one of these files. You can run every chunk of code sequentially to reproduce the analyses. Make sure to respect the order and if something fails, I recommend that you start running al chunks of code from the beginning. If you don't know how to run a chunk of code, you can [imitate what this person is doing](https://youtu.be/RPF6gGyeJmg?feature=shared&t=30). If you get a message saying "Access denied", change from *Visual* to *Source* mode which can be done with the Ctrl+Shift+F4 command.       

If you are not able to follow steps 2 to 5, you can alternatively download all of the files in this repository and replicate the same folder structure in your computer. After making sure that you have all files in the correct order, you can manually navigate to the **preoperative-atelectasis/R** folder in your computer and follow the step 6 described above.   

I recommend that the **.qmd** files are opened and run in sequential order, although some may only be interested in one of the parts of the analyses. If you are not able to follow the prior steps, you may also consider reviewing the [PDF reports](docs/reports) documenting the analyses. The sequence of these files is as follows:  

* [Part 1](R/Part_1_Overview_and_missing_data.qmd). Application of selection criteria and assessment of missing data. [PDF](docs/reports/Part_1_Overview_and_missing_data.pdf)   
* [Part 2](R/Part_2_Descriptives.qmd). Descriptive analyses. [PDF](docs/reports/Part_2_Descriptives.pdf)   
* [Part 3](R/Part_3_Independent_variables.qmd). Assessment of relationships between independent variables. [PDF](docs/reports/Part_3_Independent_variables.pdf)   
* [Part 4](R/Part_4_Outcomes.qmd). Assessment of outcomes. [PDF](docs/reports/Part_4_outcomes.pdf)   
* [Part 5](R/Part_5_Statistical_Modelling_Atelectasis.qmd). Statistical modelling: Atelectasis. [PDF](docs/reports/Part_5_Statistical_Modelling_Atelectasis.pdf)   
* [Part 6](R/Part_6_Statistical_Modelling_SpO2.qmd). Statistical modelling: SpO2. [PDF](docs/reports/Part_6_Statistical_Modelling_SpO2.pdf)    
* [Part 7](R/Part_7_Posthoc_analysis.qmd). Posthoc analyses. [PDF](docs/reports/Part_7_Posthoc_analysis.pdf)   
* [Part 8](R/Part_8_Statistical_Modelling_SpO2.qmd). Statistical modelling: SpO2 without removing outliers. [PDF](docs/reports/Part_8_Statistical_Modelling_SpO2.pdf)  

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
├── requirements.txt
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
The full documentation with comments of statistical analyses can be found in the [reports folder](docs/reports). Each PDF file documents sequential parts of the analyses, identified as Part 1 to Part 8 files as mentioned before. These reports describe the operating system of R and package versions dependencies to reproduce each part of the analyses. It is my plan to publish these reports as html files in the short-term for better integration of documentation and intuitive navigation. I have also included package dependencies in the **renv** folder in a lockfile. My aim for the next days is to test that all analyses can be run in a different computer as well as including a [Binder](https://mybinder.org/) where all analyses can be replicated without the need of installing any software.  

## License
This project is licensed under the terms of the [MIT License](/LICENSE).

This project structure template repository is adapted from the [Good Enough Project](https://github.com/bvreede/good-enough-project) Cookiecutter template by Barbara Vreede (2019).
