//
//  DisclaimerViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 11/11/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class DisclaimerViewController: UIViewController {

    @IBOutlet weak var disclaimerLabel: UILabel!
    
    @IBAction func `continue`(sender: AnyObject) {
        self.determineSymptom()
    }
    var image: UIImage = UIImage()
    var CranialIndex: Double = 0;
    var CVAI: Double = 0;
    var symptom: String = String()
    func determineSymptom() {
        
        if (CVAI < 3.5)
        {
            if (CranialIndex < 76)
            {
                self.symptom = "Dolichocephaly"
            }
            if (CranialIndex >= 76 && CranialIndex <= 80)
            {
                self.symptom = "Normocephaly"
            }
            if (CranialIndex > 80 && CranialIndex <= 90)
            {
                self.symptom = "Mild Brachycephaly"
            }
            if (CranialIndex > 90 && CranialIndex <= 100)
            {
                self.symptom = "Moderate Brachycephaly"
            }
            if (CranialIndex > 100)
            {
                self.symptom = "Severe Brachycephaly"
            }
        }
        else
        {
            if (CVAI >= 3.5 && CVAI <= 6.5)
            {
                if (CranialIndex < 76)
                {
                    self.symptom = "Dolichocephaly and Mild Plagiocephaly"
                }
                if (CranialIndex >= 76 && CranialIndex <= 80)
                {
                    self.symptom = "Mild Plagiocephaly"
                }
                if (CranialIndex > 80 && CranialIndex <= 90)
                {
                    self.symptom = "Mild Brachycephaly and Mild Plagiocephaly"
                }
                if (CranialIndex > 90 && CranialIndex <= 100)
                {
                    self.symptom = "Moderate Brachycephaly and Mild Plagiocephaly"
                }
                if (CranialIndex > 100)
                {
                    self.symptom = "Severe Brachycephaly and Mild Plagiocephaly"
                }
            }
            if (CVAI > 6.5 && CVAI <= 8.75)
            {
                if (CranialIndex < 76)
                {
                    self.symptom = "Dolichocephaly and Moderate Plagiocephaly"
                }
                if (CranialIndex >= 76 && CranialIndex <= 80)
                {
                    self.symptom = "Moderate Plagiocephaly"
                }
                if (CranialIndex > 80 && CranialIndex <= 90)
                {
                    self.symptom = "Mild Brachycephaly and Moderate Plagiocephaly"
                }
                if (CranialIndex > 90 && CranialIndex <= 100)
                {
                    self.symptom = "Moderate Brachycephaly and Moderate Plagiocephaly"
                }
                if (CranialIndex > 100)
                {
                    self.symptom = "Severe Brachycephaly and Moderate Plagiocephaly"
                }
            }
            if (CVAI > 8.75)
            {
                if (CranialIndex < 76)
                {
                    self.symptom = "Dolichocephaly and Severe Plagiocephaly"
                }
                if (CranialIndex >= 76 && CranialIndex <= 80)
                {
                    self.symptom = "Severe Plagiocephaly"
                }
                if (CranialIndex > 80 && CranialIndex <= 90)
                {
                    self.symptom = "Mild Brachycephaly and Severe Plagiocephaly"
                }
                if (CranialIndex > 90 && CranialIndex <= 100)
                {
                    self.symptom = "Moderate Brachycephaly and Severe Plagiocephaly"
                }
                if (CranialIndex > 100)
                {
                    self.symptom = "Severe Brachycephaly and Severe Plagiocephaly"
                }
            }
        }
        self.performSegueWithIdentifier("segueToNormoVC", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        super.viewDidLoad()
        print("disc CVAI \(self.CVAI)")
        print("disc CranialIndex \(self.CranialIndex)")
        self.disclaimerLabel.text = "Accuracy may vary.\nThe accuraccy of Plagioscope App depends of several factors:\n-The way the picture was taken.\n-The positioning of the measurement template.\nHairs may modify the result. For more accurate measurements, Pediatricians use a caliper.\nDuring the first five months of life, the skull is very malleable and the head shape may change quickly. Plagioscope App results may vary over time.\n\nAny results must be confirmed by a health care professional using a calibrated medical device."
        // Do any additional setup after loading the view.
        
        let c = Colors()
        c.gl.frame = self.view.frame
        self.view.layer.insertSublayer(c.gl, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var resultScene = segue.destinationViewController as! NormocephalyViewController
        // Pass the selected object to the new view controller.
        resultScene.image = self.image
        resultScene.CranialIndex = self.CranialIndex
        //        print("outgoing left diagonal length to CVAI2 \(self.leftDiagonalLength)")
        resultScene.CVAI = self.CVAI
        resultScene.symptom = self.symptom
        
        if (symptom == "Normocephaly")
        {
            resultScene.symtopmDetailsLocal = "All symmetry within normal limits.\n\nRecommended next step: baby's head is very malleable during the first few months of life. We recommend repeating this test on a regular basis.\n\nUbimed recommends using the Lifenest low pressure mattress to prevent positional Plagiocephaly (more information on www.ubimed.com)"
        }
        if (symptom == "Dolichocephaly")
        {
            resultScene.symtopmDetailsLocal = "A condition where the head is longer than expected, relative to its width.\n\nRecommended next step: Please consult without delay your pediatrician for the adapted treatment. Ask him about how the Lifenest low pressure hammock mattress and physiotherapy may help (more information at www.ubimed.com)."
        }
        if (symptom == "Mild Brachycephaly")
        {
            resultScene.symtopmDetailsLocal = "Brachycephaly is a condition where the head is wider than would be expected, relative to its length.\n\nRecommended next step: Please consult without delay your pediatrician for the adapted treatment. Ask him about how the Lifenest low pressure hammock mattress and physiotherapy may help (more information at www.ubimed.com)."
        }
        if (symptom == "Moderate Brachycephaly")
        {
            resultScene.symtopmDetailsLocal = "Brachycephaly is a condition where the head is wider than would be expected, relative to its length.\n\nRecommended next step: Please consult without delay your pediatrician for the adapted treatment. Ask him about how the Lifenest low pressure hammock mattress and physiotherapy may help (more information at www.ubimed.com)."
        }
        if (symptom == "Severe Brachycephaly")
        {
            resultScene.symtopmDetailsLocal = "Brachycephaly is a condition where the head is wider than would be expected, relative to its length.\n\nRecommended next step: Please consult without delay your pediatrician for the adapted treatment. Ask him about how the Lifenest low pressure hammock mattress and physiotherapy may help (more information at www.ubimed.com)."
        }
        if (symptom == "Dolichocephaly and Mild Plagiocephaly"||symptom == "Dolichocephaly and Moderate Plagiocephaly" || symptom == "Dolichocephaly and Severe Plagiocephaly")
        {
            resultScene.symtopmDetailsLocal = "Dolichocephaly is a condition where the head is longer than expected, relative to its width.\n\nPlagiocephaly is the flattening of the head.\n\nRecommended next step: Please consult without delay your pediatrician for the adapted treatment. Ask him about how the Lifenest low pressure hammock mattress and physiotherapy may help (more information at www.ubimed.com)."
        }
        if (symptom == "Mild Plagiocephaly"||symptom == "Moderate Plagiocephaly"||symptom == "Severe Plagiocephaly")
        {
            resultScene.symtopmDetailsLocal = "Plagiocephaly is the flattening of the head.\n\nRecommended next step: Please consult without delay your pediatrician for the adapted treatment. Ask him about how the Lifenest low pressure hammock mattress and physiotherapy may help (more information at www.ubimed.com)."
        }
        
        if (symptom == "Mild Brachycephaly and Mild Plagiocephaly" || symptom == "Moderate Brachycephaly and Mild Plagiocephaly"||symptom == "Severe Brachycephaly and Mild Plagiocephaly"||symptom == "Mild Brachycephaly and Moderate Plagiocephaly"||symptom == "Moderate Brachycephaly and Moderate Plagiocephaly"||symptom == "Severe Brachycephaly and Moderate Plagiocephaly"||symptom == "Mild Brachycephaly and Severe Plagiocephaly"||symptom == "Moderate Brachycephaly and Severe Plagiocephaly"||symptom == "Severe Brachycephaly and Severe Plagiocephaly")
        {
            resultScene.symtopmDetailsLocal = "Brachycephaly is a condition where the head is wider than would be expected, relative to its length.\n\nPlagiocephaly is the flattening of the head.\n\nRecommended next step: Please consult without delay your pediatrician for the adapted treatment. Ask him about how the Lifenest low pressure hammock mattress and physiotherapy may help (more information at www.ubimed.com)."
        }
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
