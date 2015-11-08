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
    var firebaseUser : User?
    let ref = Firebase(url: "https://revinote.firebaseIO.com")
 
    @IBAction func login(sender: AnyObject) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        ref.authUser(email, password: password,
            withCompletionBlock: { error, authData in
                if error != nil {
                    // There was an error logging in to this account
                    let alert = UIAlertView()
                    alert.title = "Error"
                    alert.message = error.description
                    alert.addButtonWithTitle("Ok")
                    alert.show()
                } else {
                    // We are now logged in
                    var uid = authData.uid
                    self.firebaseUser = User(uid: uid, email: email)
                    self.performSegueWithIdentifier("loginUser", sender: self)
                }
        })
            
    }
    
    
    @IBAction func signUp(sender: AnyObject) {
        let email = emailTextField.text
        let password = passwordTextField.text

        ref.createUser(email, password: password,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    let alert = UIAlertView()
                    alert.title = "Error"
                    alert.message = error.description
                    alert.addButtonWithTitle("Ok")
                    alert.show()
                } else {
                    self.login(self)
                }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loginUser" {
            let homeViewController = segue.destinationViewController as HomeViewController
            println(self.firebaseUser?.email)
            homeViewController.firebaseUser = self.firebaseUser
        }
    }

}

