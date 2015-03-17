//
//  fieldnames.swift
//  testData
//
//  Created by Barry on 2/5/15.
//  Copyright (c) 2015 iOS-Blog. All rights reserved.
//

import Foundation

class fieldnames : UIViewController, UITextFieldDelegate   {
    
    var textField: UITextField!
    
    @IBOutlet var cat1TextField: UITextField!
    @IBOutlet var cat2TextField: UITextField!
    @IBOutlet var cat3TextField: UITextField!
    @IBOutlet var cat4TextField: UITextField!
    @IBOutlet var cat5TextField: UITextField!
    @IBOutlet var cat6TextField: UITextField!
    @IBOutlet var cat7TextField: UITextField!
    @IBOutlet var cat8TextField: UITextField!
    @IBOutlet var cat9TextField: UITextField!
    @IBOutlet var cat10TextField: UITextField!
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        
        
        //var myGame = PFObject(className: "game")
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo: PFUser.currentUser())
        
        query.getFirstObjectInBackgroundWithBlock {
            (myGame: PFObject!, error: NSError!) -> Void in
            if error != nil {
                NSLog("%@", error)
            } else {
                //myGame["letter"] = self.letterLabel.text
                myGame["field1"] = self.cat1TextField.text
                myGame["field2"] = self.cat2TextField.text
                myGame["field3"] = self.cat3TextField.text
                myGame["field4"] = self.cat4TextField.text
                myGame["field5"] = self.cat5TextField.text
                myGame["field6"] = self.cat6TextField.text
                myGame["field7"] = self.cat7TextField.text
                myGame["field8"] = self.cat8TextField.text
                myGame["field9"] = self.cat9TextField.text
                myGame["field10"] = self.cat10TextField.text
                
                
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
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        
        var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //self.textField.delegate = self
        
        var myGame = PFObject(className:"game")
        
        var query = PFQuery(className: "game")
        query.whereKey("player", equalTo: PFUser.currentUser())
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            
            if error != nil {
                NSLog("%@", error)
            }
            else {
                for object in objects {
                    
//                    var myLetter = object["letter"]! as String
//                    println(myLetter)
                    
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
                    
                    //self.letterLabel.text = myLetter
                    self.cat1TextField.text = myField1
                    self.cat2TextField.text = myField2
                    self.cat3TextField.text = myField3
                    self.cat4TextField.text = myField4
                    self.cat5TextField.text = myField5
                    self.cat6TextField.text = myField6
                    self.cat7TextField.text = myField7
                    self.cat8TextField.text = myField8
                    self.cat9TextField.text = myField9
                    self.cat10TextField.text = myField10
                }
            }
        }
        
//        myGame["letter"] = "NO LETTER"
//        myGame["field1"] = "empty"
//        myGame["field2"] = "empty"
//        myGame["field3"] = "empty"
//        myGame["field4"] = "empty"
//        myGame["field5"] = "empty"
//        myGame["field6"] = "empty"
//        myGame["field7"] = "empty"
//        myGame["field8"] = "empty"
//        myGame["field9"] = "empty"
//        myGame["field10"] = "empty"
//        
//        myGame["player"] = PFUser.currentUser()
        
//        myGame.saveInBackgroundWithBlock {
//            (success: Bool, error: NSError!) -> Void in
//            if (success) {
//                // The object has been saved.
//            } else {
//                // There was a problem, check error.description
//            }
//        }

        
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
    
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 100
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 100
    }
    
}