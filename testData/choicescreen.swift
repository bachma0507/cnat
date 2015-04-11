//
//  choicescreen.swift
//  testData
//
//  Created by Barry on 4/11/15.
//  Copyright (c) 2015 iOS-Blog. All rights reserved.
//

import Foundation

class ChoiceScreen : UIViewController {
    
    @IBOutlet var leadPlayerButton: UIButton!
    
    @IBOutlet var regualrPlayerButton: UIButton!
    
    @IBAction func leadPlayerButtonPressed(sender: AnyObject) {
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo: PFUser.currentUser())
        
        query.getFirstObjectInBackgroundWithBlock {
            (myGame: PFObject!, error: NSError!) -> Void in
            if error != nil {
                NSLog("%@", error)
            } else {
                 myGame["leadplayer"] = "yes"
                myGame.saveInBackgroundWithBlock {
                    (success: Bool, error: NSError!) -> Void in
                    if (success) {
                        // The object has been saved.
                        self.performSegueWithIdentifier("leadplayer", sender: self)
                    } else if error != nil {
                        let errorString = "\(error)"
                        SCLAlertView().showError("Oops...", subTitle:"There was an error: \(errorString)", closeButtonTitle:"OK")
                        // Show the errorString somewhere and let the user try again.
                    }

                    
                }
                
            }
        }
        
        
    }
    
    @IBAction func regularPlayerButtonPressed(sender: AnyObject) {
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo: PFUser.currentUser())
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            
            if !(error != nil) {
                for object in objects {
                    
                    var myLetter: String? = object["letter"] as? String
                    var myRound: String? = object["round"] as? String
                    
                    if myLetter == "NO LETTER" || myRound == "0" {
                        
                        SCLAlertView().showError("Oops...", subTitle:"Please wait for the lead player to start the game.", closeButtonTitle:"OK")
                        
                    }
                    else{
                        
                        self.performSegueWithIdentifier("player", sender: self)
                    }
                    
                }
                
                
                
            }
            
            
            
        }

        
        
    }
    
    
    @IBAction func endGame(sender: AnyObject) {
        
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
                myGame["letter"] = "NO LETTER"
                myGame["Round"] = "0"
                myGame["seconds"] = "60"
                myGame["leadplayer"] = "no"
                myGame["field1"] = "empty"
                myGame["field2"] = "empty"
                myGame["field3"] = "empty"
                myGame["field4"] = "empty"
                myGame["field5"] = "empty"
                myGame["field6"] = "empty"
                myGame["field7"] = "empty"
                myGame["field8"] = "empty"
                myGame["field9"] = "empty"
                myGame["field10"] = "empty"
                myGame.saveInBackgroundWithBlock {
                    (success: Bool, error: NSError!) -> Void in
                    if (success) {
                        // The object has been saved.
                        self.leadPlayerButton.enabled = true
                        
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
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            
            if !(error != nil) {
                for object in objects {
                    
                    var myLeadPlayer: String? = object["leadplayer"] as? String
                    
                    if myLeadPlayer == "yes" {
                        
                        self.leadPlayerButton.enabled = false
                        
                    }
                    else{
                        
                        self.leadPlayerButton.enabled = true
                    }
                    
                }
                
                
                
            }
            
            
            
        }
        
        
    }
    
    

}