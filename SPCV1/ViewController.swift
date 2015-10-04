//
//  ViewController.swift
//  SPCV1
//
//  Created by Cindy Fan on 9/11/15.
//  Copyright (c) 2015 Cindy Fan. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var items = self.tabBar.items as! [UITabBarItem]
        items[0].image = UIImage(named: "home_tabbar_logo")?.imageWithRenderingMode(.AlwaysOriginal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

