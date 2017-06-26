//
//  ViewController.swift
//  Calculator
//
//  Created by Joseph Sungpil Choi on 6/25/17.
//  Copyright © 2017 Joseph Sungpil Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Global Variables?
    
    var usersIsTyping: Bool = false
    var charCount: Int = 0
    
    //MARK: Instance Variables
    
    @IBOutlet weak var calcDisplay: UILabel!
    
    //MARK: Actions
    
    @IBAction func appendDigit(_ sender: UIButton) {
        // the ! symbol unwraps the optional String?
        // app will crash if currentTitle not set (good)
        if (charCount >= 13) { return }
        let digit = sender.currentTitle!
        if usersIsTyping {
            // print("The digit clicked was: \(digit)")
            calcDisplay.text = calcDisplay.text! + digit
        } else {
            calcDisplay.text = digit
            usersIsTyping = true
        }
        charCount = calcDisplay.text!.characters.count
    }
    
    var calcDisplayVal: Double {
        get {
            return Double(calcDisplay.text!)!
        }
        set {
            calcDisplay.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        usersIsTyping = false
        if let operatorSymbol = sender.currentTitle {
            switch operatorSymbol {
            case "π":
                let flooredPi: Double = limitCalculation(Double.pi)
                calcDisplay.text = String(flooredPi)
            case "√":
                calcDisplay.text = String(limitCalculation(sqrt(calcDisplayVal)))
            default:
                break
            }
        }
    }
    
    func limitCalculation(_ a: Double) -> Double {
        return floor(a * 100000000) / 100000000.0
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

