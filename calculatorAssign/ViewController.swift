/*
// Author: Yan Romanenko
// App: Calculator
// Date: 25nd September 2017
// Version: 0.6 line of calculations without pressing "="
 */

import UIKit

class ViewController: UIViewController {

    
    // Outlets
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    
    // !!!!!!!!!!
    var typing = false;
    var dotLimit = false;
    var firstOperand: Double = 0;
    var secondOperand: Double = 0;
    var operationSign = "";
    var currentNumber: Double {
        get{
            return Double(resultLabel.text!)!;
        }
        set{
            let value = "\(newValue)";
            let valueSeparArray = value.components(separatedBy: ".");
            if valueSeparArray[1] == "0" {
                resultLabel.text = "\(valueSeparArray[0])";
            } else {
                resultLabel.text = "\(newValue)";
            }
            typing = false;
        }
    };
    
    
    
    
    
    // Actions
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if (typing == true){
            resultLabel.text = resultLabel.text! + number;
        } else {
            resultLabel.text = number;
            typing = true;
        }
    }
    
    @IBAction func twoOperandsMath(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentNumber;
        print(firstOperand);
        typing = false;
        dotLimit = false;
    }
    
    

    
    func operationWithTwoOperands(operation: (Double, Double) -> Double){
        currentNumber = operation(firstOperand, secondOperand);
        typing = false;
    }

    @IBAction func equalSign(_ sender: UIButton) {
        if (typing == true) {
            secondOperand = currentNumber;
        }
        dotLimit = false;
        
        switch operationSign {
        case "/":            operationWithTwoOperands{$0 / $1};
        case "x":
            operationWithTwoOperands{$0 * $1};
        case "+":
            operationWithTwoOperands{$0 + $1};
        case "-":
            operationWithTwoOperands{$0 - $1};
            default: break;
        }
        
        
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        firstOperand = 0;
        secondOperand = 0;
        currentNumber = 0;
        resultLabel.text = "0";
        typing = false;
        dotLimit = false;
        operationSign = "";
        
    }
    
    @IBAction func plusMinusPressed(_ sender: UIButton) {
        currentNumber = -currentNumber;
    }
    
    @IBAction func percentagePressed(_ sender: UIButton) {
        if (firstOperand == 0){
            currentNumber = currentNumber/100;
        } else{
            secondOperand = firstOperand * currentNumber/100;
        }
        typing = false;
    }
    
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if (typing && !dotLimit){
            resultLabel.text = resultLabel.text! + ".";
            dotLimit = true;
        } else  if(typing && dotLimit){
            resultLabel.text = "0.";
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

