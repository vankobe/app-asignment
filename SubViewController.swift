//
//  SubViewController.swift
//  AppAsignment
//
//  Created by 江上真人 on 2015/08/18.
//  Copyright (c) 2015年 eversense. All rights reserved.
//
import Foundation
import UIKit

class SubViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    var viewUrl: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.delegate = self
        println("sub")
        println(viewUrl)
        loadAddressURL()
    }
    
    func loadAddressURL() {
        if let requestURL = NSURL(string: viewUrl) {
            let req = NSURLRequest(URL: requestURL)
            self.webView.loadRequest(req)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

