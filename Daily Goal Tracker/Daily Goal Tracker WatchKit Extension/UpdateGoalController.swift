//
//  UpdateDataController.swift
//  Daily Goal Tracker
//
//  Created by Joseph Buchoff on 9/5/20.
//  Copyright © 2020 Joe's Studio. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class UpdateDataController: WKInterfaceController
{
    var goal = Goal()
    
    @IBAction func updateData()
    {
        if WCSession.isSupported()
        {
            let session = WCSession.default
            
            print("Trying to unpack goal reply on Watch.")
            session.sendMessage(["":0],
                                replyHandler: {response in
                                    self.goal.updateUnits(response["units"] as! String)
                                    self.goal.updateFormat(Format(withIndex: response["format"] as! Int)!)
                                    print("Inside Closure: New Units: \(self.goal.units)")
                                    print("Inside Closure: New Format: \(self.goal.format)")
                                    

                                    // Reload interfaces to update data throughout the app
                                    WKInterfaceController.reloadRootPageControllers(withNames : ["UpdateDataController", "SetGoalController", "CurrentAmountController", "AmountLeftController"], contexts : [self.goal, self.goal, self.goal, self.goal], orientation : WKPageOrientation.horizontal, pageIndex: 0)
                                    
            },
                                errorHandler: {error in
                                    print("Error unpacking goal reply from phone: \(error)")
            })
        }
        
        print("Successfully unpacked goal reply on Watch.")
        print("Outside Closure: New Units: \(self.goal.units)")
        print("Outside Closure: New Format: \(self.goal.format)")
        
    }

    override func awake(withContext context: Any?)
    {
        super.awake(withContext: context)
        
        // Unpack the data passed from previous interface controller,
        // but if this is the beginning of the program, do nothing.
        if let dataAsAny = context
        {
            self.goal = dataAsAny as! Goal
        }
    }
}
