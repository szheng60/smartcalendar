//
//  FirstViewController.swift
//  Zazu Screens
//
//  Created by Gokul Raghuraman on 3/26/15.
//  Copyright (c) 2015 Zazu Labs. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController
{
    override func viewDidLoad() {
        self.performSegueWithIdentifier("ToEvents", sender: self)
    }

}
