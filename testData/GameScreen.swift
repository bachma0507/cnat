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
    
    @IBOutlet var roundLabel: UILabel!
    
    //MARK: Calculate Round and Total Scores
    @IBAction func calculateScore(sender: AnyObject) {
        
        
        var scoreInt1 = score1Textfield?.text.toInt()
        if scoreInt1 == nil {
            scoreInt1 = 0
        }
        
        var scoreInt2 = score2Textfield?.text.toInt()
        if scoreInt2 == nil {
            scoreInt2 = 0
        }
        
        var scoreInt3 = score3Textfield?.text.toInt()
        if scoreInt3 == nil {
            scoreInt3 = 0
        }
        
        var scoreInt4 = score4Textfield?.text.toInt()
        if scoreInt4 == nil {
            scoreInt4 = 0
        }
        
        var scoreInt5 = score5Textfield?.text.toInt()
        if scoreInt5 == nil {
            scoreInt5 = 0
        }
        
        var scoreInt6 = score6Textfield?.text.toInt()
        if scoreInt6 == nil {
            scoreInt6 = 0
        }
        
        var scoreInt7 = score7Textfield?.text.toInt()
        if scoreInt7 == nil {
            scoreInt7 = 0
        }
        
        var scoreInt8 = score8Textfield?.text.toInt()
        if scoreInt8 == nil {
            scoreInt8 = 0
        }
        
        var scoreInt9 = score9Textfield?.text.toInt()
        if scoreInt9 == nil {
            scoreInt9 = 0
        }
        
        var scoreInt10 = score10Textfield?.text.toInt()
        if scoreInt10 == nil {
            scoreInt10 = 0
        }
        
        
        
        var roundTotal1 = scoreInt1! + scoreInt2! + scoreInt3! + scoreInt4! + scoreInt5!
        var roundTotal2 = scoreInt6! + scoreInt7! + scoreInt8! + scoreInt9! + scoreInt10!
        
        var totalRoundScore = roundTotal1 + roundTotal2
        
        println("Total is \(totalRoundScore)")
        
        
        
        
        NSUserDefaults.standardUserDefaults().setObject("\(totalRoundScore)", forKey: "\(roundLabel.text!)") // we are saving a variable called myName and we are giving it the value of "Bob"
        NSUserDefaults.standardUserDefaults().synchronize()
        //println(NSUserDefaults.standardUserDefaults().objectForKey("2")!)
        
        var score1 : String? = (NSUserDefaults.standardUserDefaults().objectForKey("1")) as? String
        var score1Int = score1?.toInt()
        
        if score1Int == nil {
            
            score1Int = 0
        }
        
        println("Value of score1Int is \(score1Int!)")
        
        var score2 : String? = (NSUserDefaults.standardUserDefaults().objectForKey("2")) as? String
        var score2Int = score2?.toInt()
        
        if score2Int == nil {
            
            score2Int = 0
        }
        
        println("Value of score2Int is \(score2Int!)")
        
        var score3 : String? = (NSUserDefaults.standardUserDefaults().objectForKey("3")) as? String
        var score3Int = score3?.toInt()
        
        if score3Int == nil {
            
            score3Int = 0
        }
        
        var score4 : String? = (NSUserDefaults.standardUserDefaults().objectForKey("4")) as? String
        var score4Int = score4?.toInt()
        
        if score4Int == nil {
            
            score4Int = 0
        }
        
        var score5 : String? = (NSUserDefaults.standardUserDefaults().objectForKey("5")) as? String
        var score5Int = score5?.toInt()
        
        if score5Int == nil {
            
            score5Int = 0
        }
        
        var score6 : String? = (NSUserDefaults.standardUserDefaults().objectForKey("6")) as? String
        var score6Int = score6?.toInt()
        
        if score6Int == nil {
            
            score6Int = 0
        }
        
        var score7 : String? = (NSUserDefaults.standardUserDefaults().objectForKey("7")) as? String
        var score7Int = score7?.toInt()
        
        if score7Int == nil {
            
            score7Int = 0
        }
        
        var score8 : String? = (NSUserDefaults.standardUserDefaults().objectForKey("8")) as? String
        var score8Int = score8?.toInt()
        
        if score8Int == nil {
            
            score8Int = 0
        }
        
        var score9 : String? = (NSUserDefaults.standardUserDefaults().objectForKey("9")) as? String
        var score9Int = score9?.toInt()
        
        if score9Int == nil {
            
            score9Int = 0
        }
        
        var score10 : String? = (NSUserDefaults.standardUserDefaults().objectForKey("10")) as? String
        var score10Int = score10?.toInt()
        
        if score10Int == nil {
            
            score10Int = 0
        }


        
        var totalScore1 = score1Int! + score2Int! + score3Int! + score4Int! + score5Int!
        
        var totalScore2 = score6Int! + score7Int! + score8Int! + score9Int!  + score10Int!
        
        var grandTotal = totalScore1 + totalScore2
        
        //let alert = SCLAlertView()
        
        //alert.showSuccess(kSuccessTitle, subTitle:"\(scoreTotal)")
        
        let alert = UIAlertView()
        alert.title = "Your Score"
        alert.message = "Your Score for Round \(roundLabel.text!) is \(totalRoundScore). Your Grand Total for all rounds is \(grandTotal)"
        alert.addButtonWithTitle("Done")
        alert.show()
        
        calculateScoreButton.hidden = true
    }
    
    
//MARK: Timer functions
    
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
            
            var query = PFQuery(className: "game")
            query.whereKey("player", equalTo:PFUser.currentUser())
            
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]!, error: NSError!) -> Void in
                if !(error != nil) {
                    for object in objects {
                        
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
                        
                        
                        if self.field1Label.text == "empty" || self.field1Label.text == "" {
                            
                            self.field1Label.hidden = true
                            self.field1Textfield.hidden = true
                            self.score1Textfield.hidden = true
                            
                        }
                        else{
                            
                            self.score1Textfield.hidden = false
                        }
                        
                        if self.field2Label.text == "empty" || self.field2Label.text == "" {
                            
                            self.field2Label.hidden = true
                            self.field3Textfield.hidden = true
                            self.score3Textfield.hidden = true
                            
                        }
                        else{
                            
                            self.score2Textfield.hidden = false
                        }

                        
                        if self.field3Label.text == "empty" || self.field3Label.text == "" {
                            
                            self.field3Label.hidden = true
                            self.field3Textfield.hidden = true
                            self.score3Textfield.hidden = true
                            
                        }
                        else{
                            
                            self.score3Textfield.hidden = false
                        }

                        
                        if self.field4Label.text == "empty" || self.field4Label.text == "" {
                            
                            self.field4Label.hidden = true
                            self.field4Textfield.hidden = true
                            self.score4Textfield.hidden = true
                            
                        }
                        else{
                            
                            self.score4Textfield.hidden = false
                        }

                        
                        if self.field5Label.text == "empty" || self.field5Label.text == "" {
                            
                            self.field5Label.hidden = true
                            self.field5Textfield.hidden = true
                            self.score5Textfield.hidden = true
                            
                        }
                        else{
                            
                            self.score5Textfield.hidden = false
                        }

                        
                        if self.field6Label.text == "empty" || self.field6Label.text == "" {
                            
                            self.field6Label.hidden = true
                            self.field6Textfield.hidden = true
                            self.score6Textfield.hidden = true
                            
                        }
                        else{
                            
                            self.score6Textfield.hidden = false
                        }

                        
                        if self.field7Label.text == "empty" || self.field7Label.text == "" {
                            
                            self.field7Label.hidden = true
                            self.field7Textfield.hidden = true
                            self.score7Textfield.hidden = true
                            
                        }
                        else{
                            
                            self.score7Textfield.hidden = false
                        }

                        
                        if self.field8Label.text == "empty" || self.field8Label.text == "" {
                            
                            self.field8Label.hidden = true
                            self.field8Textfield.hidden = true
                            self.score8Textfield.hidden = true
                            
                        }
                        else{
                            
                            self.score8Textfield.hidden = false
                        }

                        
                        if self.field9Label.text == "empty" || self.field9Label.text == "" {
                            
                            self.field9Label.hidden = true
                            self.field9Textfield.hidden = true
                            self.score9Textfield.hidden = true
                            
                        }
                        else{
                            
                            self.score9Textfield.hidden = false
                        }

                        
                        if self.field10Label.text == "empty" || self.field10Label.text == "" {
                            
                            self.field10Label.hidden = true
                            self.field10Textfield.hidden = true
                            self.score10Textfield.hidden = true
                            
                        }
                        else{
                            
                            self.score10Textfield.hidden = false
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

    //MARK: Start new round
    
    @IBAction func updateButtonPressed(sender: AnyObject) {
        
        calculateScoreButton.hidden = true
        
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo:PFUser.currentUser())
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !(error != nil) {
                for object in objects {
                    
                    var myLetter = object["letter"]! as String
                    var myRound = object["Round"]! as String
                    //myLetter = object["letter"] as String
                    println(myLetter)
                    
                    self.letterLabel.text = myLetter
                    self.roundLabel.text = myRound
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
        field9Textfield.enabled = true
        field10Textfield.enabled = true
        
        field1Textfield.text = nil
        score1Textfield.text = nil
        score1Textfield.hidden = true
        
        field2Textfield.text = nil
        score2Textfield.text = nil
        score2Textfield.hidden = true
        
        field3Textfield.text = nil
        score3Textfield.text = nil
        score3Textfield.hidden = true
        
        field4Textfield.text = nil
        score4Textfield.text = nil
        score4Textfield.hidden = true
        
        field5Textfield.text = nil
        score5Textfield.text = nil
        score5Textfield.hidden = true
        
        field6Textfield.text = nil
        score6Textfield.text = nil
        score6Textfield.hidden = true
        
        field7Textfield.text = nil
        score7Textfield.text = nil
        score7Textfield.hidden = true
        
        field8Textfield.text = nil
        score8Textfield.text = nil
        score8Textfield.hidden = true
        
        field9Textfield.text = nil
        score9Textfield.text = nil
        score9Textfield.hidden = true
        
        field10Textfield.text = nil
        score10Textfield.text = nil
        score10Textfield.hidden = true
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //textField.delegate = self
        
        calculateScoreButton.hidden = true
        /*score1Textfield.hidden = true
        score2Textfield.hidden = true
        score3Textfield.hidden = true
        score4Textfield.hidden = true
        score5Textfield.hidden = true
        score6Textfield.hidden = true
        score7Textfield.hidden = true
        score8Textfield.hidden = true
        score9Textfield.hidden = true
        score10Textfield.hidden = true*/
        
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo:PFUser.currentUser())
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !(error != nil) {
                for object in objects {
                    
                    var myLetter = object["letter"]! as String
                    var myRound = object["Round"]! as String
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
                    self.roundLabel.text = myRound
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
                    else{
                        
                        self.score1Textfield.hidden = true
                    }
                    
                    if self.field2Label.text == "empty" || self.field2Label.text == "" {
                        
                        self.field2Label.hidden = true
                        self.field3Textfield.hidden = true
                        self.score3Textfield.hidden = true
                        
                    }
                    else{
                        
                        self.score2Textfield.hidden = true
                    }
                    
                    if self.field3Label.text == "empty" || self.field3Label.text == "" {
                        
                        self.field3Label.hidden = true
                        self.field3Textfield.hidden = true
                        self.score3Textfield.hidden = true
                        
                    }
                    else{
                        
                        self.score3Textfield.hidden = true
                    }
                    
                    if self.field4Label.text == "empty" || self.field4Label.text == "" {
                        
                        self.field4Label.hidden = true
                        self.field4Textfield.hidden = true
                        self.score4Textfield.hidden = true
                        
                    }
                    else{
                        
                        self.score4Textfield.hidden = true
                    }
                    
                    if self.field5Label.text == "empty" || self.field5Label.text == "" {
                        
                        self.field5Label.hidden = true
                        self.field5Textfield.hidden = true
                        self.score5Textfield.hidden = true
                        
                    }
                    else{
                        
                        self.score5Textfield.hidden = true
                    }
                    
                    if self.field6Label.text == "empty" || self.field6Label.text == "" {
                        
                        self.field6Label.hidden = true
                        self.field6Textfield.hidden = true
                        self.score6Textfield.hidden = true
                        
                    }
                    else{
                        
                        self.score6Textfield.hidden = true
                    }
                    
                    if self.field7Label.text == "empty" || self.field7Label.text == "" {
                        
                        self.field7Label.hidden = true
                        self.field7Textfield.hidden = true
                        self.score7Textfield.hidden = true
                        
                    }
                    else{
                        
                        self.score7Textfield.hidden = true
                    }
                    
                    if self.field8Label.text == "empty" || self.field8Label.text == "" {
                        
                        self.field8Label.hidden = true
                        self.field8Textfield.hidden = true
                        self.score8Textfield.hidden = true
                        
                    }
                    else{
                        
                        self.score8Textfield.hidden = true
                    }
                    
                    if self.field9Label.text == "empty" || self.field9Label.text == "" {
                        
                        self.field9Label.hidden = true
                        self.field9Textfield.hidden = true
                        self.score9Textfield.hidden = true
                        
                    }
                    else{
                        
                        self.score9Textfield.hidden = true
                    }
                    
                    if self.field10Label.text == "empty" || self.field10Label.text == "" {
                        
                        self.field10Label.hidden = true
                        self.field10Textfield.hidden = true
                        self.score10Textfield.hidden = true
                        
                    }
                    else{
                        
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
    
//MARK: Dismiss keyboard methods
    
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