//
//  AuthService.swift
//  Strydhr
//
//  Created by Satyia Anand on 04/04/2018.
//  Copyright © 2018 Satyia Anand. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService{
    static let instance = AuthService()
    
    func loginUser(withEmail email: String, andPassword password: String,logincomplete: @escaping(_ status: Bool)->()){
        let requestedURL = NSURL(string: URL_LOGIN)!
        let request = NSMutableURLRequest(url: requestedURL as URL)
        request.httpMethod = "POST"
        
        let parameters = "password="+password+"&email="+email;
        request.httpBody = parameters.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil{
                print(error)
                return
            }
            do{
                let myJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = myJSON {

                    var msg: String!
                    msg = parseJSON["message"] as! String?
                    print(msg)
                    
                    if msg == "User exist and logging in" {
                        
                        print("bakana")
                        logincomplete(true)
   
                    }else{
                        logincomplete(false)
                    }
                }

                
                
            }catch{
                print(error)
                
            }
        }
        task.resume()
    }
    
    func login(withEmail email:String, andPassword password:String,loginComplete: @escaping(_ status: Bool)->()){
        let defaultValues = UserDefaults.standard
        
        let parameters: Parameters = [
            "password":password,
            "email":email
        ]
   
        Alamofire.request(LOGIN, method: .post, parameters: parameters).responseJSON { (response) in
            print(response)
            
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                
                if(!(jsonData.value(forKey: "error")as! Bool)){
                    
                    let user = jsonData.value(forKey: "user") as! NSDictionary
                    
                    let userID = user.value(forKey: "uid") as! String
                    let userEmail = user.value(forKey: "email") as! String
                    
                    defaultValues.set(userID, forKey: "userID")
                    defaultValues.set(userEmail, forKey: "email")
                    
                    loginComplete(true)
                    
                }else{
                    loginComplete(false)
                }
            }
        }
        
    }
}
