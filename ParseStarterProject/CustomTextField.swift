//
//  CustomTextField.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Atharva Vaidya on 2016-02-09.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import QuartzCore
import TextFieldEffects

class CustomTextField: UITextField
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor(red: CGFloat(72 / 255.0), green: CGFloat(122 / 255.0), blue: CGFloat(135 / 255.0), alpha: 1).CGColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        
        self.layer.cornerRadius = 0.0
        self.layer.masksToBounds = true
        
        var frame = self.frame
        frame.size.height = 100
        self.frame = frame
        self.layer.borderWidth = 0.0
        self.backgroundColor = UIColor.clearColor()
        self.layer.backgroundColor = UIColor.clearColor().CGColor
    }
}