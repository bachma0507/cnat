//
//  success.swift
//  testData
//
//  Created by Barry on 2/3/15.
//  Copyright (c) 2015 iOS-Blog. All rights reserved.
//

import Foundation


class success: UIViewController {
    
    var gcEnabled = Bool() // Stores if the user has Game Center enabled
    var gcDefaultLeaderBoard = String() // Stores the default leaderboardID
    
    @IBOutlet var letterTextField: UITextField!
    
    @IBOutlet var letterLabel: UILabel!
    
    @IBOutlet var roundTextField: UITextField!
    
    @IBOutlet var roundLabel: UILabel!
    
    @IBOutlet var chooseCatButton: UIButton!
    
    @IBOutlet var secondsTextField: UITextField!
    
    @IBOutlet var gameViewButton: UIButton!
    
    @IBAction func gameViewButtonClicked(sender: AnyObject) {
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo:PFUser.currentUser())
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !(error != nil) {
                for object in objects {
                    
                    var myLetter = object["letter"]! as? String
                    
                    println("the value of letter when game view tapped is \(myLetter!)")
                    
                    if myLetter! == "NO LETTER" || myLetter! == "" {
                        
                        //SCLAlertView().showError("Oops...", subTitle:"Please enter tap on Pick Letter before starting round.", closeButtonTitle:"OK")
                        let alert = UIAlertView()
                        alert.title = "Oops!"
                        alert.message = "Please tap on Pick Letter before starting round."
                        alert.addButtonWithTitle("Ok")
                        alert.show()
                    }
                    
                }
            }
        }
    }
    
    func saveRound() {
        
        if roundTextField.text == ""{
            
            SCLAlertView().showError("Oops...", subTitle:"Please enter Round number before Picking Letter", closeButtonTitle:"OK")
        }
        
        else{
        
        var myRound = roundTextField.text
            //var myRound = roundLabel.text
        
        NSUserDefaults.standardUserDefaults().setObject("0", forKey: "\(myRound)")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo: PFUser.currentUser())
        
        query.getFirstObjectInBackgroundWithBlock {
            (myGame: PFObject!, error: NSError!) -> Void in
            if error != nil {
                NSLog("%@", error)
            } else {
                myGame["Round"] = self.roundTextField.text
                myGame["Round"] = self.roundLabel.text
                
                myGame.saveInBackgroundWithBlock {
                    (success: Bool, error: NSError!) -> Void in
                    if (success) {
                        // The object has been saved.
                    } else if error != nil {
                        let errorString = "\(error)"
                        SCLAlertView().showError("Oops...", subTitle:"There was an error: \(errorString)", closeButtonTitle:"OK")
                        // Show the errorString somewhere and let the user try again.
                    }
                }
                
            }
            }
        }
        
    }
    
    func saveSeconds(){
        
        if secondsTextField.text == ""{
            
            SCLAlertView().showError("Oops...", subTitle:"Please enter Seconds before Picking Letter", closeButtonTitle:"OK")
        }
            
        else{
            
            var query = PFQuery(className: "game")
            query.whereKey("player", equalTo: PFUser.currentUser())
            
            query.getFirstObjectInBackgroundWithBlock {
                (myGame: PFObject!, error: NSError!) -> Void in
                if error != nil {
                    NSLog("%@", error)
                } else {
                    myGame["seconds"] = self.secondsTextField.text
                    myGame.saveInBackgroundWithBlock {
                        (success: Bool, error: NSError!) -> Void in
                        if (success) {
                            // The object has been saved.
                        } else if error != nil {
                            let errorString = "\(error)"
                            SCLAlertView().showError("Oops...", subTitle:"There was an error: \(errorString)", closeButtonTitle:"OK")
                            // Show the errorString somewhere and let the user try again.
                        }
                    }
                    
                }
            }
        }

    }
    
    func finishGame(){
        
        roundTextField.text = "1"
        roundLabel.text = "1"
        secondsTextField.text = "60"
        
        NSUserDefaults.standardUserDefaults().removeObjectForKey("1")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("2")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("3")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("4")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("5")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("6")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("7")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("8")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("9")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("10")
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo: PFUser.currentUser())
        
        query.getFirstObjectInBackgroundWithBlock {
            (myGame: PFObject!, error: NSError!) -> Void in
            if error != nil {
                NSLog("%@", error)
            } else {
                myGame.removeObjectForKey("Round")
                myGame.removeObjectForKey("letter")
                myGame.removeObjectForKey("seconds")
                //myGame["seconds"] = "60"
                myGame.saveInBackgroundWithBlock {
                    (success: Bool, error: NSError!) -> Void in
                    if (success) {
                        // The object has been saved.
                    } else if error != nil {
                        let errorString = "\(error)"
                        SCLAlertView().showError("Oops...", subTitle:"There was an error: \(errorString)", closeButtonTitle:"OK")
                        // Show the errorString somewhere and let the user try again.
                    }
                }
                
            }
        }
        
    }
    
    @IBAction func EndGame(sender: AnyObject) {
        
        finishGame()
        
    }
    
    @IBAction func retrieveButtonPressed(sender: AnyObject) {
        
        updateObject()
        
        saveRound()
        
        saveSeconds()
        
    }
    
    func updateObject(){
        
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo: PFUser.currentUser())
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !(error != nil) {
                for object in objects {
                    
                    var myField1 = object["field1"]! as! String
                    var myField2 = object["field2"]! as! String
                    var myField3 = object["field3"]! as! String
                    var myField4 = object["field4"]! as! String
                    var myField5 = object["field5"]! as! String
                    var myField6 = object["field6"]! as! String
                    var myField7 = object["field7"]! as! String
                    var myField8 = object["field8"]! as! String
                    var myField9 = object["field9"]! as! String
                    var myField10 = object["field10"]! as! String
                    
                    if myField1 == "empty" && myField2 == "empty" && myField3 == "empty" && myField4 == "empty" && myField5 == "empty" && myField6 == "empty" && myField7 == "empty" && myField8 == "empty" && myField9 == "empty" && myField10 == "empty" {
                        
                        //SCLAlertView().showError("Oops...", subTitle:"Please choose at least one category before starting game.", closeButtonTitle:"OK")
                        let alert = UIAlertView()
                        alert.title = "Oops!"
                        alert.message = "Please choose at least one category before starting game."
                        alert.addButtonWithTitle("Ok")
                        alert.show()
                    }
                    else{
                        
                        self.gameViewButton.enabled = true
                        
                        var randomNumber = arc4random_uniform(10)
                        println("Random number is: \(randomNumber)")
                        
                        
                        if Int(randomNumber) == 0 {
                            
                            
                            self.letterLabel.text = "A"
                            
                            println(self.letterLabel.text)
                            
                        }
                        
                        if Int(randomNumber) == 1 {
                            
                            self.letterLabel.text = "B"
                            println(self.letterLabel.text)
                            
                        }
                        
                        if Int(randomNumber) == 2 {
                            
                            self.letterLabel.text = "C"
                            println(self.letterLabel.text)
                            
                        }
                        
                        if Int(randomNumber) == 3 {
                            
                            self.letterLabel.text = "D"
                            println(self.letterLabel.text)
                            
                        }
                        
                        if Int(randomNumber) == 4 {
                            
                            self.letterLabel.text = "E"
                            println(self.letterLabel.text)
                            
                        }
                        
                        if Int(randomNumber) == 5 {
                            
                            self.letterLabel.text = "F"
                            println(self.letterLabel.text)
                            
                        }
                        
                        if Int(randomNumber) == 6 {
                            
                            self.letterLabel.text = "G"
                            println(self.letterLabel.text)
                            
                        }
                        
                        if Int(randomNumber) == 7 {
                            
                            self.letterLabel.text = "H"
                            println(self.letterLabel.text)
                            
                        }
                        
                        if Int(randomNumber) == 8 {
                            
                            self.letterLabel.text = "I"
                            println(self.letterLabel.text)
                            
                        }
                        
                        if Int(randomNumber) == 9 {
                            
                            self.letterLabel.text = "J"
                            println(self.letterLabel.text)
                            
                        }
                        
                        
                        query.getFirstObjectInBackgroundWithBlock {
                            (myGame: PFObject!, error: NSError!) -> Void in
                            if error != nil {
                                NSLog("%@", error)
                            } else {
                                
                                myGame["letter"] = self.letterLabel.text
                                myGame.saveInBackgroundWithBlock {
                                    (success: Bool, error: NSError!) -> Void in
                                    if (success) {
                                        // The object has been saved.
                                    } else if error != nil {
                                        let errorString = "\(error)"
                                        SCLAlertView().showError("Oops...", subTitle:"There was an error: \(errorString)", closeButtonTitle:"OK")
                                        // Show the errorString somewhere and let the user try again.
                                    }
                                }
                                
                            }
                        }

                        

                    }
                }
            }
            else if error != nil {
                let errorString = "\(error)"
                SCLAlertView().showError("Oops...", subTitle:"There was an error: \(errorString)", closeButtonTitle:"OK")
                // Show the errorString somewhere and let the user try again.
            }
            
        }

        
        
    //var myGame = PFObject(className: "game")
    /*var query = PFQuery(className: "game")
        query.whereKey("player", equalTo: PFUser.currentUser())*/
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        secondsTextField.hidden = true
        roundTextField.hidden = true
        
        letterLabel.hidden = true
        
        gameViewButton.enabled = false
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo:PFUser.currentUser())
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !(error != nil) {
                for object in objects {
                    
                    var mySeconds = object["seconds"]! as? String
                    
                    var mySecondsInt = mySeconds?.toInt()
                    
                    if mySecondsInt == nil{
                        
                        mySecondsInt = 60
                    }
                    
                    var myRound = object["Round"]! as? String
                    
                    var myRoundInt = myRound?.toInt()
                    
                    if myRoundInt == nil {
                        
                        myRoundInt = 0
                    }
                    
                    var newRound = myRoundInt! + 1
                    
                    self.roundTextField.text = "\(newRound)"
                    self.roundLabel.text = "\(newRound)"
                    self.secondsTextField.text = "\(mySecondsInt!)"
                    
                    if newRound > 10 {
                        
                        //SCLAlertView().showError("Round Limit Reached", subTitle:"Tap OK to start a new game.", closeButtonTitle:"OK")
                        
                        let alert = UIAlertView()
                        alert.title = "Round Limit Reached"
                        alert.message = "Tap Ok to start a new game."
                        alert.addButtonWithTitle("Ok")
                        alert.show()
                        
                        self.finishGame()
                    }
                    
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}