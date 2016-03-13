//
//  InstructionsVC.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Atharva Vaidya on 2016-02-13.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import UIKit

class IntsructionsVC: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false
//        let navigationBarHeight = (self.navigationController?.navigationBar.frame.height)!
//        let image = UIImage(named: "LifenestLogo")
//        let imageSize = CGSizeMake(3 * navigationBarHeight, navigationBarHeight)
//        let marginX = (self.navigationController!.navigationBar.frame.size.width / 2) - (imageSize.width / 2)
//        let imageView = UIImageView(frame: CGRectMake(marginX, 0, imageSize.width, imageSize.height))
//        imageView.opaque = true
//        imageView.contentMode = .ScaleAspectFit
//        imageView.image = image!
//        
//        print(imageView)
//        
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
//        self.navigationController!.navigationBar.translucent = true
//        self.navigationController!.view.backgroundColor = UIColor.clearColor()
//        
//        self.navigationController?.navigationBar.addSubview(imageView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = false
    }
}