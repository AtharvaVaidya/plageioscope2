//
//  SignUpViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 9/20/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import Bolts

class SignUpViewController: UncoveredContentViewController
{
    @IBOutlet weak var lifenestLogo: UIImageView!

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmEmailTextField: UITextField!
    
    @IBOutlet weak var lineView3: UIView!
    @IBOutlet weak var lineView1: UIView!
    
    @IBOutlet weak var lineView2: UIView!
    @IBAction func signUpButton(sender: AnyObject) {
        var newUser = PFUser()
        newUser.username = self.usernameTextField.text
        newUser.password = self.passwordTextField.text
        newUser["userType"] = "Parent"
        if (usernameTextField.text == confirmEmailTextField.text){
        
        if self.usernameTextField.text != nil && self.passwordTextField.text != nil {
        newUser.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                print("errorString")
            } else {
                // Hooray! Let them use the app now.
                self.performSegueWithIdentifier("toDisclaimer", sender: self)
                
            }
        }
      }
    }
        else {
            let alertController = UIAlertController(title: "Emails don't match!", message: "Please enter email again", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "Got it!", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
//        let c = Colors()
//        c.gl.frame = self.view.frame
//        self.view.layer.insertSublayer(c.gl, atIndex: 0)
        
        let lineViews = [lineView1, lineView2, lineView3]
        
        
        
        for lineView in lineViews
        {
            let border = CALayer()
            let width = CGFloat(2.0)
            border.borderColor = textColor.CGColor
            border.frame = CGRect(x: 0, y: lineView.frame.width * 0.15, width: lineView.frame.size.width * 0.7, height: lineView.frame.size.height)
            border.borderWidth = width
            lineView.layer.addSublayer(border)
            
            lineView.layer.cornerRadius = 0.0
            lineView.layer.masksToBounds = true
            lineView.backgroundColor = textColor
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func textFieldEditingDidBegin(sender: UITextField)
    {
        self.activeField = sender
        lifenestLogo.hidden = true
    }
    
    override func textFieldEditingDidEnd(sender: UITextField)
    {
        self.activeField = nil
        lifenestLogo.hidden = false
    }

}
