//
//  success.swift
//  testData
//
//  Created by Barry on 2/3/15.
//  Copyright (c) 2015 iOS-Blog. All rights reserved.
//

import Foundation

class success: UIViewController {
    
    
    @IBOutlet var letterTextField: UITextField!
    
    @IBOutlet var letterLabel: UILabel!
    
    @IBOutlet var roundTextField: UITextField!
    
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
        
        var randomNumber = arc4random_uniform(10)
        println("Random number is: \(randomNumber)")
        
        
        if Int(randomNumber) == 0 {
            
            
            letterLabel.text = "A"
            
            println(letterLabel.text)
            
        }
        
        if Int(randomNumber) == 1 {
            
            letterLabel.text = "B"
            println(letterLabel.text)
            
        }
        
        if Int(randomNumber) == 2 {
            
            letterLabel.text = "C"
            println(letterLabel.text)
            
        }
        
        if Int(randomNumber) == 3 {
            
            letterLabel.text = "D"
            println(letterLabel.text)
            
        }
        
        if Int(randomNumber) == 4 {
            
            letterLabel.text = "E"
            println(letterLabel.text)
            
        }
        
        if Int(randomNumber) == 5 {
            
            letterLabel.text = "F"
            println(letterLabel.text)
            
        }
        
        if Int(randomNumber) == 6 {
            
            letterLabel.text = "G"
            println(letterLabel.text)
            
        }
        
        if Int(randomNumber) == 7 {
            
            letterLabel.text = "H"
            println(letterLabel.text)
            
        }
        
        if Int(randomNumber) == 8 {
            
            letterLabel.text = "I"
            println(letterLabel.text)
            
        }
        
        if Int(randomNumber) == 9 {
            
            letterLabel.text = "J"
            println(letterLabel.text)
            
        }
    
    //var myGame = PFObject(className: "game")
    var query = PFQuery(className: "game")
        query.whereKey("player", equalTo: PFUser.currentUser())
        
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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