# Navigating Factors Deemed Important Among Working Americans

## Overview
This paper explores the public opinions of American adults on 3 factors that could be considered important in an occupation. Respondents were instructed to use a Likert Scale (1 - very important, 2 - important, 3 - neither, 4 - not important, 5 - not important at all) to rank their perspective for the following 3 prompts:
1. A job that allows someone to help other people?
2. An interesting job?
3. A job that is useful to society?

## Repo  Structure
`inputs` contains the sketches part of the planning process and a LLM usage statement.

`outputs` contains the cleaned data files used for data visualization, along with the files used to generate the paper, including the Quarto document, the bibliography file, and the finalized version of the paper in the form of a PDF.

`scripts` contains the graph replications and R scripts used to simulate, download, clean, and test the data.

## Replication 
1. Follow the steps in the GSS Data section below to retrieve the raw data.
2. Run `scripts/02-data_cleaning.R` to generate cleaned data
3. Render `outputs/paper/workplace_satisfaction.qmd` to generate the PDF of the paper

## GSS Data
Due to the file’s large size and Github limitations, we were unable to upload the raw data retrieved from the GSS Data Explorer website and the converted CSV version of the raw data to this repository. In order to run the files in the scripts folder (more specifically, the `01-download_data.R file`), attend to the following instructions:
1. Visit the website https://gssdataexplorer.norc.org/gss_data and download the STATA Format Download file.
2. Once a file named GSS_stata.zip is finished downloading, unzip the file. There should be two PDF files, one TXT file, and a DTA file.
3. Locate the DTA file and rename it to GSS7218_R1.dta. Move it to the `inputs` folder so that the path is "inputs/data/GSS7218_R1.dta"

## Statement on LLM usage
No LLMs were used in the research, replication, or writing of this paper. 
