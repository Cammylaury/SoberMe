//
//  loginVC.swift
//  SoberMe
//
//  Created by Cameron Laury on 2/24/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class loginVC: UIViewController, UITextFieldDelegate {
    
    var keyboardOnScreen = false

    @IBOutlet weak var signInBtn: signInBtn!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showCreateAccountScreenBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
        
        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
            
            //Alert to tell the user they didn't fill in the textfields
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in... my caveman debugging!
                    print("You have successfully logged in")
                    
                    //Go to the messagesViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "messagesViewController")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    // Alerts the user there is something wrong, firebase will tell them
                    let alertController = UIAlertController(title: "An error occurred", message: "Please try again", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
        func showCreateAccountScreen() {
            if showCreateAccountScreenBtn.isSelected {
                
                self.dismiss(animated: true, completion: nil)
                let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC")
                self.present(signUpVC!, animated: true, completion: nil)
            }
        }
        
    }
}
