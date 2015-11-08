//
//  ViewController.swift
//  Revinote
//
//  Created by Charlie Thomas on 08/11/2015.
//  Copyright (c) 2015 Charlie Thomas. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    let ref = Firebase(url: "https://revinote.firebaseio.com")

    @IBAction func login(sender: AnyObject) {
        let email = emailTextField.text
        let password = passwordTextField.text

        ref.authUser(email, password: password) {
            error, authData in
            if error != nil {
                let alert = UIAlertView()
                alert.title = "Error"
                alert.message = error.description
                alert.addButtonWithTitle("Ok")
                alert.show()
                
            } else {
                // user is logged in, check authData for data
                println(authData.uid)
                self.performSegueWithIdentifier("loginUser", sender: self)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

