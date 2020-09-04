//
//  Utils.swift
//  Daily Goal Tracker WatchKit Extension
//
//  Created by Joseph Buchoff on 9/4/20.
//  Copyright © 2020 Joe's Studio. All rights reserved.
//

import Foundation

enum Format
{
    case dollars
    case number_only
    case number_then_units
    case units_colon_number
}

class Goal
{
    var format = Format.dollars
    var goalAmount = 100
    var goalAmountString: String
    {
        switch format
        {
        case Format.dollars:
            return "$\(goalAmount)"
        case Format.number_only:
            return "\(goalAmount)"
        case Format.number_then_units:
            return "\(goalAmount) \(units)"
        case Format.units_colon_number:
            return "\(units.capitalized): \(goalAmount)"
        }
    }
    var currentAmount = 0
    var currentAmountString: String
    {
        switch format
        {
        case Format.dollars:
            return "$\(currentAmount)"
        case Format.number_only:
            return "\(currentAmount)"
        case Format.number_then_units:
            return "\(currentAmount) \(units)"
        case Format.units_colon_number:
            return "\(units.capitalized): \(currentAmount)"
        }
    }
    var units = ""
    var amountLeft: Int
    var amountLeftString: String
    {
        switch format
        {
        case Format.dollars:
            return "$\(amountLeft)"
        case Format.number_only:
            return "\(amountLeft)"
        case Format.number_then_units:
            return "\(amountLeft) \(units)"
        case Format.units_colon_number:
            return "\(units.capitalized): \(amountLeft)"
        }
    }
    
    // Default initializer
    init() { amountLeft = goalAmount - currentAmount }
    
    // Full initializer except for units
    init (format: Format, goal goalAmount: Int, current currentAmount: Int)
    {
        self.format = format
        self.goalAmount = goalAmount
        self.currentAmount = currentAmount
        amountLeft = goalAmount-currentAmount
    }
    
    // Full initializer
    init (format: Format, goal goalAmount: Int, current currentAmount: Int, units: String)
    {
        self.format = format
        self.goalAmount = goalAmount
        self.currentAmount = currentAmount
        self.units = units
        amountLeft = goalAmount-currentAmount
    }
    
    // Update format to align with user requested change
    func updateFormat (_ newFormat: Format)
    {
        self.format = newFormat
    }
    
    // Update goal amount, with a minimum of 0
    func updateGoal (_ change: Int)
    {
        goalAmount += change
        if goalAmount < 0
        {
            goalAmount = 0
        }
        
        amountLeft = goalAmount-currentAmount
    }
    
    // Update current amount, with a minimum of 0
    func updateCurrent (_ change: Int)
    {
        currentAmount += change
        if currentAmount < 0
        {
            currentAmount = 0
        }
        
        amountLeft = goalAmount-currentAmount
    }
    
    // Reset to default amounts
    func reset()
    {
        goalAmount = 100
        currentAmount = 0
        amountLeft = goalAmount-currentAmount
    }
}
