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
            
            var usernameKey = Keychain.set("username", value: self.usernameTextField.text)
            var passwordKey = Keychain.set("password", value: self.passwordTextField.text)
            
            //var usernameKey = Keychain.set("username", value: self.usernameTextField.text)
            //var passwordKey = Keychain.set("password", value: self.passwordTextField.text)
            
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
                var usernameKey = Keychain.set("username", value: self.usernameTextField.text)
                var passwordKey = Keychain.set("password", value: self.passwordTextField.text)
                
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
                    (succeeded: Bool, error: NSError!) -> Void in
                    if error == nil {
                        // Hooray! Let them use the app now.
                        
                        var myGame = PFObject(className:"game")
                        myGame["player"] = PFUser.currentUser()
                        
                        myGame["letter"] = "NO LETTER"
                        myGame["Round"] = "0"
                        myGame["seconds"] = "60"
                        myGame["leadplayer"] = "no"
                        myGame["field1"] = "boy name"
                        myGame["field2"] = "girl name"
                        myGame["field3"] = "animal"
                        myGame["field4"] = "city"
                        myGame["field5"] = "country"
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
        
        //The below uncommented line is an optional indicating that username may be nil or have a value by using ? after the type. The commented line below is the same as the uncommented line following that. The uncommented line is trying to cast the optional value which is of type NSString to a String by using as? if it does not succeed it returns a nil that's why the resulting type is always an optional value. So we use as? if the cast could fail in any possible way. IF you know the cast is going to succeed, then use as instead of as?
        //Since we are using an optional, no need to have an if statement. If username does not have a value it will be nil.
        /*var username: Optional<String> = Keychain.get("username") as? String*/
        var username: String? = Keychain.get("username") as? String
        //Above line can also be written as
        /*var username = Keychain.get("username") as? String*/
        self.usernameTextField.text = username
        
        var password: String? = Keychain.get("password") as? String
        self.passwordTextField.text = password
        
        //If I was absolutely sure username will always have a value, I can use the statement below to unwrap the optional using !. But if username has no value, the app will crash with fatal error: unexpectedly found nil while unwrapping an Optional value.
        /*var username: String! = Keychain.get("username") as! String
        self.usernameTextField.text = username*/
        
        //The if var statement below is used to check to see if an optional holds a value and if it does what to do with it. This can replace the uncommenetd lines above.
        /*if var username = Keychain.get("username") as? String {
            self.usernameTextField.text = username
        }*/
        
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
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

