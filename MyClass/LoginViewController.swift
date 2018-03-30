//
//  LoginViewController.swift
//  MyClass
//
//  Created by 田中颯太 on 2018/03/27.
//  Copyright © 2018年 田中颯太. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtan(){
        login()
    }
    
    func login(){
        guard  let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
            
            if error == nil {
                if let loginUser = user {
                    if self.checkUserValidate(user: loginUser) {
                        self.transitionToView()
                    }else{
                        self.presentValidateAlert()
                    }
                }
            }else{
                print("error...\(String(describing: error?.localizedDescription))")
            }
        })
        
    }
    
    func transitionToView(){
        self.performSegue(withIdentifier: "homeView", sender: nil)
    }
    
    
    
    func checkUserValidate(user: User)  -> Bool {
        return user.isEmailVerified
    }
    // メールのバリデーションが完了していない場合のアラートを表示
    func presentValidateAlert() {
        let alert = UIAlertController(title: "メール認証", message: "メール認証を行ってください", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
