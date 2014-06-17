Coursera - Getting and Cleaning Data Course
===========================================

Code Book for Assignment
------------------------

**Structure of Data**

Data is in 81 columns, and 181 rows (including header)

	* Columns 1 & 2 define to subject and the activity
	* Columns 3-68 contain the experimental data
	* Experimental data was normalised and bounded to [-1,1]

<strong>Column 1 - Subject_id</strong>
<p>A number from 1 – 30 that links to the test person in the experiment.</p>

<strong>Column 2 - Activity_id</strong>
<p>1 of 6 activities that define the activity the subject was doing when the measurements were taken</p>
<ol><li>WALKING – subject was walking</li>
<li>WALKING_UPSTAIRS – subject was walking upstairs</li>
<li>WALKING_DOWNSTAIRS – subject was walking downstairs</li>
<li>SITTING – subject was sitting</li>
<li>STANDING – subject was standing up</li>
<li>LAYING – subject was laying down</li></ol>

<strong>Column 3 – 68</strong>
<p>These columns have headings that define the measurement. Each measurement is the mean for the relevant subject, for the relevant activity, over a number of tests. 
The original data was first normalised and bounded to [-1,1]
The header breaks down as follows:(note not all headers have all levels)</p>
<ul><li>Level1_Level2_Level3_Level4_Level5_Level6 </li></ul>

<em>Level 1 - indicate which domain the measurement falls into. Time or Frequency</em>
<ul><li>Time – the measure is a unit of time (duration of measurement)</li>
<li>Frequency – a measure of frequency (frequency of measurement) (calculated by a Fast Fourier Transform on the time measurements)</li></ul>

<em>Level 2 - indicate why there was a measurement. </em>
<ul><li>Body-motion – indicates the measurement was due to the body of the subject</li>
<li>Gravity – indicates the measurement was the result of gravity</li></ul>

<em>Level 3 - define which of the devices 2 sensors took the measurement. </em>
The device's sensors are: An Accelerometer (linear acceleration) and a Gyroscope (angular velocity)
<ul><li>Accelerometer – indicates the measurement is a linear acceleration measurement from the devices accelerometer</li>
<li>Gyroscope – indicates the measurement is an angular velocity measurement from the devices gyroscope</li>
<li>Jerk - a cacluated field derived from the Accelerometer and Gyroscope data</li></ul>

<em>Level 4 - indicates the measurement is a magnitude of the measurements (using Euclidean norm)</em>
<ul><li>Magnitude – the magnitude of the measurement</li></ul>


<em>Level 5 - indicates what mathematical functions have been carried out on the underlying data</em>
<ul><li>Mean – the measurement itself was a mean of an underlying measurement</li>
<li>Std-Deviation – the standard deviation of the underlying measurements</li>
<li>Mean-Frequency - the measurement itself was the mean of the frequency</li></ul>

<em>Level 6 - indicate in which 3D plane of the device the measurement was recorded.</em>
<ul><li>X-Axis – the measurement was in the X direction of the device</li>
<li>Y-Axis – the measurement was in the Y direction of the device</li>
<li>Z-Axis – the measurement was in the Z direction of the device</li></ul>
