//
//  LoginViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 10/10/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import QuartzCore

class LoginViewController: UIViewController, UITextFieldDelegate {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var lineView2: UIView!
    
    @IBOutlet weak var lineView1: UIView!
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        username.delegate = self
        password.delegate = self
        
        let lineViews = [lineView1, lineView2]
        
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
    
    @IBAction func login(sender: AnyObject) {
        if username.text != nil && password.text != nil {
            PFUser.logInWithUsernameInBackground(username.text!, password: password.text!) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    // Do stuff after successful login.
                    self.performSegueWithIdentifier("toDisclaimer", sender: self)
                } else {
                    // The login failed. Check error to see why.
                    print("login failed")
                }
            }
        }
    }

    @IBAction func signupInstead(sender: AnyObject) {
        self.performSegueWithIdentifier("toSignUpSegue", sender: self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        let c = Colors()
//        c.gl.frame = self.view.frame
//        self.view.layer.insertSublayer(c.gl, atIndex: 0)
    }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textField.backgroundColor = UIColor.clearColor()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
