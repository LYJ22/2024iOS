//
//  ViewController.swift
//  Calculator
//
//  Created by lyj on 12/9/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelDisplay: UILabel!
    
    var isArithmeticOn = false
    var symbol = ""
    var num1 = 0
    var num2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if labelDisplay.text == "0" {
            labelDisplay.text = digit
        }else{
            labelDisplay.text = labelDisplay.text! + digit
        }
    }
    
    
    @IBAction func add(_ sender: UIButton) {
        if !isArithmeticOn {
            symbol = "+"
            num1 = Int(labelDisplay.text!)!
            
            labelDisplay.text = "0"
            isArithmeticOn = !isArithmeticOn
        }
    }
    
    @IBAction func sub(_ sender: UIButton) {
        if !isArithmeticOn {
            symbol = "-"
            num1 = Int(labelDisplay.text!)!
            
            labelDisplay.text = "0"
            isArithmeticOn = !isArithmeticOn
        }
    }
    
    @IBAction func mul(_ sender: UIButton) {
        if !isArithmeticOn {
            symbol = "*"
            num1 = Int(labelDisplay.text!)!
            
            labelDisplay.text = "0"
            isArithmeticOn = !isArithmeticOn
        }
    }
    
    @IBAction func div(_ sender: UIButton) {
        if !isArithmeticOn {
            symbol = "/"
            num1 = Int(labelDisplay.text!)!
            
            labelDisplay.text = "0"
            isArithmeticOn = !isArithmeticOn
        }
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        if isArithmeticOn {
            num2 = Int(labelDisplay.text!)!
            
            if symbol == "+" {
                labelDisplay.text = String(num1 + num2)
            }
            else if symbol == "-"{
                labelDisplay.text = String(num1 - num2)
            }
            else if symbol == "*"{
                labelDisplay.text = String(num1 * num2)
            }
            else {
                labelDisplay.text = String(num1 / num2)
            }
            
            isArithmeticOn = !isArithmeticOn
            symbol = ""
            num1 = Int(labelDisplay.text!)!
            num2 = 0
        }
    }
    
    @IBAction func erase(_ sender: UIButton) {
        labelDisplay.text = "0"
        isArithmeticOn = false
        symbol = ""
        num1 = 0
        num2 = 0
    }
    
    
}

