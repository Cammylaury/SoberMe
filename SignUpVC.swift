//
//  SignUpVC.swift
//  SoberMe
//
//  Created by Cameron Laury on 3/3/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class SignUpVC: UIViewController {
    
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var createEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var alreadyHaveAccountBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()

    }
    
    @IBAction func createAccountAction(_ sender: AnyObject) {
        
        //If any of the three textfields are empty, show an alert asking the user to correct
        
        if createEmailTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
            
        } else {
            FIRAuth.auth()?.createUser(withEmail: createEmailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    
                    //Goes to the messages view controller (the main screen to see your messages)
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "messagesViewController")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "An error occurred", message: "Please try again", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
}
