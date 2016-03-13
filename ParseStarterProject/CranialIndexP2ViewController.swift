//
//  CranialIndexP2ViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 2/8/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class CranialIndexP2ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage = UIImage()
    var verticalDimensions: Double = 0
    var cranialIndex: Double = 0
    @IBOutlet weak var horizontal: UIView!
    var horizontalWidth: Double = 0
    
    @IBAction func `continue`(sender: UIButton) {
        performSegueWithIdentifier("segueToCVAI", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var CVAIScene = segue.destinationViewController as! CVAIViewController
        // Pass the selected object to the new view controller.
        if self.imageView.image != nil {
            CVAIScene.image = imageView.image! as UIImage
        }
        self.getDimensions()
        
        self.calculateCranialIndex()
        CVAIScene.cranialIndexLocal = self.cranialIndex
        //        print("outgoing CI from CI to CVAI \(self.cranialIndex)")
    }
    let panRec = UIPanGestureRecognizer()
    let pinchRec = UIPinchGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        let imageview = UIImageView(frame: CGRectMake(0, 0, horizontal.frame.width * 0.5, horizontal.frame.height * 0.5))
        imageview.image = UIImage(named: "Guideline 1b")
        imageview.contentMode = .ScaleAspectFit
        horizontal.addSubview(imageview)
        
        let imagePicker = UIImagePickerController()
        
        let h = imagePicker.view.frame.height
        
        imageview.frame.size.height = h
        
        imageview.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(horizontal)
        
        }
        
        self.view.bringSubviewToFront(horizontal)
        
        self.imageView.image = self.image
        panRec.addTarget(self, action: "draggedView:")
        
        horizontal.addGestureRecognizer(panRec)
        horizontal.userInteractionEnabled = true
        
        pinchRec.addTarget(self, action: "pinchedView:")
        
        horizontal.addGestureRecognizer(pinchRec)
        horizontal.multipleTouchEnabled = true
        // Do any additional setup after loading the view.
    }
    
    func pinchedView(sender:UIPinchGestureRecognizer){
        self.view.bringSubviewToFront(horizontal)
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale = 1.0
    }
    
    func getDimensions() {
        
        self.horizontalWidth = Double(self.horizontal.frame.width)
        //        print(verticalLength)
        //        print(horizonatalWidth)
    }
    
    func draggedView(sender:UIPanGestureRecognizer){
        //self.view.bringSubviewToFront(sender.view!)
        var translation = sender.translationInView(self.view)
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    func calculateCranialIndex() {
        self.getDimensions()
        self.cranialIndex = Double((self.horizontalWidth / self.verticalDimensions)*100)
        //print(self.cranialIndex)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
