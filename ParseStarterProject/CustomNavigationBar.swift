//
//  CustomNavigationBar.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Atharva Vaidya on 2016-02-12.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class CustomNavbar: UINavigationBar
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.barTintColor = backgroundColor
    }
}
