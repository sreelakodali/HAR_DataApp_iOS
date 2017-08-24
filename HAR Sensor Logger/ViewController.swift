//
//  ViewController.swift
//  HAR Sensor Logger
//
//  Created by Sreela Kodali on 8/1/17.
//  Copyright © 2017 Sreela Kodali. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let softRed = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
    let softGreen = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5)
    let sampleFreq:Double = 50.0
    let zero:Double = 0.000
    var manager: CMMotionManager!
    
    var Xa:Double = 0.0
    var Ya:Double = 0.0
    var Za:Double = 0.0
    var Xg:Double = 0.0
    var Yg:Double = 0.0
    var Zg:Double = 0.0
    var acctext:String = ""
    var gyrotext:String = ""
    var csvText:String = ""
    var f:String = ""
    var a:Bool = true
    var lastChar:Character = "n"
    
    @IBOutlet weak var XAcc: UILabel!
    @IBOutlet weak var YAcc: UILabel!
    @IBOutlet weak var ZAcc: UILabel!
    @IBOutlet weak var XGyro: UILabel!
    @IBOutlet weak var YGyro: UILabel!
    @IBOutlet weak var ZGyro: UILabel!
    
    @IBOutlet weak var ssbutton: UIButton!
    
    @IBAction func StartStopButton(_ sender: Any) {

        if ssbutton.backgroundColor == softGreen {
            
            //Change Colors
            ssbutton.backgroundColor = softRed
            ssbutton.setTitle("Stop", for: .normal)
            
            //Reset text
            csvText = ""
            print("Button clicked data time")
            
            //Start Collecting Data
            manager.startAccelerometerUpdates(to: OperationQueue.current!) {
                (data, error) in
                if let accelerometerData = data {
                    self.Xa = accelerometerData.acceleration.x
                    self.Ya = accelerometerData.acceleration.y
                    self.Za = accelerometerData.acceleration.z
                    self.acctext = "\(self.Xa),\(self.Ya),\(self.Za),"
                    print("ACC:"+self.acctext)
                    if self.a == true {
                        self.csvText.append(self.acctext)
                        self.a = false
                    }
                    self.XAcc.text = String(format:"%.3f", self.Xa)
                    self.YAcc.text = String(format:"%.3f", self.Ya)
                    self.ZAcc.text = String(format:"%.3f", self.Za)
                }
            }
            manager.startGyroUpdates(to: OperationQueue.current!) {
                (data, error) in
                if let gyroData = data {
                    self.Xg = gyroData.rotationRate.x
                    self.Yg = gyroData.rotationRate.y
                    self.Zg = gyroData.rotationRate.z
                    self.gyrotext = "\(self.Xg),\(self.Yg),\(self.Zg)\n"
                    print("GYRO:"+self.gyrotext)
                    if self.a == false {
                        self.csvText.append(self.gyrotext)
                        self.a = true
                    }
                    self.XGyro.text = String(format:"%.3f", self.Xg)
                    self.YGyro.text = String(format:"%.3f", self.Yg)
                    self.ZGyro.text = String(format:"%.3f", self.Zg)
                }
            }
        }
            
        else if ssbutton.backgroundColor == softRed {
            
            //Change colors and stop the sensor updates
            ssbutton.backgroundColor = softGreen
            ssbutton.setTitle("Start", for: .normal)
            
            manager.stopAccelerometerUpdates()
            manager.stopGyroUpdates()
            
            
            //Create csv file
            let date = Date()
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)
            let month = calendar.component(.month, from: date)
            let year = calendar.component(.year, from: date)
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            
            f = String(format:"HAR_%d-%d_%d-%d-%d.csv", hour, minutes, month, day, year)
            
            //attempt to ensure csv has clean bottom
            let lastChar = csvText.characters.last!
            print("LASTCHAR")
            print(lastChar)
            print("HELLO DID I GET HERE")
            if (lastChar == ",") {
                print("inside if loop")
                let newEnd = -acctext.characters.count + 1
                let endIndex = csvText.index(csvText.endIndex, offsetBy: newEnd)
                csvText = csvText.substring(to: csvText.index(before: endIndex))
                //print(csvText.characters.last!)
            }
            
            //ATTEMPT #2 - keep removing chars until last char is n
            //lastChar = csvText[csvText.index(before: csvText.endIndex)]
            //print("LASTCHAR")
            //print(lastChar)
            //print("HELLO DID I GET HERE")
            //while !(lastChar == "n") {
            //    csvText.remove(at: csvText.index(before: csvText.endIndex))
            //    lastChar = csvText[csvText.index(before: csvText.endIndex)]
            //}
            
            let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(f)
            do {
                try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
                
                let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
                vc.excludedActivityTypes = [
                    UIActivityType.assignToContact,
                    UIActivityType.saveToCameraRoll,
                    UIActivityType.postToFlickr,
                    UIActivityType.postToVimeo,
                    UIActivityType.postToTencentWeibo,
                    UIActivityType.postToTwitter,
                    UIActivityType.postToFacebook,
                    UIActivityType.openInIBooks
                ]
                present(vc, animated: true, completion: nil)
                
                
                // Reset display text
                self.Xa = 0.0
                self.Ya = 0.0
                self.Za = 0.0
                self.Xg = 0.0
                self.Yg = 0.0
                self.Zg = 0.0
                self.XAcc.text = String(format:"%.3f", self.Xa)
                self.YAcc.text = String(format:"%.3f", self.Ya)
                self.ZAcc.text = String(format:"%.3f", self.Za)
                self.XGyro.text = String(format:"%.3f", self.Xg)
                self.YGyro.text = String(format:"%.3f", self.Yg)
                self.ZGyro.text = String(format:"%.3f", self.Zg)
                
            } catch {
                print("Failed to create file")
                print("\(error)")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ssbutton.backgroundColor = softGreen
        ssbutton.setTitle("Start", for: .normal)
        XAcc.text = String(format:"%.3f", Xa)
        YAcc.text = String(format:"%.3f", Ya)
        ZAcc.text = String(format:"%.3f", Za)
        XGyro.text = String(format:"%.3f", Xg)
        YGyro.text = String(format:"%.3f", Yg)
        ZGyro.text = String(format:"%.3f", Zg)
        
        manager = CMMotionManager()
        if manager.isGyroAvailable {
            manager.gyroUpdateInterval = 1/sampleFreq
            print("Gyro Available and interval set")
        }
        
        if manager.isAccelerometerAvailable {
            manager.accelerometerUpdateInterval = 1/sampleFreq
            print("Acc Available and interval set")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

