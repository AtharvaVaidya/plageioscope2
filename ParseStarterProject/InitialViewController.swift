//
//  InitialViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 11/1/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse



class InitialViewController: UIViewController {

    @IBAction func logout(sender: AnyObject) {
        
        PFUser.logOut()
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let presentStart: LoginViewController =  LoginViewController()
        
        let Login = storyboard!.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        self.presentViewController(Login, animated: true, completion: nil)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let c = Colors()
        c.gl.frame = self.view.frame
        self.view.layer.insertSublayer(c.gl, atIndex: 0)
        self.navigationController?.navigationBarHidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        
        let navigationBarHeight = (self.navigationController?.navigationBar.frame.height)!
        let image = UIImage(named: "LifenestLogo")
        let imageSize = CGSizeMake(3 * navigationBarHeight, navigationBarHeight)
        let marginX = (self.navigationController!.navigationBar.frame.size.width / 2) - (imageSize.width / 2)
        let imageView = UIImageView(frame: CGRectMake(marginX, 0, imageSize.width, imageSize.height))
        imageView.opaque = true
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image!
        
        print(imageView)
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        self.navigationController!.view.backgroundColor = UIColor.clearColor()
        
        self.navigationController?.navigationBar.addSubview(imageView)
        
        self.navigationItem.backBarButtonItem?.title = ""
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
    }
}
