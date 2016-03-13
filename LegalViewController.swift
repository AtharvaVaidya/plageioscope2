//
//  LegalViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Atharva Vaidya on 2016-02-10.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import SnapKit

class LegalViewController: UIViewController
{
    
    @IBOutlet weak var disclaimerButton: UIButton!
    @IBOutlet weak var tcButton: UIButton!
    @IBOutlet weak var legalLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print(self.view.center.x)
        
        self.navigationController?.navigationBarHidden = false
        
        let c = Colors()
        c.gl.frame = self.view.frame
        self.view.layer.insertSublayer(c.gl, atIndex: 0)
        
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor(red: CGFloat(72 / 255.0), green: CGFloat(122 / 255.0), blue: CGFloat(135 / 255.0), alpha: 1).CGColor
        border.frame = CGRect(x: 0, y: lineView.frame.width * 0.15, width: lineView.frame.size.width * 0.7, height: lineView.frame.size.height)
        border.borderWidth = width
        lineView.layer.addSublayer(border)
        
        lineView.layer.cornerRadius = 0.0
        lineView.layer.masksToBounds = true
        lineView.backgroundColor = UIColor.orangeColor()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //layoutConstraints()
        
       
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        lineView.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(tcButton)
            make.centerY.equalTo(tcButton).offset(31)
            make.height.equalTo(2)
            make.width.equalTo(tcButton).dividedBy(1/0.75)
        }
    }
    
    func layoutConstraints()
    {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        legalLabel.snp_makeConstraints { (make) -> Void in
            
            make.top.equalTo(snp_topLayoutGuideBottom)
            make.height.equalTo(45)
            make.width.equalTo(self.view).dividedBy(2)
            make.centerX.equalTo(self.view)
        }
        
        tcButton.snp_makeConstraints { (make) -> Void in
         
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).dividedBy(2)
            make.height.equalTo(60)
            make.centerY.equalTo(self.view).offset(-31)
        }
        
        lineView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self.view)
            make.height.equalTo(2)
            make.width.equalTo(tcButton).dividedBy(2)
        }
        
        disclaimerButton.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view).offset(31)
            make.height.equalTo(tcButton)
            make.width.equalTo(tcButton)
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = false
    }
    
    
}
