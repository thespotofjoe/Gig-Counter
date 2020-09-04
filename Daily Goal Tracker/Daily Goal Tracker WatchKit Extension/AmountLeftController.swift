//
//  AmountLeftController.swift
//  Daily Goal Tracker WatchKit Extension
//
//  Created by Joseph Buchoff on 9/4/20.
//  Copyright © 2020 Joe's Studio. All rights reserved.
//


import WatchKit
import Foundation

class AmountLeftController: WKInterfaceController {

    @IBOutlet weak var amountLeftUnitsLabel: WKInterfaceLabel!
    
    @IBOutlet weak var amountLeftLabel: WKInterfaceLabel!
    
    var goal = Goal()
    
    /* Integral system functions, overridden */
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Unpack the data passed from previous interface controller,
        // but if this is the beginning of the program, do nothing.
        if let dataAsAny = context
        {
            self.goal = dataAsAny as! Goal
        }
        
        // Update the label to reflect the data
        amountLeftLabel.setText(self.goal.amountLeftString)
    }
    
    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    /* Button press Actions */
    // Reset button pressed, do things
    @IBAction func resetPressed()
    {
        // Define actions for the alert
        let resetAction = WKAlertAction(title: "Reset", style: .destructive, handler:
        {
            // Reset data
            self.goal.reset()
            
            // Reload interfaces to update data throughout the app
            WKInterfaceController.reloadRootPageControllers(withNames : ["SetGoalController", "CurrentAmountController", "AmountLeftController"], contexts : [self.goal, self.goal, self.goal], orientation : WKPageOrientation.horizontal, pageIndex: 2)
        })
        
        let cancelAction = WKAlertAction(title: "Cancel", style: .cancel, handler: {})
        
        // Show alert so user confirms they want to lose all data and reset to default
        self.presentAlert(withTitle: "Are you sure?", message: "This will delete your current goal and earnings.", preferredStyle: .sideBySideButtonsAlert, actions: [resetAction, cancelAction])
    }
    

}
