# Human Activity Recognition Sensor Logger App - iOS
This app is designed for the iPhone with a horizontal layout. It collects real-time accelerometer and gyroscope data at 50 Hz and saves it in a .csv file. The .csv file can then be shared via AirDrop, Messages, Email, etc.
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
