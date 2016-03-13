//
//  CranialIndexViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 10/12/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class CranialIndexViewController: UIViewController {
    
    
    
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func `continue`(sender: UIButton) {
        performSegueWithIdentifier("segueToCIPart2", sender: self)
        //        self.calculateCranialIndex()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var CIP2Scene = segue.destinationViewController as! CranialIndexP2ViewController
        // Pass the selected object to the new view controller.
        if self.imageView.image != nil {
            CIP2Scene.image = imageView.image! as UIImage
        }
        self.getDimensions()
        CIP2Scene.verticalDimensions = self.verticalLength
        //        self.calculateCranialIndex()
        //        CIP2Scene.cranialIndexLocal = self.cranialIndex
        //        print("outgoing CI from CI to CVAI \(self.cranialIndex)")
    }
    
    var image: UIImage = UIImage()
    
    
    let panRec = UIPanGestureRecognizer()
    //    let panRec2 = UIPanGestureRecognizer()
    
    let pinchRec = UIPinchGestureRecognizer()
    //    let pinchRec2 = UIPinchGestureRecognizer()
    //    @IBOutlet weak var horizontal: UIView!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var vertical: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        print(imageView.frame.height)
        
        let imgview = UIImageView(frame: CGRectMake(0, 0, vertical.frame.width, vertical.frame.height))
        
        imgview.image = UIImage(named: "Guideline 1a")
        
        imgview.contentMode = .ScaleAspectFit
        

        vertical.addSubview(imgview)
        
        imgview.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(vertical)
            make.height.lessThanOrEqualTo(vertical)
            make.width.lessThanOrEqualTo(vertical)
        }
        
        self.view.bringSubviewToFront(vertical)
        self.imageView.image = self.image
        // Do any additional setup after loading the view.
        
        panRec.addTarget(self, action: "draggedView:")
        //        panRec2.addTarget(self, action: "draggedView:")
        
        
        vertical.addGestureRecognizer(panRec)
        vertical.userInteractionEnabled = true
        
        
        
        //        horizontal.addGestureRecognizer(panRec2)
        //        horizontal.userInteractionEnabled = true
        
        pinchRec.addTarget(self, action: "pinchedView:")
        vertical.addGestureRecognizer(pinchRec)
        vertical.multipleTouchEnabled = true
        
        //        pinchRec2.addTarget(self, action: "pinchedView2:")
        //        horizontal.addGestureRecognizer(pinchRec2)
        //        horizontal.multipleTouchEnabled = true
        
//        imageView.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(snp_topLayoutGuideBottom)
//            make.bottom.equalTo(continueButton.snp_top)
//        }
        
//        continueButton.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(67)
//        }
        
        print("Height: \(continueButton.frame.height)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //layoutConstraints()
    }
    
    func layoutConstraints()
    {
        
        let superview = self.view
        
        continueButton.snp_makeConstraints { (make) -> Void in
            
            make.height.equalTo(67)
            make.bottom.equalTo(snp_bottomLayoutGuideTop)
            make.width.equalTo(superview.snp_width)
            
        }
        
        imageView.snp_makeConstraints { (make) -> Void in
            
            make.top.equalTo(snp_topLayoutGuideTop)
            make.bottom.equalTo(continueButton.snp_top).offset(10)
            make.width.equalTo(superview.snp_width)
        }
        
        vertical.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(imageView.snp_center)
            make.edges.equalTo(imageView).inset(UIEdgeInsetsMake(20, 0, 20, 0))
        }
    }
    
    func pinchedView(sender:UIPinchGestureRecognizer){
        self.view.bringSubviewToFront(vertical)
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale = 1.0
    }
    //    func pinchedView2(sender:UIPinchGestureRecognizer){
    //        self.view.bringSubviewToFront(horizontal)
    //        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
    //        sender.scale = 1.0
    //    }
    
    var verticalLength: Double = 0;
    //    var horizonatalWidth: Double = 0;
    
    func getDimensions() {
        verticalLength = Double(self.vertical.frame.height)
        //        horizonatalWidth = Double(self.horizontal.frame.width)
        //        print(verticalLength)
        //        print(horizonatalWidth)
    }
    
    
    func draggedView(sender:UIPanGestureRecognizer){
        //self.view.bringSubviewToFront(sender.view!)
        var translation = sender.translationInView(self.view)
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    
    //    var cranialIndex: Double = 0
    //    func calculateCranialIndex() {
    //        self.getDimensions()
    //        self.cranialIndex = Double((self.horizonatalWidth / self.verticalLength)*100)
    //        //print(self.cranialIndex)
    //    }
    
    
}
