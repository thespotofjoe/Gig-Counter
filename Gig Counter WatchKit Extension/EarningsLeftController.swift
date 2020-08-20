//
//  EarningsLeftController.swift
//  Gig Counter WatchKit Extension
//
//  Created by Joe on 8/19/20.
//  Copyright © 2020 Joe's Studio. All rights reserved.
//

import WatchKit
import Foundation

class EarningsLeftController: WKInterfaceController {

    @IBOutlet weak var earningsLeftLabel: WKInterfaceLabel!
    
    var goal = 100
    var current = 0
    var data = ["goal": 100,
                "current": 0]
    
    /* Integral system functions, overridden */
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Unpack the dictionary passed from previous interface controller.
        self.data = context as! [String : Int]
        self.goal = data["goal"]!
        self.current = data["current"]!
        
        // Set the label to reflect the earnings left for the day
        let earningsLeft = goal - current
        if (earningsLeft < 0)
        {
            earningsLeftLabel.setText("Exceeded goal by $\(-1*earningsLeft)!")
        } else if (earningsLeft == 0) {
            earningsLeftLabel.setText("Goal met!")
        } else {
            earningsLeftLabel.setText("$\(earningsLeft)")
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        // Return data to be accessed in CurrentEarningsController
        return self.data as Any?
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
