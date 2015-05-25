//
//  ViewController.swift
//  Simple Clock
//
//  Created by MjB on 5/25/15.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var clockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        clockLabel.text = ""
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("clock"), userInfo: nil, repeats: true)
        
    }
    
    func clock() {
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
    
        var hour = components.hour > 12 ? components.hour - 12 : components.hour
        hour = hour == 0 ? 12 : hour

        let hourString = hour > 9 ? "\(hour)" : "0\(hour)"
        let minutes = components.minute > 9 ? "\(components.minute)" : "0\(components.minute)"
        let seconds = components.second > 9 ? "\(components.second)" : "0\(components.second)"
        
       /* 
        
        //this is the original source code to assign AM/PM, but I rewrote it below to use if statement to differ from above
        
        let am = components.hour > 12 ? "PM" : "AM"
        
        */
        
        
        var am = ""
        
        if components.hour > 12 {
            am = "PM"
        }
        else {
            am = "AM"
        }
        
        clockLabel.text = "\(hourString):\(minutes):\(seconds) \(am)"
    }
    
    // Create white status bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}














