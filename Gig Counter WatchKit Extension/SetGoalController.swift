//
//  SetGoalController.swift
//  Gig Counter WatchKit Extension
//
//  Created by Joe on 8/19/20.
//  Copyright © 2020 Joe's Studio. All rights reserved.
//

import WatchKit
import Foundation

class SetGoalController: WKInterfaceController {

    @IBOutlet weak var goalLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    @IBAction func plus10Pressed() {
    }
    
    @IBAction func minus10Pressed() {
    }
    
    @IBAction func plus5Pressed() {
    }
    
    @IBAction func minus5Pressed() {
    }
    
    @IBAction func plus1Pressed() {
    }
    
    @IBAction func minus1Pressed() {
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    

}
