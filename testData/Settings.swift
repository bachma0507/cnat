//
//  Settings.swift
//  testData
//
//  Created by Barry on 3/27/15.
//  Copyright (c) 2015 iOS-Blog. All rights reserved.
//

import Foundation

class Settings : UIViewController {
    
    
   
    
    @IBOutlet var secTextField: UITextField!
    @IBAction func saveCounter(sender: AnyObject) {
        
        saveSeconds()
        
    }
    
    func saveSeconds(){
        
        if secTextField.text == ""{
            
            SCLAlertView().showError("Oops...", subTitle:"Please enter seconds.", closeButtonTitle:"OK")
        }
            
        else{
            
            var query = PFQuery(className: "game")
            query.whereKey("player", equalTo: PFUser.currentUser())
            
            query.getFirstObjectInBackgroundWithBlock {
                (myGame: PFObject!, error: NSError!) -> Void in
                if error != nil {
                    NSLog("%@", error)
                } else {
                    myGame["seconds"] = self.secTextField.text
                    myGame.saveInBackgroundWithBlock {
                        (success: Bool, error: NSError!) -> Void in
                        if (success) {
                            let alert = UIAlertView()
                            alert.title = "Counter Saved"
                            alert.message = "Counter setting saved!"
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

                    
                    self.secTextField.text = "\(mySecondsInt!)"
                }
            }
        }
        
        
}
    
    
}

