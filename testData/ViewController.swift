//
//  ViewController.swift
//  testData
//
//  Created by  -  on 22/11/2014.
//  Copyright (c) 2014 iOS-Blog. All rights reserved.
//

import UIKit

//let kErrorTitle = "Connection error"

class ViewController: UIViewController, UITextFieldDelegate {
                            
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        
        if self.usernameTextField.text == "" || self.passwordTextField.text == "" {
            
            SCLAlertView().showError("Oops...", subTitle:"Please enter Game Name and password", closeButtonTitle:"OK")
            
        }

        else {
        PFUser.logInWithUsernameInBackground(usernameTextField.text, password:passwordTextField.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                // Do stuff after successful login.
                
                 self.performSegueWithIdentifier("success", sender: self)
                
            } else if error != nil {
                let errorString = "\(error)"
                SCLAlertView().showError("Oops...", subTitle:"Invalid login. Please try again, or register this Game Name.", closeButtonTitle:"OK")
                // Show the errorString somewhere and let the user try again.
            }
            }
        }
    }
    
    
    @IBAction func signUpButtonPressed(sender: AnyObject) {
        
        var user = PFUser()
                user.username = usernameTextField.text
                user.password = passwordTextField.text
        
        
            if self.usernameTextField.text == "" || self.passwordTextField.text == "" {
                
                SCLAlertView().showError("Oops...", subTitle:"Please enter a Game Name and password.", closeButtonTitle:"OK")
            
        }
        //        //user.email = "email@example.com"
        //        // other fields can be set just like with PFObject
        //        user["letter"] = "U"
        //
        
        else{
                
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
                
        user.signUpInBackgroundWithBlock {
                    (succeeded: Bool!, error: NSError!) -> Void in
                    if error == nil {
                        // Hooray! Let them use the app now.
                        
                        var myGame = PFObject(className:"game")
                        myGame["player"] = PFUser.currentUser()
                        
                        myGame["letter"] = "NO LETTER"
                        myGame["Round"] = "0"
                        myGame["seconds"] = "60"
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
                            } else {
                                // There was a problem, check error.description
                            }
                        }

                        
                        
                        
                        
                        
                        self.performSegueWithIdentifier("success", sender: self)
                        
                    } else if error != nil {
                        let errorString = "\(error)"
                        SCLAlertView().showError("Oops...", subTitle:"Game Name already taken. Please try again.", closeButtonTitle:"OK")
                        // Show the errorString somewhere and let the user try again.
                    }
                }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        self.usernameTextField.delegate = self;
        self.passwordTextField.delegate = self;
        
        
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

