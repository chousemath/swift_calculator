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
    
    //MARK: Instance Variables
    
    @IBOutlet weak var calcDisplay: UILabel!

    //MARK: Actions
    
    @IBAction func appendDigit(_ sender: UIButton) {
        // the ! symbol unwraps the optional String?
        // app will crash if currentTitle not set (good)
        let digit = sender.currentTitle!
        if usersIsTyping {
            // print("The digit clicked was: \(digit)")
            calcDisplay.text = calcDisplay.text! + digit
        } else {
            calcDisplay.text = digit
            usersIsTyping = true
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

