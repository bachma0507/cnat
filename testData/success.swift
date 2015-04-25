//
//  success.swift
//  testData
//
//  Created by Barry on 2/3/15.
//  Copyright (c) 2015 iOS-Blog. All rights reserved.
//

import Foundation


class success: UIViewController {
    
    
    //var nums = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
        var nums = [0,1,2,3]
    
    var gcEnabled = Bool() // Stores if the user has Game Center enabled
    var gcDefaultLeaderBoard = String() // Stores the default leaderboardID
    
    @IBOutlet var letterTextField: UITextField!
    
    @IBOutlet var letterLabel: UILabel!
    
    @IBOutlet var roundTextField: UITextField!
    
    @IBOutlet var roundLabel: UILabel!
    
    @IBOutlet var chooseCatButton: UIButton!
    
    @IBOutlet var pickLetterButton: UIButton!
    
    @IBOutlet var secondsTextField: UITextField!
    
    @IBOutlet var gameViewButton: UIButton!
    
    @IBOutlet var endGameButton: UIButton!
    
    @IBOutlet var gameIdLabel: UILabel!
    
    @IBAction func gameViewButtonClicked(sender: AnyObject) {
        
        checkForDupeLetter()
        
//        var query = PFQuery(className: "game")
//        query.whereKey("player", equalTo:PFUser.currentUser())
//        
//        query.findObjectsInBackgroundWithBlock {
//            (objects: [AnyObject]!, error: NSError!) -> Void in
//            if !(error != nil) {
//                for object in objects {
//                    
//                    var myLetter = object["letter"]! as? String
//                    
//                    println("the value of letter when game view tapped is \(myLetter!)")
//                    
//                    if myLetter! == "NO LETTER" || myLetter! == "" {
//                        
//                        //SCLAlertView().showError("Oops...", subTitle:"Please enter tap on Pick Letter before starting round.", closeButtonTitle:"OK")
//                        let alert = UIAlertView()
//                        alert.title = "Oops!"
//                        alert.message = "Please tap on Pick Letter before starting round."
//                        alert.addButtonWithTitle("Ok")
//                        alert.show()
//                    }
//                    
//                }
//            }
//        }
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
        //secondsTextField.text = "60"
        
        pickLetterButton.enabled = true
        
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
        
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Round1")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Round2")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Round3")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Round4")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Round5")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Round6")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Round7")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Round8")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Round9")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Round10")
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo: PFUser.currentUser())
        
        query.getFirstObjectInBackgroundWithBlock {
            (myGame: PFObject!, error: NSError!) -> Void in
            if error != nil {
                NSLog("%@", error)
            } else {
                myGame.removeObjectForKey("Round")
                myGame.removeObjectForKey("letter")
                //myGame.removeObjectForKey("seconds")
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
        
        //checkForDupeLetter()
        
        pickLetterButton.enabled = false
        
        
    }
    
    func checkForDupeLetter(){
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo: PFUser.currentUser())
            query.getFirstObjectInBackgroundWithBlock {
                (myGame: PFObject!, error: NSError!) -> Void in
                if error != nil {
                    NSLog("%@", error)
                } else {
                    
                    
//                    myGame.saveInBackgroundWithBlock {
//                        (success: Bool, error: NSError!) -> Void in
//                        if (success) {
//                            // The object has been saved.
//                        } else if error != nil {
//                            let errorString = "\(error)"
//                            SCLAlertView().showError("Oops...", subTitle:"There was an error: \(errorString)", closeButtonTitle:"OK")
//                            // Show the errorString somewhere and let the user try again.
//                        }
//                    }
//
//                    
//                }
//                
//        }
        
        var letter1: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round1")) as! String
        println("letter1 is \(letter1)")
        var letter2: String? = (NSUserDefaults.standardUserDefaults().objectForKey("Round2")) as? String
        if letter2 != nil{
        println("letter2 is \(letter2)")
        }
        var letter3: String? = (NSUserDefaults.standardUserDefaults().objectForKey("Round3")) as? String
        if letter3 != nil{
            println("letter3 is \(letter3)")
        }
        var letter4: String? = (NSUserDefaults.standardUserDefaults().objectForKey("Round4")) as? String
        if letter4 != nil{
            println("letter4 is \(letter4)")
        }
        var letter5: String? = (NSUserDefaults.standardUserDefaults().objectForKey("Round5")) as? String
        if letter5 != nil{
            println("letter5 is \(letter5)")
        }
        var letter6: String? = (NSUserDefaults.standardUserDefaults().objectForKey("Round6")) as? String
        if letter6 != nil{
            println("letter6 is \(letter6)")
        }
        var letter7: String? = (NSUserDefaults.standardUserDefaults().objectForKey("Round7")) as? String
        if letter7 != nil{
            println("letter7 is \(letter7)")
        }
        var letter8: String? = (NSUserDefaults.standardUserDefaults().objectForKey("Round8")) as? String
        if letter8 != nil{
            println("letter8 is \(letter8)")
        }
        var letter9: String? = (NSUserDefaults.standardUserDefaults().objectForKey("Round9")) as? String
        if letter9 != nil{
            println("letter9 is \(letter9)")
        }
        var letter10: String? = (NSUserDefaults.standardUserDefaults().objectForKey("Round10")) as? String
        if letter10 != nil{
            println("letter10 is \(letter10)")
        }

        
        println("Round is \(self.roundLabel.text!)")
        println("Letter is \(self.letterLabel.text!)")
        
        var roundNumber = self.roundLabel.text!
        
        switch(roundNumber){
            
        case "1":
            self.performSegueWithIdentifier("gameViewSegue", sender: self)
            myGame["playerindicator"] = "yes"
            
        case "2":
            var roundLetter = self.letterLabel.text!
            switch(roundLetter){
                case "\(letter1)":
                    let alert = UIAlertView()
                    alert.title = "Oops!"
                    alert.message = "A previously used letter was generated. Please pick another letter."
                    alert.addButtonWithTitle("Ok")
                    alert.show()
                    self.pickLetterButton.enabled = true
                    self.gameViewButton.enabled = false
            default:
                self.performSegueWithIdentifier("gameViewSegue", sender: self)
                myGame["playerindicator"] = "yes"
            }
            
        case "3":
            var roundLetter = self.letterLabel.text!
            switch(roundLetter){
                    case "\(letter1)":
                        let alert = UIAlertView()
                        alert.title = "Oops!"
                        alert.message = "A previously used letter was generated. Please pick another letter."
                        alert.addButtonWithTitle("Ok")
                        alert.show()
                        self.pickLetterButton.enabled = true
                        self.gameViewButton.enabled = false
                
                    case "\(letter2!)":
                        let alert = UIAlertView()
                        alert.title = "Oops!"
                        alert.message = "A previously used letter was generated. Please pick another letter."
                        alert.addButtonWithTitle("Ok")
                        alert.show()
                        self.pickLetterButton.enabled = true
                        self.gameViewButton.enabled = false
                
            default:
                self.performSegueWithIdentifier("gameViewSegue", sender: self)
                myGame["playerindicator"] = "yes"
                
            }
            
        
        case "4":
            var roundLetter = self.letterLabel.text!
            switch(roundLetter){
            case "\(letter1)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter2!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter3!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            default:
                self.performSegueWithIdentifier("gameViewSegue", sender: self)
                myGame["playerindicator"] = "yes"
                
            }
            
        case "5":
            var roundLetter = self.letterLabel.text!
            switch(roundLetter){
            case "\(letter1)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter2!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter3!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter4!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
        
                
            default:
                self.performSegueWithIdentifier("gameViewSegue", sender: self)
                myGame["playerindicator"] = "yes"
                
            }
            
        case "6":
            var roundLetter = self.letterLabel.text!
            switch(roundLetter){
            case "\(letter1)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter2!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter3!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter4!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter5!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
                
            default:
                self.performSegueWithIdentifier("gameViewSegue", sender: self)
                myGame["playerindicator"] = "yes"
                
            }
        
        case "7":
            var roundLetter = self.letterLabel.text!
            switch(roundLetter){
            case "\(letter1)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter2!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter3!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter4!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter5!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter6!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            default:
                self.performSegueWithIdentifier("gameViewSegue", sender: self)
                myGame["playerindicator"] = "yes"
                
            }
            
        case "8":
            var roundLetter = self.letterLabel.text!
            switch(roundLetter){
            case "\(letter1)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter2!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter3!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter4!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter5!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter6!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter7!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            default:
                self.performSegueWithIdentifier("gameViewSegue", sender: self)
                myGame["playerindicator"] = "yes"
                
            }

        case "9":
            var roundLetter = self.letterLabel.text!
            switch(roundLetter){
            case "\(letter1)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter2!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter3!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter4!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter5!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter6!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter7!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter8!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            default:
                self.performSegueWithIdentifier("gameViewSegue", sender: self)
                myGame["playerindicator"] = "yes"
                
            }
            
        case "10":
            var roundLetter = self.letterLabel.text!
            switch(roundLetter){
            case "\(letter1)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter2!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter3!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter4!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter5!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter6!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter7!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter8!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            case "\(letter9!)":
                let alert = UIAlertView()
                alert.title = "Oops!"
                alert.message = "A previously used letter was generated. Please pick another letter."
                alert.addButtonWithTitle("Ok")
                alert.show()
                self.pickLetterButton.enabled = true
                self.gameViewButton.enabled = false
                
            default:
                self.performSegueWithIdentifier("gameViewSegue", sender: self)
                myGame["playerindicator"] = "yes"
                
            }
            
        default:
            self.performSegueWithIdentifier("gameViewSegue", sender: self)
                myGame["playerindicator"] = "yes"
    }
    
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

    func randomNumber() -> Int {

        var randNum = Int(arc4random_uniform(UInt32(26)))
        
        return randNum
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
                        
                        
                        var randNum = self.randomNumber()
                        println("Random number is: \(randNum)")
                            
                            if Int(randNum) == 0 {
                                
                                
                                self.letterLabel.text = "A"
                                
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 1 {
                                
                                self.letterLabel.text = "B"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 2 {
                                
                                self.letterLabel.text = "C"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 3 {
                                
                                self.letterLabel.text = "D"
                                println(self.letterLabel.text!)
                                
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                                            }
                            
                            if Int(randNum) == 4 {
                                
                                self.letterLabel.text = "E"
                                println(self.letterLabel.text!)
                                
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                            }
                            
                            if Int(randNum) == 5 {
                                
                                self.letterLabel.text = "F"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 6 {
                                
                                self.letterLabel.text = "G"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 7 {
                                
                                self.letterLabel.text = "H"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 8 {
                                
                                self.letterLabel.text = "I"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 9 {
                                
                                self.letterLabel.text = "J"
                                println(self.letterLabel.text!)
                                
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                            }
                            if Int(randNum) == 10 {
                                
                                
                                self.letterLabel.text = "K"
                                
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 11 {
                                
                                self.letterLabel.text = "L"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 12 {
                                
                                self.letterLabel.text = "M"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 13 {
                                
                                self.letterLabel.text = "N"
                                println(self.letterLabel.text!)
                                
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                            }
                            
                            if Int(randNum) == 14 {
                                
                                self.letterLabel.text = "O"
                                println(self.letterLabel.text!)
                                
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                            }
                            
                            if Int(randNum) == 15 {
                                
                                self.letterLabel.text = "P"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                            }
                            
                            if Int(randNum) == 16 {
                                
                                self.letterLabel.text = "Q"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 17 {
                                
                                self.letterLabel.text = "R"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 18 {
                                
                                self.letterLabel.text = "S"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 19 {
                                
                                self.letterLabel.text = "T"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            if Int(randNum) == 20 {
                                
                                
                                self.letterLabel.text = "U"
                                
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                            }
                            
                            if Int(randNum) == 21 {
                                
                                self.letterLabel.text = "V"
                                println(self.letterLabel.text!)
                                
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                            }
                            
                            if Int(randNum) == 22 {
                                
                                self.letterLabel.text = "W"
                                println(self.letterLabel.text!)
                                
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                            }
                            
                            if Int(randNum) == 23 {
                                
                                self.letterLabel.text = "X"
                                println(self.letterLabel.text!)
                                
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                            }
                            
                            if Int(randNum) == 24 {
                                
                                self.letterLabel.text = "Y"
                                println(self.letterLabel.text!)
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                                
                            }
                            
                            if Int(randNum) == 25 {
                                
                                self.letterLabel.text = "Z"
                                println(self.letterLabel.text!)
                                
                                
                                NSUserDefaults.standardUserDefaults().setObject("\(self.letterLabel.text!)", forKey: "Round\(self.roundLabel.text!)")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                
                                var letter: String! = (NSUserDefaults.standardUserDefaults().objectForKey("Round\(self.roundLabel.text!)")) as! String
                                println("Stored: \(letter!) for Round \(self.roundLabel.text!)")
                                
                                
                                
                            }

                                                                                //}

                        

                        
                        

                        
                        
                        query.getFirstObjectInBackgroundWithBlock {
                            (myGame: PFObject!, error: NSError!) -> Void in
                            if error != nil {
                                NSLog("%@", error)
                            } else {
                                
                                myGame["letter"] = self.letterLabel.text
                                myGame.saveInBackgroundWithBlock {
                                    (success: Bool, error: NSError!) -> Void in
                                    if (success) {
                                        let alert = UIAlertView()
                                        alert.title = "Letter Generated"
                                        alert.message = "A random letter has been generated! Please tap on My Game View to continue."
                                        alert.addButtonWithTitle("OK")
                                        alert.show()
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
        
        endGameButton.hidden = true
        
        secondsTextField.hidden = true
        roundTextField.hidden = true
        
        letterLabel.hidden = true
        
        gameViewButton.enabled = false
        
        chooseCatButton.hidden = true
        
        pickLetterButton.enabled = true
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo:PFUser.currentUser())
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if !(error != nil) {
                for object in objects {
                    
                    var myGameId = object["gameID"] as? String
                    
                    self.gameIdLabel.text = myGameId
                    
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