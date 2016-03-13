//
//  CVAIViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 11/6/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Darwin
import SnapKit

class CVAIViewController: UIViewController {

    var cranialIndexLocal:Double = 0;
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func `continue`(sender: UIButton) {
        performSegueWithIdentifier("segueToCVAI2", sender: self)
    }

    var image: UIImage = UIImage()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var CVAI2Scene = segue.destinationViewController as! CVAIPart2ViewController
        // Pass the selected object to the new view controller.
        if self.imageView.image != nil {
            CVAI2Scene.image = imageView.image! as UIImage
        }
        self.getDimensions()
        CVAI2Scene.cranialIndexLocal = self.cranialIndexLocal
        print("outgoing left diagonal length to CVAI2 \(self.leftDiagonalLength)")
        CVAI2Scene.leftDiagonalLengthLocal = self.leftDiagonalLength
    }
    
    @IBOutlet weak var leftDiagonal: UIView!
    
    let panRec = UIPanGestureRecognizer()

    
    let pinchRec = UIPinchGestureRecognizer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        let imageview = UIImageView(frame: CGRectMake(0, 0, leftDiagonal.frame.width * 0.8, leftDiagonal.frame.height * 0.8))
        imageview.image = UIImage(named: "GUIDELINE 2A")
        imageview.contentMode = .ScaleAspectFit

        leftDiagonal.addSubview(imageview)
        
        imageview.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(leftDiagonal)
            //make.edges.equalTo(leftDiagonal).inset(UIEdgeInsetsMake(0, 00, 00, 0))
        }
        
        
        self.view.bringSubviewToFront(leftDiagonal)
        self.imageView.image = self.image
        // Do any additional setup after loading the view.
        
        panRec.addTarget(self, action: "draggedView:")
        leftDiagonal.addGestureRecognizer(panRec)
        leftDiagonal.userInteractionEnabled = true

        pinchRec.addTarget(self, action: "pinchedView:")
        leftDiagonal.addGestureRecognizer(pinchRec)
        leftDiagonal.multipleTouchEnabled = true
        
        print("incoming CI to CVAI \(self.cranialIndexLocal)")
    }
    
    func pinchedView(sender:UIPinchGestureRecognizer){
        self.view.bringSubviewToFront(leftDiagonal)
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale = 1.0
    }

    var leftDiagonalLength: Double = 0;
    var square: Double = 0;
    
    func getDimensions() {
        square = (((Double(self.leftDiagonal.frame.height))*(Double(self.leftDiagonal.frame.height))) + ((Double(self.leftDiagonal.frame.width))*(Double(self.leftDiagonal.frame.width))))
        leftDiagonalLength = sqrt(square)
        print("left diagonal length from get dimensions function \(self.leftDiagonalLength)")
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
    

    
}

