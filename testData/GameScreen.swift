//
//  GameScreen.swift
//  testData
//
//  Created by Barry on 2/4/15.
//  Copyright (c) 2015 iOS-Blog. All rights reserved.
//

import Foundation
import UIKit

let kSuccessTitle = "Your Score!"

class GameScreen: UIViewController, UITextFieldDelegate {
    
    var textField: UITextField!
    
    @IBOutlet var letterLabel: UILabel!
    
    
    @IBOutlet var field1Label: UILabel!
    @IBOutlet var field1Textfield: UITextField!
    @IBOutlet var score1Textfield: UITextField!
    
    @IBOutlet var field2Label: UILabel!
    @IBOutlet var field2Textfield: UITextField!
    @IBOutlet var score2Textfield: UITextField!
    
    @IBOutlet var field3Label: UILabel!
    @IBOutlet var field3Textfield: UITextField!
    @IBOutlet var score3Textfield: UITextField!
    
    @IBOutlet var field4Label: UILabel!
    @IBOutlet var field4Textfield: UITextField!
    @IBOutlet var score4Textfield: UITextField!
    
    @IBOutlet var field5Label: UILabel!
    @IBOutlet var field5Textfield: UITextField!
    @IBOutlet var score5Textfield: UITextField!
    
    @IBOutlet var field6Label: UILabel!
    @IBOutlet var field6Textfield: UITextField!
    @IBOutlet var score6Textfield: UITextField!
    
    @IBOutlet var field7Label: UILabel!
    @IBOutlet var field7Textfield: UITextField!
    @IBOutlet var score7Textfield: UITextField!
    
    @IBOutlet var field8Label: UILabel!
    @IBOutlet var field8Textfield: UITextField!
    @IBOutlet var score8Textfield: UITextField!
    
    @IBOutlet var field9Label: UILabel!
    @IBOutlet var field9Textfield: UITextField!
    @IBOutlet var score9Textfield: UITextField!
    
    @IBOutlet var field10Label: UILabel!
    @IBOutlet var field10Textfield: UITextField!
    @IBOutlet var score10Textfield: UITextField!
    
    @IBOutlet var newButton: UIButton!
    
    @IBOutlet var mainViewButton: UIButton!
    
    @IBOutlet var timerLabel: UILabel!
    
    @IBOutlet var calculateScoreButton: UIButton!
    
    @IBAction func calculateScore(sender: AnyObject) {
        
        
        var scoreInt1 = score1Textfield.text.toInt()
        var scoreInt2 = score2Textfield.text.toInt()
        var scoreInt3 = score3Textfield.text.toInt()
        
        var scoreTotal = scoreInt1! + scoreInt2! + scoreInt3!
        
        println("Total is \(scoreTotal)")
        
        
        //let alert = SCLAlertView()
        
        //alert.showSuccess(kSuccessTitle, subTitle:"\(scoreTotal)")
        
                    let alert = UIAlertView()
                    alert.title = "Your Score!"
                    alert.message = "Your total is \(scoreTotal)"
                    alert.addButtonWithTitle("Done")
                    alert.show()
        
        
        
        calculateScoreButton.hidden = true
    }
    
//    @IBAction func refreshButtonPressed(sender: AnyObject) {
//
//        
//
//
//        field1Textfield.text = nil
//        score1Textfield.text = nil
//        
//        field2Textfield.text = nil
//        score2Textfield.text = nil
//        
//        field3Textfield.text = nil
//        score3Textfield.text = nil
//        
//        field4Textfield.text = nil
//        score4Textfield.text = nil
//        
//        field5Textfield.text = nil
//        score5Textfield.text = nil
//        
//        field6Textfield.text = nil
//        score6Textfield.text = nil
//        
//        field7Textfield.text = nil
//        score7Textfield.text = nil
//        
//        field8Textfield.text = nil
//        score8Textfield.text = nil
//        
//        field9Textfield.text = nil
//        score9Textfield.text = nil
//        
//        field10Textfield.text = nil
//        score10Textfield.text = nil
//        
//        
//    }
    
    
    var timer = NSTimer()
    
    var count = 0
    
    func updateTime() {
        
        count++
        
        timerLabel.text = "\(count)"
        
        if count == 30{
            
            field1Textfield.enabled = false
            field2Textfield.enabled = false
            field3Textfield.enabled = false
            field4Textfield.enabled = false
            field5Textfield.enabled = false
            field6Textfield.enabled = false
            field7Textfield.enabled = false
            field8Textfield.enabled = false
            field9Textfield.enabled = false
            field10Textfield.enabled = false
            
            newButton.enabled = true
            mainViewButton.enabled = true
            calculateScoreButton.hidden = false
            
            pause(self)
        }
        
    }

    func pause(sender: AnyObject) {
        
        timer.invalidate()
        
    }

    func stop(sender: AnyObject) {
        
        timer.invalidate()
        
        count = 0
        
        timerLabel.text = "0"
        
    }

    func play(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        newButton.enabled = false
        mainViewButton.enabled = false
        
    }

    
    @IBAction func updateButtonPressed(sender: AnyObject) {
        
        calculateScoreButton.hidden = true
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo:PFUser.currentUser())
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !(error != nil) {
                for object in objects {
                    
                    var myLetter = object["letter"]! as String
                    //myLetter = object["letter"] as String
                    println(myLetter)
                    
                    self.letterLabel.text = myLetter
                }
                //                else {
                //                    println("%@", error)
                //                }
            }
            
            else if error != nil {
                let errorString = "\(error)"
                SCLAlertView().showError("Oops...", subTitle:"There was an error: \(errorString)", closeButtonTitle:"OK")
                // Show the errorString somewhere and let the user try again.
            }
        }
        
        
        if letterLabel.text != nil {
            
            stop(self)
            play(self)
            
        }
        
        field1Textfield.enabled = true
        field2Textfield.enabled = true
        field3Textfield.enabled = true
        field4Textfield.enabled = true
        field5Textfield.enabled = true
        field6Textfield.enabled = true
        field7Textfield.enabled = true
        field8Textfield.enabled = true
        field8Textfield.enabled = true
        field10Textfield.enabled = true
        
        field1Textfield.text = nil
        score1Textfield.text = nil
        
        field2Textfield.text = nil
        score2Textfield.text = nil
        
        field3Textfield.text = nil
        score3Textfield.text = nil
        
        field4Textfield.text = nil
        score4Textfield.text = nil
        
        field5Textfield.text = nil
        score5Textfield.text = nil
        
        field6Textfield.text = nil
        score6Textfield.text = nil
        
        field7Textfield.text = nil
        score7Textfield.text = nil
        
        field8Textfield.text = nil
        score8Textfield.text = nil
        
        field9Textfield.text = nil
        score9Textfield.text = nil
        
        field10Textfield.text = nil
        score10Textfield.text = nil
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //textField.delegate = self
        
        calculateScoreButton.hidden = true
        
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo:PFUser.currentUser())
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !(error != nil) {
                for object in objects {
                    
                    var myLetter = object["letter"]! as String
                    //myLetter = object["letter"] as String
                    println(myLetter)
                    
                    var myField1 = object["field1"]! as String
                    var myField2 = object["field2"]! as String
                    var myField3 = object["field3"]! as String
                    var myField4 = object["field4"]! as String
                    var myField5 = object["field5"]! as String
                    var myField6 = object["field6"]! as String
                    var myField7 = object["field7"]! as String
                    var myField8 = object["field8"]! as String
                    var myField9 = object["field9"]! as String
                    var myField10 = object["field10"]! as String
                    
                    self.letterLabel.text = myLetter
                    self.field1Label.text = myField1
                    self.field2Label.text = myField2
                    self.field3Label.text = myField3
                    self.field4Label.text = myField4
                    self.field5Label.text = myField5
                    self.field6Label.text = myField6
                    self.field7Label.text = myField7
                    self.field8Label.text = myField8
                    self.field9Label.text = myField9
                    self.field10Label.text = myField10
                    
                    
                    if self.letterLabel.text == "NO LETTER" {
                        
                        SCLAlertView().showError("Oops...", subTitle:"No letter was picked! Please go back to the Main View and choose Pick Letter", closeButtonTitle:"OK")
                    }
                    
                    if self.field1Label.text == "empty" || self.field1Label.text == "" {
                        
                        self.field1Label.hidden = true
                        self.field1Textfield.hidden = true
                        self.score1Textfield.hidden = true
                        
                    }
                    
                    if self.field2Label.text == "empty" || self.field2Label.text == "" {
                        
                        self.field2Label.hidden = true
                        self.field3Textfield.hidden = true
                        self.score3Textfield.hidden = true
                        
                    }
                    
                    if self.field3Label.text == "empty" || self.field3Label.text == "" {
                        
                        self.field3Label.hidden = true
                        self.field3Textfield.hidden = true
                        self.score3Textfield.hidden = true
                        
                    }
                    
                    if self.field4Label.text == "empty" || self.field4Label.text == "" {
                        
                        self.field4Label.hidden = true
                        self.field4Textfield.hidden = true
                        self.score4Textfield.hidden = true
                        
                    }
                    
                    if self.field5Label.text == "empty" || self.field5Label.text == "" {
                        
                        self.field5Label.hidden = true
                        self.field5Textfield.hidden = true
                        self.score5Textfield.hidden = true
                        
                    }
                    
                    if self.field6Label.text == "empty" || self.field6Label.text == "" {
                        
                        self.field6Label.hidden = true
                        self.field6Textfield.hidden = true
                        self.score6Textfield.hidden = true
                        
                    }
                    
                    if self.field7Label.text == "empty" || self.field7Label.text == "" {
                        
                        self.field7Label.hidden = true
                        self.field7Textfield.hidden = true
                        self.score7Textfield.hidden = true
                        
                    }
                    
                    if self.field8Label.text == "empty" || self.field8Label.text == "" {
                        
                        self.field8Label.hidden = true
                        self.field8Textfield.hidden = true
                        self.score8Textfield.hidden = true
                        
                    }
                    
                    if self.field9Label.text == "empty" || self.field9Label.text == "" {
                        
                        self.field9Label.hidden = true
                        self.field9Textfield.hidden = true
                        self.score9Textfield.hidden = true
                        
                    }
                    
                    if self.field10Label.text == "empty" || self.field10Label.text == "" {
                        
                        self.field10Label.hidden = true
                        self.field10Textfield.hidden = true
                        self.score10Textfield.hidden = true
                        
                    }
                    
                    
                }
                //                else {
                //                    println("%@", error)
                //                }
            }
            
            else if error != nil {
                let errorString = "\(error)"
                SCLAlertView().showError("Oops...", subTitle:"There was an error: \(errorString)", closeButtonTitle:"OK")
                // Show the errorString somewhere and let the user try again.
            }
        }

        
        if letterLabel.text != nil {
            
            play(self)
            
        }
        
        
        
    }
    

    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}