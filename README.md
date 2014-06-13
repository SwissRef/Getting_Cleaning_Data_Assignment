
==================================================================
Coursera - Getting & Cleaning Data Course
Course Assignment
==================================================================

This assignment makes use of data from the following website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

Reference to, and Acknowledgement is given to the following publication
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

==================================================================
Contents of this Repository

README.md - this readme file
run_analysis.R - a R Script that creates the analysis
Code_book.pdf - a Code book explaining the data labels
TidyData.txt - the result of the R script

==================================================================

R Programming Script:
R Script is called run_analysis.R

Assumptions:
The required data has been downloaded into the working directory, keeping the folder structure in place
So the directory structure is@ [working directory] \getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset
This UCI HAR Dataset directory has the directories [test] and [train]

R script requires the following packages:
reshape2
plyr

==================================================================

Structure and method of the Script

At the top is the getdata function. This is called from the main script, to read in the data from the required files.
This simply uses read.table to read in the data from either test or train. 
It column binds all the data, to create a full data set of the test/train data

Below this is the required R code for each step of the assignment, labelled for each step. 

Step 1
Uses the getdata function to read the required files. Then it row binds the test and train data together
This is possible as the original experiment picked randomn subjects to be the "test" subjects, meaning all the data 
is of the same format.

After this step the data is in the form: dataframe with 10299 rows, and 563 columns. 
The columns are called: Subject_id, Activity_id, and V1:V561


Step 2
Reads in all the features from the features.txt file, and finds the relevant rows. 
I have assumed all data contains:
- Mean data = mean() 
- Standard Deviation data = std()
- Mean Frequency = meanFreq()
I have chosen to exclude the angle() style measurements, as these are calculated fields. 
They can easily be included if necessary, by chaning the grep function.  

Uses the melt command to create a data set with only the required features 
The melt command takes the columns 1:2 (Subject_id and Activity_id) as the fixed fields, and then selects from 
columns V1:V561 those chosen by the grep command, and turns all the data into a single column. 
This makes the calculations later easier.  
The reason for the "+2" on the rowreq variable, is due to the 2 extra columns (for subject and activity id) in the data set


Step 3
To apply the descriptive activity names I have read these in, and set the labels for the levels of the factor to be the 
descriptive names. 
This means there is one column, with both numerical data (1-6) and character data (Walking etc)


Step 4
Uses the gsub function to replace the current variable names with more descriptive ones. These are defined in the code book. 
The variable searchterm needs to contain the required terms for the search
The variable replaceterm needs to contain the replacement. 
These two variable must be of the same length, with the replacement in the same place in the variable as the relevant 
search term. 

A FOR loop is used to cycle through the variables, applying the gsub function. 
This step only creates the column/variable names. They are not actually applied until Step 5 (data is not in a sensible 
format to apply it at this stage). They could be applied at this stage by recasting the data and setting the column names 
(as done in step 5), but then it would be necessary to melt the data.frame again to complete step 5.


Step 5
To calculate the mean for each unique variable, accorind to the subject id and activity id, the ddply function was used. 
The ddply function takes the data set (from step 3), and splits it according to the Activity id, Subject ID and 
variable - which are the names of the data fields (the features) 
The mean function was applied to the data values.

The data is then recast, taking the variable field, and making columns from it, so there is only variable to each column. 
After this the columns/variables are given their descriptive names (As defined in Step 4).


Final step
The data is written to the working directory.
The output file is a text file called TidyData.txt
The data is comma separated. 