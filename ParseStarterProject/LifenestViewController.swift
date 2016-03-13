//
//  LifenestViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Atharva Vaidya on 2016-02-11.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit



class LifenestViewController: UIViewController
{
    
    @IBOutlet weak var imgView4: UIButton!
    @IBOutlet weak var imgView3: UIButton!
    @IBOutlet weak var imgView2: UIButton!
    @IBOutlet weak var imgView1: UIButton!
    
    @IBOutlet weak var txtLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    
    @IBOutlet weak var buyNowButton: UIButton!
    
    @IBOutlet weak var centralImgView: UIImageView!
    
    var order: [Int] = []
    
    
    var imgs = [UIImage(named: "Flathead"), UIImage(named: "Breathability2"), UIImage(named: "Safe"), UIImage(named: "Breathability")]
    var centralImgs = [UIImage(named: "Img1"), UIImage(named: "BreathabilityBlue"), UIImage(named: "Bitmap"), UIImage(named: "SoftAndComfortable")]
    
    var txts = ["Lifenest’s unique woven cradle contours to the shape of a baby’s head to avoid damaging pressure. Lifenest’s contact surface with a baby’s head is larger than conventional mattresses, allowing a more even distribution of pressure. Pressure is redistributed away from soft spots.", "Lifenest’s hammock design provides crucial airflow and breathability to a newborn’s sleeping area. Soft mesh technology allows babies to breathe easily through the netting if he or she rolls over. Liquids and secretions pass right through the netting to help avoid any potentially dangerous airflow blockages. Venting channels quickly eliminate the CO2 a baby breathes out for better oxygenation. Breathable Lifenest fitted sheets are specially designed to work with the Lifenest mattress topper.", "Naturally maintains babies in a comfortable back sleeping position. Promotes relaxation and better sleep by allowing unrestricted movements. Reduces overheating and sweating.", "Lifenest and Lifenest fitted sheets are Greenguard Gold certified. Both the Lifenest and Lifenest fitted sheets are BPA-free, phthalate-free and lead-free, as verified by SGS Laboratories. Lifenest is fire-protected without the addition of harmful chemicals. Breathable Lifenest fitted sheets are specially designed to work with the Lifenest mattress topper. Four corner straps secure Lifenest’s fitted sheet to crib slats."]
    
    var txtLabels = ["Flathead", "Breathability", "Safe", "Breathability"]
    
    func switchBackGroundImages(b1: UIButton, b2: UIButton)
    {
        let placeHolderImg = b1.backgroundImageForState(.Normal)
        b1.setBackgroundImage(b2.backgroundImageForState(.Normal), forState: .Normal)
        b2.setBackgroundImage(placeHolderImg, forState: .Normal)
    }
    
    @IBAction func imgView4Pressed(sender: UIButton)
    {
        switchBackGroundImages(imgView4, b2: imgView1)
        swap(&centralImgs[3], &centralImgs[0])
        centralImgView.image = centralImgs[0]
        swap(&txts[3], &txts[0])
        textView.text = txts[0]
        swap(&txtLabels[3], &txtLabels[0])
        txtLabel.text = txtLabels[0]
    }
    @IBAction func imgView3Pressed(sender: UIButton)
    {
        switchBackGroundImages(imgView3, b2: imgView1)
        swap(&centralImgs[2], &centralImgs[0])
        centralImgView.image = centralImgs[0]
        swap(&txts[2], &txts[0])
        textView.text = txts[0]
        swap(&txtLabels[2], &txtLabels[0])
        txtLabel.text = txtLabels[0]
    }
    @IBAction func imgView2Pressed(sender: UIButton)
    {
        switchBackGroundImages(imgView2, b2: imgView1)
        swap(&centralImgs[3], &centralImgs[0])
        centralImgView.image = centralImgs[0]
        swap(&txts[1], &txts[0])
        textView.text = txts[0]
        swap(&txtLabels[1], &txtLabels[0])
        txtLabel.text = txtLabels[0]
    }
    @IBAction func imgView1Pressed(sender: UIButton)
    {
        //        imgView1.setBackgroundImage(img1, forState: .Normal)
        //        imgView1.setBackgroundImage(img4, forState: .Normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let c = Colors()
        c.gl.frame = self.view.frame
        self.view.layer.insertSublayer(c.gl, atIndex: 0)
        
        textView.backgroundColor = UIColor.clearColor()
        textView.layer.backgroundColor = UIColor.clearColor().CGColor
        
        self.navigationItem.backBarButtonItem?.title = ""
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        imgView1.setBackgroundImage(imgs[order[0]], forState: .Normal)
        //imgView1.imageView?.contentScaleFactor = 0.8
        imgView2.setBackgroundImage(imgs[order[1]], forState: .Normal)
        imgView2.frame.size.width = 0.5 * imgView2.frame.size.width
        imgView3.setBackgroundImage(imgs[order[2]], forState: .Normal)
        imgView3.imageView?.contentMode = .ScaleToFill
        imgView4.setBackgroundImage(imgs[order[3]], forState: .Normal)
        imgView4.imageView?.contentMode = .ScaleToFill
        
        centralImgView.image = centralImgs[0]
        
        txtLabel.text = txtLabels[order[0]]
    }
    
    @IBAction func Buy(sender: AnyObject) {
        if let url = NSURL(string: "http://www.ubimed.com/lifenest-help-prevent-flat-head.html") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
}
