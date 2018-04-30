//
//  Mak24ViewController.swift
//  Make24
//
//  Created by admin on 4/29/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
//import NotificationBannerSwift

class Mak24ViewController: UIViewController {

    @IBOutlet weak var Number1: UIButton!
    @IBOutlet weak var Number2: UIButton!
    @IBOutlet weak var Number3: UIButton!
    @IBOutlet weak var Number4: UIButton!
    @IBOutlet weak var CalcTextView: UITextView!
    
    @IBOutlet weak var TimeField: UITextField!
    @IBOutlet weak var AttemptLabel: UITextField!
    @IBOutlet weak var SuccessField: UITextField!
    @IBOutlet weak var SkipField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    var bingoAlert : UIAlertController!
    var errorAlert : UIAlertController!
    var timer = Timer();
    var intCounter = 0;
  //  var errorBanner : NotificationBanner!
    @IBAction func tapNumber1(_ sender: UIButton) {
        CalcTextView.insertText(Number1.title(for:.normal)!)
        toggleNumber(Number1)
        enableDone()
    }
    
    @IBAction func tapNumber2(_ sender: UIButton) {
        CalcTextView.insertText(Number2.title(for:.normal)!)
        toggleNumber(Number2)
        enableDone()
    }
    
    @IBAction func tapNumber3(_ sender: UIButton) {
        CalcTextView.insertText(Number3.title(for:.normal)!)
        toggleNumber(Number3)
        enableDone()
    }
    @IBAction func tapNumber4(_ sender: UIButton) {
        CalcTextView.insertText(Number4.title(for:.normal)!)
        toggleNumber(Number4)
        enableDone()
    }

    
    @IBAction func tapPlus(_ sender: UIButton) {
          CalcTextView.insertText("+")
    }
    @IBAction func tapMinus(_ sender: UIButton) {
        CalcTextView.insertText("-")
    }
    @IBAction func tapMultiply(_ sender: Any) {
        CalcTextView.insertText("*")
    }
    @IBAction func tapDivide(_ sender: Any) {
        CalcTextView.insertText("/")
    }
    
    @IBAction func tapLeftBrac(_ sender: Any) {
        CalcTextView.insertText("(")
    }
    @IBAction func tapRightBrac(_ sender: Any) {
        CalcTextView.insertText(")")
    }
    
    func toggleNumber(_ number: UIButton!){
        if(number.isEnabled) {
            number.alpha = 0.5
        }
        else {
            number.alpha = 1
        }
        number.isEnabled = !number.isEnabled
    }
    
    func enableDone(){
        if(Number1.isEnabled || Number2.isEnabled
        || Number3.isEnabled || Number4.isEnabled)
        {
            doneButton.isEnabled = true;
            doneButton.alpha = 1;
    
        }
    }
    
    @IBAction func tapDelete(_ sender: Any) {
        
        
        if(!CalcTextView.text.isEmpty){
        let lastChar = CalcTextView.text.last!
        //CalcTextView.insertText(String(lastChar))
        switch lastChar {
        case Number1.title(for: .normal)!.last!:
            if(!Number1.isEnabled){
                toggleNumber(Number1)
                break;
            }
            fallthrough
        case Number2.title(for: .normal)!.last!:
            if(!Number2.isEnabled){
                toggleNumber(Number2)
                break;
            }
            fallthrough
        case Number3.title(for: .normal)!.last!:
            if(!Number3.isEnabled){
                toggleNumber(Number3)
                break;
            }
            fallthrough
        case Number4.title(for: .normal)!.last!:
            if(!Number4.isEnabled){
                toggleNumber(Number4)
                break;
            }
            fallthrough
        default:
            break;
        }
        
        CalcTextView.deleteBackward()
            if(CalcTextView.text.isEmpty)
            {
                doneButton.isEnabled=(!doneButton.isEnabled);
                doneButton.alpha=0.5;
            }
        }
        
        
        
    }
    
    func calculate(_ equation : String){
        let expr = NSExpression(format: equation)
        if let result = expr.expressionValue(with: nil, context: nil) as? Int {
            if result==24 {
            SuccessField.text = String(Int(SuccessField.text!)!+1);
            bingoAlert.message = equation + "= 24";
            self.present(bingoAlert, animated: true, completion: nil)
            }
            else {
             self.present(errorAlert, animated: true, completion: nil)
         //       errorBanner.show()
            }
        } else {
            print("failed")
        }
        
    }
    
    @IBAction func tapDone(_ sender: Any) {
        //Do Calc
        let expression:String = CalcTextView.text!;
        AttemptLabel.text = String(Int(AttemptLabel.text!)!+1);
        calculate(expression);
    }
    
    
    func randomNumber() -> Int {
        return Int(arc4random_uniform(8))+1
    }
    
    func startNewGame(alert : UIAlertAction?=nil){
        
        Number1.setTitle(String(self.randomNumber()), for: .normal)
        Number2.setTitle(String(self.randomNumber()), for: .normal)
        Number3.setTitle(String(self.randomNumber()), for: .normal)
        Number4.setTitle(String(self.randomNumber()), for: .normal)
        doneButton.isEnabled = false;
        doneButton.alpha = 0.5;

        Number1.isEnabled=true;
        Number2.isEnabled=true;
        Number3.isEnabled=true;
        Number4.isEnabled=true;
        
        Number1.alpha = 1;
        Number2.alpha = 1;
        Number3.alpha = 1;
        Number4.alpha = 1;
        
        TimeField.text = "00:00";
        intCounter = 0;
    }
    
    
    @IBAction func tapSkip(_ sender: UIBarButtonItem) {
        startNewGame();
        SkipField.text = String(Int(SkipField.text!)!+1);
    }
    
    
    @IBAction func tapClear(_ sender: UIBarButtonItem) {
        CalcTextView.text! = ""
        
        Number1.isEnabled=true;
        Number2.isEnabled=true;
        Number3.isEnabled=true;
        Number4.isEnabled=true;
        
        Number1.alpha = 1;
        Number2.alpha = 1;
        Number3.alpha = 1;
        Number4.alpha = 1;
    }
    
    
    @IBAction func showSolution(_ sender: Any) {
        let solutionAlert = UIAlertController(title: "Solution", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        solutionAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        solutionAlert.message! = "()"
        
         self.present(solutionAlert, animated: true, completion: nil)
    }
    
    @IBAction func assignNumbers(_ sender: Any) {
        
        let assignAlert = UIAlertController(title: "Assign Numbers", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        assignAlert.addAction(UIAlertAction(title: "Assign", style: UIAlertActionStyle.default, handler: nil))
        assignAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        assignAlert.addTextField { (number1: UITextInput) in
          //  number1.text(in: UITextRange(make))
        }
        assignAlert.addTextField { (number2: UITextInput) in
          //  number2.text(in: UITextRange())
        }
        assignAlert.addTextField { (number3: UITextInput) in
         //  number3.text(in: UITextRange())
        }
        assignAlert.addTextField { (number4: UITextInput) in
           // number4.text(in: UITextRange())
        }
     //assignAlert.a
      //      assignAlert.addTextField(configurationHandler: (number3: UITextInputMode) in
             self.present(assignAlert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create the alert
         bingoAlert = UIAlertController(title: "Bingoo!!", message: "This is my message.", preferredStyle: UIAlertControllerStyle.alert)
        // add an action (button)
        bingoAlert.addAction(UIAlertAction(title: "Next Puzzle", style: UIAlertActionStyle.default, handler: startNewGame))
        
        
        
        errorAlert = UIAlertController(title: "Incorrect!!", message: " Please try again!", preferredStyle: UIAlertControllerStyle.actionSheet)
        errorAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        
       // errorBanner = NotificationBanner(title: "", subtitle: "", style: .failure)

        
        AttemptLabel.text = "1";
        SuccessField.text = "0";
        SkipField.text = "0"
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
        
        
        startNewGame()
        // Do any additional setup after loading the view.
    }
    
    
    @objc func updateCountdown() {
        intCounter += 1
        
        //Set counter in UILabel
        TimeField.text! = String(format: "%02d:%02d", (intCounter % 3600) / 60, (intCounter % 3600) % 60)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
