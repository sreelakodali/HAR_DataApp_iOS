# Human Activity Recognition (HAR) Sensor Logger App - iOS
This app collects real-time accelerometer and gyroscope data at 50 Hz and saves it in a .csv file. The .csv file can then be shared via AirDrop, Messages, Email, etc.
The accelerometer values are in increments of the g (9.8 m/s^2). I.e. a value of 1.0 represents an acceleration of 9.8 m/s^2.
The accelerometer values include both body and gravity components.

The gyroscope values are measured in radians/sec around a certain axis.

The output .csv file is formatted in the following:

AccX AccY AccZ GyroX GyroY GyroZ

# Using the App
The data collected from the app is used with trained DNN models for HAR. The DNN models were trained with the UCI Smartphone HAR dataset (https://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions).
To collect data that corresponds with the UCI Smartphone dataset and correctly for the DNN model, the phone should be held horizontally and worn centered at hip-level in a waistband (screen facing inwards).
The horizontal layout of the iOS application helps the user position the phone properly for data collection.

1) Wear a smartphone waistband. Make sure it is taut. Position it such that the pouch is at hip-level and front center. An example of waistband can be found here: https://images-na.ssl-images-amazon.com/images/I/71NcfRySmmL._SY355_.jpg
2) Launch the HAR application on your iPhone.
3) Click the 'Start' button to begin collecting data.
4) Insert the phone horizontally into the waistband pouch - the text for the app should be facing up and the screen should be towards your body.
5) Perform physical activities.
6) Click the 'Stop' button to end data collection. A pop-up should appear prompting how to send the .csv file. Select whichever option(s) suits you.
7) Click the 'Done' button at the bottom of the pop-up to close it.
8) Click the 'Start' button to begin another data collection session.
