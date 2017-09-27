//
//  Name : Mansi Gupta
//  Date : Sept 26, 2017
//
//  Student Id : 300969816
//  Description : Basic Functionality with Decimal
//  Version 2.2

import UIKit

class ViewController: UIViewController {

    //INHERITED METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //VARIABLES
    var firstNumber = ""
    var op = ""
    var hasOp = false
    var secondNumber = ""
    var reset = false
    var decimal = true
    var recurssiveFir = ""
    
    //OUTLETS
    @IBOutlet weak var resultLabel: UILabel!
    
    
    //ACTIONS METHODS
    //Method for all the numbers from 0-9 and Decimal
    @IBAction func numbers(_ sender: UIButton) {
        
        //When first number is entered then it should be displayed
        if resultLabel.text == "0" || (hasOp && secondNumber == ""){
            resultLabel.text = ""
        }
        //If one calculation is done then clear everything for new calculation
        if reset && hasOp == false{
            firstNumber = ""
            secondNumber = ""
            hasOp = false
            resultLabel.text = ""
            reset = false
        }
        
        let inputText = sender.titleLabel?.text
        
        //When decimal is entered
        if inputText == "." && decimal == true {
            resultLabel.text = resultLabel.text! + inputText!
            decimal = false
            
            if hasOp {
                secondNumber = secondNumber + inputText!
            }
                //first number is saved
            else{
                firstNumber = firstNumber + inputText!
            }
        }
            //When consecutive decimal is pressed then it is not displayed
        else if inputText == "." && decimal == false{
            resultLabel.text = resultLabel.text!
        }
            //To display number one after another when entered
        else {
        resultLabel.text = resultLabel.text! + inputText!
        
            //Second number is saved
        if hasOp {
            secondNumber = secondNumber + inputText!
        }
            //first number is saved
        else{
            firstNumber = firstNumber + inputText!
        }
        }
    }
    
    //Method for all operations
    @IBAction func operation(_ sender: UIButton) {
        
        //If any operation is pressed before any number then it should display 0
        if resultLabel.text == "0" || resultLabel.text == ""{
            resultLabel.text = "0"
        }
          //For storing the operation that is to be performed
        else{
           
            let inputOp = sender.titleLabel?.text
            
            //Switch case for operations
            if let operation = inputOp {
                switch operation {
                case "-","+","x","÷" :
                    //For multiple operations before final result
                    if firstNumber != "" && hasOp && secondNumber != "" {
                        self.calculate(UIButton())
                        firstNumber = resultLabel.text!
                        secondNumber = ""
                        
                    }
                    recurssiveFir = firstNumber
                    decimal = true
                    op = operation
                    hasOp = true
                    resultLabel.text = firstNumber
                default:
                    resultLabel.text = "0"
                }
            }
        }
    }
    
    //Calculation on Pressing Equals
    @IBAction func calculate(_ sender: UIButton) {
        //When equals is entered then 0 should be displayed
        if firstNumber ==  "" {
                resultLabel.text = "0"
        }
            //When equals is entered then first number should be displayed
        else if secondNumber == "" && firstNumber != "" && hasOp == false{
            resultLabel.text = firstNumber
        }
            //When Second number is not entered then operation is performed on First Number
        else{
            if secondNumber == "" && firstNumber != "" && hasOp == true {
                secondNumber = recurssiveFir
            }
        let firstNum = Double(firstNumber)
        let secondNum = Double(secondNumber)
        
            //Switch operation for doing the operation between 2 numbers
        switch op {
        case "+":
            resultLabel.text = String(firstNum! + secondNum!)
            reset = true
            firstNumber = resultLabel.text!
            secondNumber = ""
            decimal = true
        case "-":
            resultLabel.text = String(firstNum! - secondNum!)
            reset = true
            firstNumber = resultLabel.text!
            secondNumber = ""
            decimal = true
        case "x":
            resultLabel.text = String(firstNum! * secondNum!)
            reset = true
            firstNumber = resultLabel.text!
            secondNumber = ""
            decimal = true
        case "÷":
            resultLabel.text = String(firstNum! / secondNum!)
            reset = true
            firstNumber = resultLabel.text!
            secondNumber = ""
            decimal = true
        default:
            resultLabel.text = "0"
        }
        }
    }
    
    //Clearing everything  
    @IBAction func clear(_ sender: UIButton) {
        if sender.isTouchInside{
        if reset {
            firstNumber = ""
            secondNumber = ""
            hasOp = false
            resultLabel.text = "0"
            reset = false
        }
        else if hasOp {
            secondNumber = ""
            resultLabel.text = "0"
            }
        else{
            resultLabel.text = "0"
            firstNumber = ""
        }
    }
    }
    
    
}

