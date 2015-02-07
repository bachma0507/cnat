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
    
//    @IBAction func saveButtonPressed(sender: AnyObject) {
//        
//        var randomNumber = arc4random_uniform(3)
//        println("Random number is: \(randomNumber)")
//        
//        
//        if Int(randomNumber) == 0 {
//            
//            
//            letterLabel.text = "A"
//            
//            println(letterLabel.text)
//            
//        }
//        
//        if Int(randomNumber) == 1 {
//            
//            letterLabel.text = "B"
//            println(letterLabel.text)
//            
//        }
//        
//        if Int(randomNumber) == 2 {
//            
//            letterLabel.text = "C"
//            println(letterLabel.text)
//            
//        }
//
//        
//        
//        var myGame = PFObject(className:"game")
//                myGame["letter"] = letterLabel.text
//                myGame["field1"] = letterTextField.text
//                myGame["player"] = PFUser.currentUser()
//
//                myGame.saveInBackgroundWithBlock {
//                    (success: Bool, error: NSError!) -> Void in
//                    if (success) {
//                        // The object has been saved.
//                    } else {
//                        // There was a problem, check error.description
//                    }
//                }
//
//        
//    }
    
    @IBAction func retrieveButtonPressed(sender: AnyObject) {
        
        updateObject()
        
    }
    
    func updateObject(){
        
        var randomNumber = arc4random_uniform(3)
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
    
    var myGame = PFObject(className: "game")
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
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}