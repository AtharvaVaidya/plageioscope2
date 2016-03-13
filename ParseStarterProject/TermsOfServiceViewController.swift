//
//  TermsOfServiceViewController.swift
//  LifenestPlagiocephalyAwarenessTest
//
//  Created by Anirudh Narayan on 9/14/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import WebKit
import Parse


class TermsOfServiceViewController: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    var webView: WKWebView
    required init?(coder aDecoder: NSCoder) {
        self.webView = WKWebView(frame: CGRectZero)
        
        super.init(coder: aDecoder)
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
    }
    @IBAction func iDontAgree(sender: AnyObject) {
        
       self.dismissViewControllerAnimated(true, completion: nil)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let presentLogin: StartViewController = storyboard.instantiateViewControllerWithIdentifier("startViewController") as! StartViewController
//        self.presentViewController(presentLogin, animated: true, completion: nil)
    }
    
    @IBOutlet weak var doneReading: UIBarButtonItem!
    
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress", context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if (keyPath == "estimatedProgress") {
            progressView.hidden = webView.estimatedProgress == 1
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barView.frame = CGRect(x:0, y: 0, width: view.frame.width, height: 30)
        view.insertSubview(webView, belowSubview: progressView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        let height = NSLayoutConstraint(item: webView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: webView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0)
        view.addConstraints([height, width])
        
        let url = NSURL(string:"http://www.ubimed.com/terms-of-use")
        let request = NSURLRequest(URL:url!)
        webView.loadRequest(request)
        if let user = PFUser.currentUser() {
            self.navigationItem.rightBarButtonItems = []
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        barView.frame = CGRect(x:0, y: 0, width: size.width, height: 30)
    }
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
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
