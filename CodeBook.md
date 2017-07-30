# Overview

The script file `run_analysis.R` is divided into 5 sections/steps according to the instructions of the project.

* First, the train and test data that can be categorized as 3 groups are merged using rbind.
* In the second step, the feature names are extracted and filtered by searching for mean and standard deviation in the feature names. Using this, the features are subsetted.
* Next, the activity labels are extracted and replaced the activity values for clearer data.
* The last column without a name is renamed.
* Lastly, the dataset is melted using activity and subject as ID fields, and dcasted into a new tidy dataset taking the average of each variable.

# Variables

* `xTrain`, `yTrain`, `xTest`, `yTest`, `subjectTrain` and `subjectTest` contain the data from the downloaded files.
* `xAll`, `yAll` and `subject` are combined the previous datasets for further analysis.
* `featuresVec` contains the correct names for the `xAll` dataset, the vectors containing only the mean and standard deviation columns are a numeric vector 'featuresWantedIdx' which is used to subset the columns and 'featuresWantedVec' to rename them.
* The 'activityLabels' store the labelled names for 'yAll' dataset.
* `allData` is the merged form of  `xAll`, `yAll` and `subject` in one large dataset.
* 'allDataMelt' is used as a temporary storage for the melted version of 'allData' before it is reshaped. The reshape package is used to do this step.
* Finally, `allData2` is the dataset that contains the average on each variable which will be written into a `.txt` file.