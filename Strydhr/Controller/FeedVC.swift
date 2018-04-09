//
//  FirstViewController.swift
//  Strydhr
//
//  Created by Satyia Anand on 02/04/2018.
//  Copyright © 2018 Satyia Anand. All rights reserved.
//

import UIKit
import Alamofire

class FeedVC: UIViewController {

  
    @IBOutlet weak var emailLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaultValues = UserDefaults.standard
        if let email = defaultValues.string(forKey: "email"){
            emailLabel.text = email
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logOutBtnPressed(_ sender: Any) {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        dismiss(animated: true, completion: nil)
    }
    
}

