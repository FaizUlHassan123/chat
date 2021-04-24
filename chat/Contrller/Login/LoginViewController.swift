//
//  LoginViewController.swift
//  chat
//
//  Created by Faiz Ul Hassan on 4/24/21.
//

import UIKit
import FBSDKLoginKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {
    
    @IBOutlet weak var login:UIButton!
    @IBOutlet weak var fb_login: UIButton!
    @IBOutlet weak var google_login: UIButton!
    
    @IBOutlet weak var email:SkyFloatingLabelTextField!
    @IBOutlet weak var password:SkyFloatingLabelTextField!

    @IBAction func login(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.placeholder = "Email"
        email.title  = "Email"
        password.placeholder = "Password"
        password.title = "Password"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fbloginButtonTapped(_ sender: Any) {
        
        print("FAcebook Login")
        // 1
        let loginManager = LoginManager()
        
        if let _ = AccessToken.current {
            // Access token available -- user already logged in
            // Perform log out
            
            // 2
            loginManager.logOut()
            //updateButton(isLoggedIn: false)
            //updateMessage(with: nil)
            
        } else {
            // Access token not available -- user already logged out
            // Perform log in
            
            // 3
            loginManager.logIn(permissions: [], from: self) { [weak self] (result, error) in
                
                // 4
                // Check for error
                guard error == nil else {
                    // Error occurred
                    print(error!.localizedDescription)
                    return
                }
                
                // 5
                // Check for cancel
                guard let result = result, !result.isCancelled else {
                    print("User cancelled login")
                    return
                }
              
                // Successfully logged in
                // 6
               // self?.updateButton(isLoggedIn: true)
                
                // 7
               // Profile.loadCurrentProfile { (profile, error) in
                 //   self?.updateMessage(with: Profile.current?.name)
               // }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
