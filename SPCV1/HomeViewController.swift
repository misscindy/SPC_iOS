//
//  HomeViewController.swift
//  SPCV1
//
//  Created by Cindy Fan on 9/11/15.
//  Copyright (c) 2015 Cindy Fan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect home storyboard to main storyboard via HomeViewController.
        var homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        var controller = homeStoryboard.instantiateInitialViewController() as! UINavigationController
        addChildViewController(controller)
        view.addSubview(controller.view)
        controller.didMoveToParentViewController(self)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
