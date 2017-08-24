# Human Activity Recognition Sensor Logger App - iOS
This app is designed for the iPhone with a horizontal layout. It collects real-time accelerometer and gyroscope data and saves it in a .csv file. The .csv file can then be shared via AirDrop, Messages, Email, etc.
The accelerometer values are in increments of the g (9.8 m/s^2). I.e. a value of 1.0 representis an acceleration of 9.8 m/s^2
The accelerometer values include both body and gravity components.

The gyroscope values are measured in radians/sec around a certain axis.

The output .csv file is formatted in the following:

AccX AccY AccZ GyroX GyroY GyroZ
