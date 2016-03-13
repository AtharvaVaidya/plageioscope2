//
//  TakePictureViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 10/11/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import SnapKit

class TakePictureViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var takeAgainButton: UIButton!
    @IBAction func `continue`(sender: AnyObject) {
        
        let vc = UIViewController()
        let imageView = UIImageView(frame: vc.view.frame)
        imageView.image = UIImage(named: "Instruction2")
        vc.view.addSubview(imageView)
        
        let tgs = UITapGestureRecognizer(target: self, action: "tapPressed")
        vc.view.addGestureRecognizer(tgs)
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    


    func tapPressed()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        if self.imageView.image != nil {
            self.performSegueWithIdentifier("continueSegue", sender: self)
        }
        else {
            let alertController = UIAlertController(title: "Picture Not Taken!", message: "Please take a picture of your baby's head before continuing", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "Got it!", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }

    let imageManipulator = ImageManipulator();

    var imagePicker = UIImagePickerController()
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    func test(){
        imagePicker.takePicture();
    }
    
    @IBAction func takePicture(sender: UIButton) {
        
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        imagePicker.allowsEditing = false;
        
        
        imagePicker.showsCameraControls = false;
        let gesture = UITapGestureRecognizer(target: self, action: "test")
        imagePicker.view.addGestureRecognizer(gesture);
        let overlayImage = UIImage(named: "NewOval");
        let resizedImage = imageManipulator.halfImageSizeBitmap(overlayImage!);
        imagePicker.cameraOverlayView = UIImageView(image: resizedImage);
        imagePicker.cameraOverlayView?.frame = CGRectMake(0, 0, resizedImage.size.width * 0.9, resizedImage.size.height * 0.9);
        let bounds = UIScreen.mainScreen().bounds;
        self.presentViewController(imagePicker, animated: true) { () -> Void in
            //TODO: Make imagePicker camera view display on whole screen
            self.imagePicker.view.frame = CGRectMake(0, 80, self.imagePicker.view.frame.width, self.imagePicker.view.frame.height);
            
            let cameraoverlayview = self.imagePicker.cameraOverlayView
            let cameraview = self.imagePicker.view
            
            cameraoverlayview?.snp_makeConstraints { (make) -> Void in
                
                make.centerX.equalTo(cameraview.snp_centerX)
                make.centerY.equalTo(cameraview.snp_centerY).offset(-80)
                make.edges.equalTo(cameraoverlayview!).dividedBy(0.8)
            }
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        let c = Colors()
        c.gl.frame = self.view.frame
        self.view.layer.insertSublayer(c.gl, atIndex: 0)
        

        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        
        
        takePicture(takeAgainButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var cranialIndexScene = segue.destinationViewController as! CranialIndexViewController
        // Pass the selected object to the new view controller.
        if self.imageView.image != nil {
        cranialIndexScene.image = imageView.image! as UIImage
        }

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = false
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
