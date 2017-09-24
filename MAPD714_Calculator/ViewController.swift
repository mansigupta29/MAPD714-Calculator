//
//  Name : Mansi Gupta
//  Date : Sept 24, 2017
//
//  Student Id : 300969816
//  Description : Basic Functionality
//  Version 2.0

import UIKit

class ViewController: UIViewController {

    //INHERITED METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var firstNumber = ""
    var op = ""
    var hasOp = false
    var secondNumber = ""
    var reset = false
    
    
    //OUTLETS
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    //ACTIONS METHODS
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if reset {
            firstNumber = ""
            op = ""
            hasOp = false
            secondNumber = ""
            resultLabel.text = ""
        }
        
        if resultLabel.text == "0" || hasOp{
            resultLabel.text = ""
        }
        
        let inputText = sender.titleLabel?.text
        resultLabel.text = resultLabel.text! + inputText!
        if hasOp {
            secondNumber = secondNumber + resultLabel.text!
        }
        else{
            firstNumber = firstNumber + resultLabel.text!
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        
        if firstNumber == "0" || firstNumber == "" {
            resultLabel.text = "0"
        }
        else{
            let inputOp = sender.titleLabel?.text
            
            if let operation = inputOp {
                switch operation {
                case "-","+","x","÷" :
                    op = operation
                    hasOp = true
                default:
                    resultLabel.text = "0"
                }
            }
        }
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        if secondNumber == "" {
            secondNumber = firstNumber
        }
        let firstNum = Double(firstNumber)
        let secondNum = Double(secondNumber)
        
        switch op {
        case "+":
            resultLabel.text = String(firstNum! + secondNum!)
            reset = true
        case "-":
            resultLabel.text = String(firstNum! - secondNum!)
            reset = true
        case "x":
            resultLabel.text = String(firstNum! * secondNum!)
            reset = true
        case "÷":
            resultLabel.text = String(firstNum! / secondNum!)
            reset = true
        default:
            resultLabel.text = "0"
            reset = true
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        if sender.isTouchInside {
            resultLabel.text = "0"
        }
    }
    
}

