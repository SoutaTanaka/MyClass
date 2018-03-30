//
//  SignUpViewController.swift
//  MyClass
//
//  Created by 田中颯太 on 2018/03/27.
//  Copyright © 2018年 田中颯太. All rights reserved.
//

import UIKit
import  Firebase
import  FirebaseAuth


class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var rePasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        rePasswordTextField.delegate = self
        rePasswordTextField.isSecureTextEntry = true
        passwordTextField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder
        passwordTextField.resignFirstResponder()
        rePasswordTextField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func siginUpButtan(){
        signUp()
        
    }
    
    
    func transitionToView()  {
        self.performSegue(withIdentifier: "homeview", sender: self)
    }
    
    
    
    func signUp(){
        print("start sign up")
        guard  let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        guard let repassword = rePasswordTextField.text else{return}
        
        if repassword == password{
            
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    user?.sendEmailVerification(completion: { (error) in
                        if error == nil{
                            self.transitionToView()
                            print("1")
                        }else{
                            print("\(String(describing: error?.localizedDescription))")
                        }
                    }
                    )
                }else{
                    print("\(String(describing: error?.localizedDescription))")
                }
            }
        }else{
            print(2)
        }
    }
    
}
