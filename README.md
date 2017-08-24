# Human Activity Recognition (HAR) Sensor Logger App - iOS
This app collects real-time accelerometer and gyroscope data at 50 Hz and saves it in a .csv file. The .csv file can then be shared via AirDrop, Messages, Email, etc.

The data collected from the app is used with trained DNN models for HAR. The DNN models were trained with the UCI Smartphone HAR dataset (https://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions).
To collect data that corresponds with the UCI Smartphone dataset and correctly for the DNN model, the phone should be held horizontally and worn centered at hip-level in a waistband (screen facing inwards).
The horizontal layout of the iOS application helps the user position the phone properly for data collection.
The accelerometer values are in increments of the g (9.8 m/s^2). I.e. a value of 1.0 represents an acceleration of 9.8 m/s^2.
The accelerometer values include both body and gravity components.

The gyroscope values are measured in radians/sec around a certain axis.

The output .csv file is formatted in the following:

AccX AccY AccZ GyroX GyroY GyroZ

# Using the App
1) Launch the HAR application
2) Click the 'Start' button to begin collecting data.
3) Click the 'Stop' button to stop collecting data. A pop-up should appear prompting how to send the .csv file. Select whichever options suits you.
4) Click the 'Done' button at the bottom of the pop-up to begin another data collection session.
