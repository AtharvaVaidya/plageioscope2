//
//  CustomerInformationViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 11/11/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import MessageUI
import Parse

class CustomerInformationViewController: UIViewController, MFMailComposeViewControllerDelegate {

    var image: UIImage = UIImage()
    var CranialIndex: Double = 0;
    var CVAI: Double = 0;
    var symptom: String = String()
    
    
    @IBOutlet weak var parentName: UITextField!
    
    
    @IBOutlet weak var parentEmail: UITextField!
    
    
    @IBAction func startOver(sender: AnyObject) {
        self.performSegueWithIdentifier("startOver", sender: self)
    }
    
    @IBOutlet weak var babyName: UITextField!
    
    
    @IBOutlet weak var babyBirthday: UITextField!
    
    
    @IBOutlet weak var multiple: UITextField!
    
    
    @IBOutlet weak var preemie: UITextField!
    
    var todaysDate:NSDate = NSDate()
    var dateFormatter:NSDateFormatter = NSDateFormatter()
    

    @IBAction func sendResult(sender: AnyObject) {
        
        if (parentName.text == nil || parentEmail.text == nil || babyName.text == nil || babyBirthday.text == nil || multiple.text == nil || preemie.text == nil)
        {
            let alertController = UIAlertController(title: "Empty Fields!", message: "Please complete all fields", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "Got it!", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            var image = PFObject(className: "image")
            image["pointerToUser"] = PFUser.currentUser()!
            
                let imageData = UIImageJPEGRepresentation(self.image, 0.1)
                let imageFile = PFFile(data: imageData!)
            
            image["imageFile"] = imageFile
            image["Email"] = self.parentEmail.text!
            image["Name"] = self.parentName.text!
            image["BabyAgeInWeeks"] = self.babyBirthday.text!
            image["Multiple"] = self.multiple.text!
            image["Preemie"] = self.preemie.text!
            image["DateOfTest"] = String(self.todaysDate)
            image["CranialIndex"] = String(self.CranialIndex)
            image["CVAI"] = String(self.CVAI)
            image["Symptom"] = String(self.symptom)
            image.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                if (success)
                {
                    print("save successful")
                    self.sendEmail()
                }
                else
                {
                    print(error?.description)
                }
            })
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients([self.parentEmail.text!])
        mailComposerVC.setSubject("Plagioscope Test Result")
        mailComposerVC.setMessageBody("Hi!\n\nHere is the result from Ubimed's Plagioscope App.\n\n\(symptom).", isHTML: false)
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailAlert = UIAlertView(title: "Could Not Send The Email!", message: "Please ensure that you have email configured on your device and try again!", delegate: self, cancelButtonTitle: "Ok, Got it!" )
        sendMailAlert.show()
    }
    
    func sendEmail()
    {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail(){
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        }
        else{
            self.showSendMailErrorAlert()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        print("LAST CVAI \(CVAI)")
        print("LAST \(CranialIndex)")
        print("LAST \(symptom)")
        // Do any additional setup after loading the view.
    }

    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue :
            print("mail cancelled")
        case MFMailComposeResultSent.rawValue:
            print("Mail Sent")
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
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
