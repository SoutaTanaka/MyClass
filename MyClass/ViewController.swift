//
//  ViewController.swift
//  MyClass
//
//  Created by 田中颯太 on 2018/02/21.
//  Copyright © 2018年 田中颯太. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if checkUserVerify() {
            transitionToView()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toSigninView (){
        self.performSegue(withIdentifier: "signinView", sender: nil)
    }
    
    @IBAction func toSignupView (){
        self.performSegue(withIdentifier: "signupView", sender: nil)
    }
    
    @IBAction func toSigninViewFromSignupView(){
        self.performSegue(withIdentifier: "signinview", sender: nil)
    }
    
    func transitionToView(){
        self.performSegue(withIdentifier: "home", sender: nil)
    }
    
    func checkUserVerify()  -> Bool {
        guard let user = Auth.auth().currentUser else { return false }
        return user.isEmailVerified
    }
}

