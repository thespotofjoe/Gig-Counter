//
//  CongratulationsController.swift
//  Daily Goal Tracker WatchKit Extension
//
//  Created by Joseph Buchoff on 9/10/20.
//  Copyright © 2020 Joe's Studio. All rights reserved.
//

import WatchKit
import SpriteKit

class CongratulationsController: WKInterfaceController
{
    /* Our Variables */
    private var goal = Goal()
    
    /* Outlets */
    // Outlet to connect to SKScene used to show animations
    @IBOutlet weak var congratulationsScene: WKInterfaceSKScene!
    
    /* Integral system functions, overridden */
    override func awake(withContext context: Any?)
    {
        super.awake(withContext: context)
        
        // Set goal to the data passed to us
        goal = context as! Goal
        
        // Explode the firework in the center of the screen
        let emitter = SKEmitterNode(fileNamed: "FireworkEmitter")!
        emitter.position = CGPoint.zero//firework.position
        congratulationsScene.scene?.addChild(emitter)

    }
    
    // Go back to the other functions in the app
    @IBAction func goBack()
    {
        // Reload the pageview with all the pieces in the right order, with the current goal, starting user on SetGoalController
        WKInterfaceController.reloadRootPageControllers(withNames : ["UpdateDataController", "SetGoalController", "CurrentAmountController", "AmountLeftController"], contexts : [goal, goal, goal, goal], orientation : WKPageOrientation.horizontal, pageIndex: 1)
    }
}
