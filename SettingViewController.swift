//
//  SettingViewController.swift
//  AppAsignment
//
//  Created by 江上真人 on 2015/08/20.
//  Copyright (c) 2015年 eversense. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    
    let ud = NSUserDefaults.standardUserDefaults()
    @IBAction func firstButtonTapped(sender: AnyObject) {
        ud.setObject("1", forKey: "articleType")
    }
    
    @IBAction func secondButtonTapped(sender: AnyObject) {
        ud.setObject("2", forKey: "articleType")
    }
    @IBAction func allButtonTapped(sender: AnyObject) {
        ud.setObject("0", forKey: "articleType")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}