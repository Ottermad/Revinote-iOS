//
//  HomeViewController.swift
//  Revinote
//
//  Created by Charlie Thomas on 08/11/2015.
//  Copyright (c) 2015 Charlie Thomas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var firebaseUser : User?

    @IBOutlet var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.text = firebaseUser?.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
