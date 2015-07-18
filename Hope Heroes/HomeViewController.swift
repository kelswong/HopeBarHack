//
//  HomeViewController.swift
//  Hope Heroes
//
//  Created by Kelsey Wong on 7/17/15.
//  Copyright (c) 2015 Kelsey Wong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!

}

