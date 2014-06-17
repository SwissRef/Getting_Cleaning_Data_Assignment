Coursera: Getting and Cleaning Data Course
===========================================

Code Book for Assignment
------------------------

**Structure of Data**  
Data is in 81 columns, and 181 rows (including header)  
* Columns 1 & 2 define to subject and the activity
* Columns 3 to 68 contain the experimental data
* Experimental data was normalised and bounded to [-1,1]

**Column 1: Subject_id**  
A number from 1: 30 that links to the test person in the experiment.


**Column 2: Activity_id**  
1 of 6 activities that define the activity the subject was doing when the measurements were taken  
1.	WALKING: subject was walking
2.	WALKING_UPSTAIRS: subject was walking upstairs
3.	WALKING_DOWNSTAIRS: subject was walking downstairs
4.	SITTING: subject was sitting
5.	STANDING: subject was standing up
6.	LAYING: subject was laying down


**Column 3: 68**

These columns have headings that define the measurement. Each measurement is the mean for the relevant subject, for the relevant activity, over a number of tests.  
The original data was first normalised and bounded to [-1,1]  
The header breaks down as follows:(note not all headers have all levels)  
*Level1_Level2_Level3_Level4_Level5_Level6 

*Level 1: indicate which domain the measurement falls into. Time or Frequency*  
*Time: the measure is a unit of time (duration of measurement)
*Frequency: a measure of frequency (frequency of measurement) (calculated by a Fast Fourier Transform on the time measurements)

*Level 2: indicate why there was a measurement*  
*Body-motion: indicates the measurement was due to the body of the subject
*Gravity: indicates the measurement was the result of gravity

*Level 3: define which of the devices 2 sensors took the measurement*  
The device's sensors are: An Accelerometer (linear acceleration) and a Gyroscope (angular velocity)  
*Accelerometer: indicates the measurement is a linear acceleration measurement from the devices accelerometer
*Gyroscope: indicates the measurement is an angular velocity measurement from the devices gyroscope
*Jerk: a cacluated field derived from the Accelerometer and Gyroscope data

*Level 4: indicates the measurement is a magnitude of the measurements (using Euclidean norm)*  
*Magnitude: the magnitude of the measurement

*Level 5: indicates what mathematical functions have been carried out on the underlying data*  
*Mean: the measurement itself was a mean of an underlying measurement
*Std-Deviation: the standard deviation of the underlying measurements
*Mean-Frequency: the measurement itself was the mean of the frequency

*Level 6: indicate in which 3D plane of the device the measurement was recorded*  
*X-Axis: the measurement was in the X direction of the device
*Y-Axis: the measurement was in the Y direction of the device
*Z-Axis: the measurement was in the Z direction of the device
