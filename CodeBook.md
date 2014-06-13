Coursera - Getting and Cleaning Data Course
Code Book for Assignment

Structure of Data
•	Data is in 68 columns, and 180 rows
•	Columns 1 & 2 define to subject and the activity
•	Columns 3-68 contain the experimental data
•	Experimental data was normalised and bounded to [-1,1]

Column 1
•	Subject_id
	o	A number from 1 – 30 that links to the test person in the experiment

Column 2
•	Activity_id
	o	1 of 6 activities that define the activity the subject was doing when the measurements were taken
		1)	WALKING – subject was walking
		2)	WALKING_UPSTAIRS – subject was walking upstairs
		3)	WALKING_DOWNSTAIRS – subject was walking downstairs
		4)	SITTING – subject was sitting
		5)	STANDING – subject was standing up
		6)	LAYING – subject was laying down

Column 3 – 68
These columns have headings that define the measurement. Each measurement is the mean for the relevant subject, for the relevant activity, over a number of tests. 
The original data was first normalised and bounded to [-1,1]
The header breaks down as follows:
Level1_Level2_Level3_Level4_Level5_Level6 (note not all headers have all levels)

•	Level 1 - indicate which domain the measurement falls into. Time or Frequency

	o	Time – the measure is a unit of time (duration of measurement)
	o	Frequency – a measure of frequency (frequency of measurement) (calculated by a Fast Fourier Transform on the time measurements)

•	Level 2 - indicate why there was a measurement. 

	o	Body-motion – indicates the measurement was due to the body of the subject
	o	Gravity – indicates the measurement was the result of gravity

•	Level 3 - define which of the devices 2 sensors took the measurement. 
	The device's sensors are: An Accelerometer (linear acceleration) and a Gyroscope (angular velocity)

	o	Accelerometer – indicates the measurement is a linear acceleration measurement from the devices accelerometer
	o	Gyroscope – indicates the measurement is an angular velocity measurement from the devices gyroscope
	o	Jerk - a cacluated field derived from the Accelerometer and Gyroscope data

•	Level 4 - indicates the measurement is a magnitude of the measurements (using Euclidean norm)
	o	Magnitude – the magnitude of the measurement


•	Level 5 - indicates what mathematical functions have been carried out on the underlying data

	o	Mean – the measurement itself was a mean of an underlying measurement
	o	Std-Deviation – the standard deviation of the underlying measurements
	o	Mean-Frequency - the measurement itself was the mean of the frequency

•	Level 6 - indicate in which 3D plane of the device the measurement was recorded.

	o	X-Axis – the measurement was in the X direction of the device
	o	Y-Axis – the measurement was in the Y direction of the device
	o	Z-Axis – the measurement was in the Z direction of the device
