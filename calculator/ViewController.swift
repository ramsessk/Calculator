//
//  ViewController.swift
//  calculator
//
//  Created by Steven on 19/4/15.
//  Copyright (c) 2015 Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var brain = CalulatorBrain()
    
    @IBOutlet weak var display: UILabel!

    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        //println("digit=\(digit)")
    }
    
    @IBAction func operate(sender: UIButton) {
            if userIsInTheMiddleOfTypingANumber {
                enter()
            }
            if let operation = sender.currentTitle {
                if let result = brain.performOperation(operation) {
                    displayValue = result
                } else {
                    displayValue = 0
                }
            }
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

