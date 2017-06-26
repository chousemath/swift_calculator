//
//  ViewController.swift
//  Calculator
//
//  Created by Joseph Sungpil Choi on 6/25/17.
//  Copyright © 2017 Joseph Sungpil Choi. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    //MARK: Global Variables?
    
    var usersIsTyping: Bool = false
    var charCount: Int = 0
    private let tooManyCharsSound: SystemSoundID = 1016
    
    //MARK: Instance Variables
    
    @IBOutlet weak var calcDisplay: UILabel!
    
    //MARK: Actions
    
    @IBAction func appendDigit(_ sender: UIButton) {
        // the ! symbol unwraps the optional String?
        // app will crash if currentTitle not set (good)
        if (charCount >= 13) {
            AudioServicesPlaySystemSound(tooManyCharsSound)
            return
        }
        let digit = sender.currentTitle!
        if usersIsTyping {
            // print("The digit clicked was: \(digit)")
            calcDisplay.text = calcDisplay.text! + digit
        } else {
            calcDisplay.text = digit
            usersIsTyping = true
        }
        charCount = calcDisplay.text!.characters.count
        print(charCount)
    }
    
    var calcDisplayVal: Double {
        get {
            return Double(calcDisplay.text!)!
        }
        set {
            calcDisplay.text = String(newValue)
        }
    }
    
    private var calcOperation = CalculatorOperation()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if usersIsTyping {
            calcOperation.setOperand(calcDisplayVal)
            usersIsTyping = false
        }
        
        if let operatorSymbol = sender.currentTitle {
            calcOperation.performOperation(operatorSymbol)
        }
        
        if let result = calcOperation.result {
            calcDisplayVal = result
            charCount = calcDisplay.text!.characters.count
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

