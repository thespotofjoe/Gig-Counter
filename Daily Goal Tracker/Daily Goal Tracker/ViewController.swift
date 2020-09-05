//
//  ViewController.swift
//  Daily Goal Tracker
//
//  Created by Joseph Buchoff on 9/4/20.
//  Copyright © 2020 Joe's Studio. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController
{
    @IBOutlet weak var unitsField: UITextField!
    private var units = "units"
    
    @IBOutlet weak var formatPicker: UIPickerView!
    private var formats = [""]
    
    private var goal = Goal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        formats = ["$123","123","123 \(units.lowercased())","\(units.capitalized): 123"]
        
        formatPicker.dataSource = self
        formatPicker.delegate = self
        
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }

    @IBAction func updateWatch(_ sender: Any)
    {
    }
    

}

extension ViewController: WCSessionDelegate, UIPickerViewDelegate, UIPickerViewDataSource
{
    /* Protocol functions */
    // WCSessionDelegate functions
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession)
    {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession)
    {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Swift.Void)
    {
        goal.updateUnits(unitsField.text)
        let returnMessage: [String : Any] = ["goal" : goal]
        
        // Send it over to the Apple Watch
        replyHandler(returnMessage)
    }
    
    // UIPickerViewDelegate functions
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        switch row
        {
        case 0:
            goal.updateFormat(.dollars)
        case 1:
            goal.updateFormat(.number_only)
        case 2:
            goal.updateFormat(.number_then_units)
        case 3:
            goal.updateFormat(.units_colon_number)
        default:
            // Will never get here, but the compiler doesn't know that
            return
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return formats[row]
    }
    
    // UIPickerViewDataSource functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return formats.count
    }
}
