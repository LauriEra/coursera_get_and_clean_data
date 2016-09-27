# coursera_get_and_clean_data
A repository for Coursera course getting and cleaning data course project

## Contains an r-script for making a tidy data-set from smartphone data and a codebook describing the variables.

### run_analysis.R

Reads in train and test data regarding smartphone accelerometer and gyroscope based variables and what the subject being measured was doing at the time of measuring.
The data read in are different variables constructed from the original measurements, so the data read in are not the raw measurements.
From the available variables only the means and standard deviations are chosen.
Finally the script produces a tidy data-set with the averages of the chosen variables for each available subject label combination.

This script expects that at the first line the working directory is set correctly to where "getdata%2Fprojectfiles%2FUCI HAR Dataset.zip" has been unzipped.

### CodeBook.md

Contains descriptions of the available variables.
