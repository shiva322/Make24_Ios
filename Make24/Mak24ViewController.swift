//
//  Mak24ViewController.swift
//  Make24
//
//  Created by admin on 4/29/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

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
    
    @IBAction func tapNumber1(_ sender: UIButton) {
        CalcTextView.insertText(Number1.title(for:.normal)!)
            Number1.isEnabled = false;
            Number1.alpha = 0.5
    }
    
    @IBAction func tapNumber2(_ sender: UIButton) {
        CalcTextView.insertText(Number2.title(for:.normal)!)
        Number2.isEnabled = false;
        Number2.alpha = 0.5
    }
    
    @IBAction func tapNumber3(_ sender: UIButton) {
        CalcTextView.insertText(Number3.title(for:.normal)!)
        Number3.isEnabled = false;
        Number3.alpha = 0.5
    }
    @IBAction func tapNumber4(_ sender: UIButton) {
        CalcTextView.insertText(Number4.title(for:.normal)!)
        Number4.isEnabled = false;
        Number4.alpha = 0.5
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
    @IBAction func tapDelete(_ sender: Any) {
        if(!CalcTextView.text.isEmpty){
        let lastChar = CalcTextView.text.last!
        //CalcTextView.insertText(String(lastChar))
        switch lastChar {
        case Number1.title(for: .normal)!.last!:
            if(!Number1.isEnabled){
                Number1.isEnabled = true
                Number1.alpha = 1
                break;
            }
            fallthrough
        case Number2.title(for: .normal)!.last!:
            if(!Number2.isEnabled){
                Number2.isEnabled = true
                Number2.alpha = 1
                break;
            }
            fallthrough
        case Number3.title(for: .normal)!.last!:
            if(!Number3.isEnabled){
                Number3.isEnabled = true
                Number3.alpha = 1
                break;
            }
            fallthrough
        case Number4.title(for: .normal)!.last!:
            if(!Number4.isEnabled){
                Number4.isEnabled = true
                Number4.alpha = 1
                break;
            }
            fallthrough
        default:
            break;
        }
        CalcTextView.deleteBackward()
        }
    }
    
    @IBAction func tapDone(_ sender: Any) {
        //Do Calc
       // let expression = CalcTextView.text!;
       // calculate(expression);
    }
    
    
    func randomNumber() -> Int {
        return Int(arc4random_uniform(8))+1
    }
    
    func startNewGame(){
        Number1.setTitle(String(self.randomNumber()), for: .normal)
        Number2.setTitle(String(self.randomNumber()), for: .normal)
        Number3.setTitle(String(self.randomNumber()), for: .normal)
        Number4.setTitle(String(self.randomNumber()), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AttemptLabel.text = "1";
        SuccessField.text = "0";
        SkipField.text = "0"
        TimeField.text = "00:00";
        startNewGame()
        // Do any additional setup after loading the view.
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
