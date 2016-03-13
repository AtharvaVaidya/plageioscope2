//
//  CVAIPart2ViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 11/6/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Darwin

class CVAIPart2ViewController: UIViewController {
    
    var cranialIndexLocal:Double = 0;
    var leftDiagonalLengthLocal: Double = 0;
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func `continue`(sender: UIButton) {
        self.calculateCVAI()
        print("CVAI \(self.CVAI)")
        print("right Diagonal length \(self.rightDiagonalLength)")
        print("left Diagonal length \(self.leftDiagonalLengthLocal)")
        performSegueWithIdentifier("segueToDisclaimer", sender: self)
    }
    
    
    var image: UIImage = UIImage()

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        self.calculateCVAI()
        var disclaimerScene = segue.destinationViewController as! DisclaimerViewController
        // Pass the selected object to the new view controller.
        if self.imageView.image != nil {
            disclaimerScene.image = imageView.image! as UIImage
        }
        disclaimerScene.CVAI = self.CVAI
        disclaimerScene.CranialIndex = self.cranialIndexLocal
//        print("outgoing left diagonal length to CVAI2 \(self.leftDiagonalLength)")
        
        
    }
    @IBOutlet weak var rightDiagonal: UIView!

    let panRec2 = UIPanGestureRecognizer()
    
    let pinchRec2 = UIPinchGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        let imageview = UIImageView(frame: CGRectMake(0, 0, rightDiagonal.frame.width * 0.8, rightDiagonal.frame.height * 0.8))
        imageview.image = UIImage(named: "Guideline 2b")
        imageview.contentMode = .ScaleAspectFit
        rightDiagonal.addSubview(imageview)
        
        imageview.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(rightDiagonal)
        }
        self.view.bringSubviewToFront(rightDiagonal)
        self.imageView.image = self.image
        // Do any additional setup after loading the view.

        panRec2.addTarget(self, action: "draggedView:")
        rightDiagonal.addGestureRecognizer(panRec2)
        rightDiagonal.userInteractionEnabled = true
        
        pinchRec2.addTarget(self, action: "pinchedView2:")
        rightDiagonal.addGestureRecognizer(pinchRec2)
        rightDiagonal.multipleTouchEnabled = true
        
        print("incoming CI from CVAI \(self.cranialIndexLocal)")
        print("incoming left Diagonal from CVAI \(self.leftDiagonalLengthLocal)")

        
    }

    func pinchedView2(sender:UIPinchGestureRecognizer){
        self.view.bringSubviewToFront(rightDiagonal)
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale = 1.0
    }

    var square: Double = 0;
    var rightDiagonalLength: Double = 0;
    
    func getDimensions() {
        //print(Double(self.rightDiagonal.frame.height))
        //print(Double(self.rightDiagonal.frame.width))
        square = (((Double(self.rightDiagonal.frame.height))*(Double(self.rightDiagonal.frame.height))) + ((Double(self.rightDiagonal.frame.width))*(Double(self.rightDiagonal.frame.width))))
        rightDiagonalLength = sqrt(square)
    }
    
    func draggedView(sender:UIPanGestureRecognizer){
        var translation = sender.translationInView(self.view)
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var CVAI: Double = 0
    func calculateCVAI() {
        self.getDimensions()
        var diagonalLengthDifference: Double = self.leftDiagonalLengthLocal - self.rightDiagonalLength
        if diagonalLengthDifference < 0 {
            diagonalLengthDifference = diagonalLengthDifference*(-1)
        }
        if leftDiagonalLengthLocal > rightDiagonalLength {
            CVAI = ((diagonalLengthDifference*100)/leftDiagonalLengthLocal)
        }
        if rightDiagonalLength > leftDiagonalLengthLocal {
            CVAI = ((diagonalLengthDifference*100)/rightDiagonalLength)
        }
    }

}