/*
// Author: Yan Romanenko
// App: Calculator
// Date: 22nd September 2017
// Version: 0.3 min nath functionality added
 */

import UIKit

class ViewController: UIViewController {

    
    // Outlets
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    
    // !!!!!!!!!!
    var typing = false;
    var firstOperand: Double = 0;
    var secondOperand: Double = 0;
    var operationSign = "";
    var currentNumber: Double {
        get{
            return Double(resultLabel.text!)!;
        }
        set{
            resultLabel.text = "\(newValue)";
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
    }
    
    

    
    func operationWithTwoOperands(operation: (Double, Double) -> Double){
        currentNumber = operation(firstOperand, secondOperand);
        typing = false;
    }

    @IBAction func equalSign(_ sender: UIButton) {
        if (typing == true) {
            secondOperand = currentNumber;
        }
        switch operationSign {
        case "/":
            operationWithTwoOperands{$0 / $1};
        case "x":
            operationWithTwoOperands{$0 * $1};
        case "+":
            operationWithTwoOperands{$0 + $1};
        case "-":
            operationWithTwoOperands{$0 - $1};
        default: break;
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

