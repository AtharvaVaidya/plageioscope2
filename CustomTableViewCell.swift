//
//  CustomTableViewCell.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Atharva Vaidya on 2016-02-10.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell
{
    init()
    {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        self.textLabel?.textAlignment = .Center
        self.backgroundColor = backgroundColor
        self.textLabel?.backgroundColor = backgroundColor
    }
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}