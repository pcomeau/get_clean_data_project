README file for Tidy Data Set Average Measurment by Activity and Subject
========================================================

The script run_Analysis.R performs transformations on the "Human Activity Recognition Using Smartphones Data Set" described in the code book for this data set CodeBook.md 

Steps for executing analysis script:

1. Invoke R Studio 

2. Download/copy script to a new working directory/folder

3. Set your working directory using the setwd() R command

4. Execute the analysis script within R Studio by invoking: source("run_analysis.R")

5. The script will download and unzip appropriate data files, perform associated transfotmations, then write the aggregated tidy data set to a csv formatted file "subjectActivityMean.txt" in the working directory

6. Open the resulting file within R using the read.csv("subjectActivityMean.csv") command. Refer the code book (CodeBook.md) for further details of the resulting tidy data file.

