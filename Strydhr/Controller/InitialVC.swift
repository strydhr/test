//
//  InitialVC.swift
//  Strydhr
//
//  Created by Satyia Anand on 02/04/2018.
//  Copyright © 2018 Satyia Anand. All rights reserved.
//

import UIKit

class InitialVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

 
    @IBAction func userBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func overseerBtnPressed(_ sender: Any) {
    }
    
}
