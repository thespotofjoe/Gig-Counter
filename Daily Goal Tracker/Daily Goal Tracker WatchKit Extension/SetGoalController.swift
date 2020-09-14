//
//  SetGoalController.swift
//  Daily Goal Tracker WatchKit Extension
//
//  Created by Joseph Buchoff on 9/4/20.
//  Copyright © 2020 Joe's Studio. All rights reserved.
//

import WatchKit
import Foundation

class SetGoalController: WKInterfaceController
{

    // Label outlet
    @IBOutlet weak var goalLabel: WKInterfaceLabel!
    
    // Button outlets
    @IBOutlet weak var plus10Button: WKInterfaceButton!
    
    @IBOutlet weak var minus10Button: WKInterfaceButton!
    
    @IBOutlet weak var plus5Button: WKInterfaceButton!
    
    @IBOutlet weak var minus5Button: WKInterfaceButton!
    
    @IBOutlet weak var plus1Button: WKInterfaceButton!
    
    @IBOutlet weak var minus1Button: WKInterfaceButton!
    
    var goal = Goal()
    
    /* Local utility functions */
    // Changes goal by a value, then updates the label to reflect the change
    func updateGoal(_ change : Int) -> Void
    {
        // Make the change
        goal.updateGoal(change)
        
        // Reload interfaces to update data throughout the app
        WKInterfaceController.reloadRootPageControllers(withNames : ["UpdateDataController", "SetGoalController", "CurrentAmountController", "AmountLeftController"], contexts : [goal, goal, goal, goal], orientation : WKPageOrientation.horizontal, pageIndex: 1)
    }
    
    /* Integral system functions, overridden */
    override func awake(withContext context: Any?)
    {
        super.awake(withContext: context)
        
        // Unpack the data passed from previous interface controller,
        // but if this is the beginning of the program, do nothing.
        if let dataAsAny = context
        {
            self.goal = dataAsAny as! Goal
            
            // Update the label to reflect the data
            goalLabel.setText(self.goal.goalAmountString)
            print("Setting text to \"\(self.goal.goalAmountString)\".")
            if goal.format == .dollars
            {
                plus10Button.setTitle("+$10")
                minus10Button.setTitle("-$10")
                plus5Button.setTitle("+$5")
                minus5Button.setTitle("-$5")
                plus1Button.setTitle("+$1")
                minus1Button.setTitle("-$1")
            } else {
                plus10Button.setTitle("+10")
                minus10Button.setTitle("-10")
                plus5Button.setTitle("+5")
                minus5Button.setTitle("-5")
                plus1Button.setTitle("+1")
                minus1Button.setTitle("-1")
            }
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
