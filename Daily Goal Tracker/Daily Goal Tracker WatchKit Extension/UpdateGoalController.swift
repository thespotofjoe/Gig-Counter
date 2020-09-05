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
            
            session.sendMessage(["":0],
                                replyHandler: {response in
                self.goal = response["goal"] as! Goal},
                                errorHandler: {error in})
        }
        
        // Reload interfaces to update data throughout the app
        WKInterfaceController.reloadRootPageControllers(withNames : ["UpdateGoalController", "SetGoalController", "CurrentAmountController", "AmountLeftController"], contexts : [nil, goal, goal, goal], orientation : WKPageOrientation.horizontal, pageIndex: 0)
    }
}
