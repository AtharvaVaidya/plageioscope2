//
//  CustomVC.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Atharva Vaidya on 2016-02-12.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import UIKit

class CustomVC: UIViewController
{
    
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false
//        let image = UIImage(named: "LifenestLogo")
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//        imageView.opaque = true
//        imageView.contentMode = .ScaleAspectFit
//        imageView.image = image!
//        
//        print(imageView)
//        
//        self.navigationItem.titleView = imageView
        
        let buttons = [b1, b2, b3, b4]
        
        for b in buttons
        {
            b.imageView?.contentMode = .ScaleAspectFit
        }
        self.navigationItem.backBarButtonItem?.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = false
        
        let c = Colors()
        c.gl.frame = self.view.frame
        self.view.layer.insertSublayer(c.gl, atIndex: 0)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let vc = segue.destinationViewController as! LifenestViewController
        switch segue.identifier!
        {
        case "b1" :
            vc.order = [3, 1, 2, 0]
            break
        case "b2" :
            vc.order = [1, 2, 3, 0]
            break
        case "flathead" :
            vc.order = [0, 1, 2, 3]
            break
        case "safe" :
            vc.order = [2, 3, 0, 1]
            break
        default :
            break
        }
    }
    
    @IBAction func Buy(sender: AnyObject) {
        if let url = NSURL(string: "http://www.ubimed.com/lifenest-help-prevent-flat-head.html") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    
}