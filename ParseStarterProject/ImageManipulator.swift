//
//  ImageManipulator.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 10/11/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit



class ImageManipulator: NSObject {


    func halfImageSizeBitmap(image:UIImage) -> UIImage {
        
        let size = CGSizeApplyAffineTransform(image.size, CGAffineTransformMakeScale(0.30, 0.30))
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(size, hasAlpha, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage;
    }
    

}
