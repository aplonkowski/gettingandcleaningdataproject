The run_analysis.R file is a R script that performs data import preparation and analysis. This file provides details on steps performed by the script.


	1) Reading the Data
		- First a directory for this work called "project" is created.
		- From this directory all the relevant data is read in from the original UCI HAR 		  Dataset folder.
		- Each of the datasets is read in and assigned to a similarly named variable.

	2) Combining the Data
		- First the "X" data frames (Observations) are combined in the order: test set, 		          training set.
		- The "Y" data frames (Coded Activities) are combined in the order: test set, training set.
		- The "suject" data frames are combined in the order: test set, training set.
		- Now that all of these data subsets have been combined in the same format we are ready to 		  combine them all into final complete database. These are combined into one large dataframe 		  in the order: "Suject", "Y/Coded Activites" and "X/Observations".

	3) Extracting Variables of Interest
		- Since we are only interested in the observations/variables indicating the mean and standard 		  deviation these are selected from the complete database and along with subject and coded 		  activities form a dataframe called "tidydata".

	4) Naming the Activities
		- The coded activities column is converted to full activity names based on the original 		  authors' codebook. The column containing this data is hence renamed "activities" rather 		  than "coded activities". 

	5) Renaming the Variables 
		- Column names are now renamed to be more clear, the original authors' codebook is referenced 		  again to correctly change the abbreviations. Changes are as follows:
			- 't' is replaced with 'time'
			- 'f & freq' are replaced with 'frequency'
			- 'Mag' is replaced with 'magnitude'
			- 'Acc' is replaced with 'accelerometer'
			- 'Gyro' is replaced with 'gyroscope'
			- 'BodyBody' is replaced with 'body'
			- 'tBody' is replaced with 'timebody'

	7) Creating a Final Dataset
		- Now that the columns are easily readable a final dataset is created.
		- This dataset contains the mean of every variable grouped by subject and activity
		- This dataset is named "means_data"
	

	8) Script Finished
		- This concludes the code, the "means_data" dataframe is ready and available for both 				further analysis or export. 

		