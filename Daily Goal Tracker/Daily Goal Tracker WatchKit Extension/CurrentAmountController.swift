//
//  CurrentAmountController.swift
//  Daily Goal Tracker WatchKit Extension
//
//  Created by Joseph Buchoff on 9/4/20.
//  Copyright © 2020 Joe's Studio. All rights reserved.
//

import WatchKit
import Foundation

class CurrentAmountController: WKInterfaceController
{

    @IBOutlet weak var currentAmountUnitsLabel: WKInterfaceLabel!
    
    @IBOutlet weak var currentAmountLabel: WKInterfaceLabel!
    
    var goal = Goal()
    
    /* Local utility functions */
    // Changes current by a value, then updates the label to reflect that change
    func updateCurrent(_ change : Int) -> Void
    {
        // Make the change
        goal.updateCurrent(change)
        
        // Reload interfaces to update data throughout the app
        WKInterfaceController.reloadRootPageControllers(withNames : ["UpdateGoalController", "SetGoalController", "CurrentAmountController", "AmountLeftController"], contexts : [nil, goal, goal, goal], orientation : WKPageOrientation.horizontal, pageIndex: 2)
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
        }
        
        currentAmountLabel.setText(self.goal.currentAmountString)
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
    
    /* Button Press functions */
    @IBAction func plus10Pressed()
    {
        updateCurrent(10)
    }
    
    @IBAction func minus10Pressed()
    {
        updateCurrent(-10)
    }
    
    @IBAction func plus5Pressed()
    {
        updateCurrent(5)
    }
    
    @IBAction func minus5Pressed()
    {
        updateCurrent(-5)
    }
    
    @IBAction func plus1Pressed()
    {
        updateCurrent(1)
    }
    
    @IBAction func minus1Pressed()
    {
        updateCurrent(-1)
    }

}
