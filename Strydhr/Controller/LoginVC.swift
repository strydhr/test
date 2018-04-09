//
//  LoginVC.swift
//  Strydhr
//
//  Created by Satyia Anand on 02/04/2018.
//  Copyright © 2018 Satyia Anand. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
//    let defaultValues = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func loginBtnPressed(_ sender: Any) {
        let email = emailTxtField.text!
        let password = passwordTxtField.text!


        AuthService.instance.login(withEmail: email, andPassword: password) { (success) in
            if success{
        
                OperationQueue.main.addOperation({
                    self.performSegue(withIdentifier: "loginsegue", sender: self)
                })

            }else{
                print("login Failed")
            }
        }
      
    }
    
}
