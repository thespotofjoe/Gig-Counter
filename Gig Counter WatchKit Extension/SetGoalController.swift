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
    
    var goal = 100
    var current = 0
    var data = ["goal": 100,
                "current": 0]
    
    /* Local utility functions */
    // Changes goal by a value, then updates the label to reflect the change
    func updateGoal(_ change : Int) -> Void
    {
        // Make the change
        self.goal += change
        
        // Make sure 0 is the lowest it can be
        if (goal < 0) { goal = 0 }
        
        // Update dictionary to reflect the change
        self.data["goal"] = goal
        self.data["current"] = current
        
        // Reload interfaces to update data throughout the app
        WKInterfaceController.reloadRootPageControllers(withNames : ["SetGoalController", "CurrentEarningsController", "EarningsLeftController"], contexts : [data, data, data], orientation : WKPageOrientation.horizontal, pageIndex: 0)
    }
    
    /* Integral system functions, overridden */
    override func awake(withContext context: Any?)
    {
        super.awake(withContext: context)
        
        // Unpack the dictionary passed from previous interface controller,
        // but if this is the beginning of the program, do nothing.
        if let dataAsAny = context
        {
            self.data = dataAsAny as! [String : Int]
            self.goal = data["goal"]!
            self.current = data["current"]!
            
            // Update the label to reflect the data
            goalLabel.setText("$\(self.goal)")
        }
    }
    
    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate()
    {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func plus10Pressed()
    {
        updateGoal(10)
    }
    
    @IBAction func minus10Pressed()
    {
        updateGoal(-10)
    }
    
    @IBAction func plus5Pressed()
    {
        updateGoal(5)
    }
    
    @IBAction func minus5Pressed()
    {
        updateGoal(-5)
    }
    
    @IBAction func plus1Pressed()
    {
        updateGoal(1)
    }
    
    @IBAction func minus1Pressed()
    {
        updateGoal(-1)
    }

}
