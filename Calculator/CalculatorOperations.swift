//
//  CalculatorOperations.swift
//  Calculator
//
//  Created by Joseph Sungpil Choi on 6/26/17.
//  Copyright © 2017 Joseph Sungpil Choi. All rights reserved.
//  This is the model component of the MVC pattern
//  Classes have inheritance, structs do not
//

import AVFoundation
import Foundation

struct CalculatorOperation {
    
    private var accumulator: Double?
    private let clearedSound: SystemSoundID = 1023
    
    mutating func performOperation(_ symbol: String) {
        switch symbol {
        case "π":
            let flooredPi: Double = limitCalculation(Double.pi)
            accumulator = flooredPi
        case "√":
            if let operand = accumulator {
                accumulator = limitCalculation(sqrt(operand))
            }
        case "C":
            accumulator = 0.0
            AudioServicesPlaySystemSound(clearedSound)
        default:
            break
        }
    }
    
    func limitCalculation(_ a: Double) -> Double {
        return floor(a * 100000000) / 100000000.0
    }
    
    mutating func setOperand(_ operand: Double) {
        // remember that structs are passed around through copying
        // marking method as `mutating` designates that method can mutate struct
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
}
