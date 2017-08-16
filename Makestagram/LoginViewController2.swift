//
//  LoginViewController2.swift
//  Makestagram
//
//  Created by Mhd Ghaith on 8/4/17.
//  Copyright © 2017 Mhd Ghaith. All rights reserved.
//

import Foundation
import UIKit
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
import FirebaseFacebookAuthUI
import FirebaseGoogleAuthUI

typealias FIRUser = FirebaseAuth.User


class LoginViewController2: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBOutlet weak var loginButton: UIButton!

    @IBAction func loginButtonPressed(_ sender: Any) {
        print("Button Pressed")

        //1
        guard let authUI = FUIAuth.defaultAuthUI()
                else {
            return
        }

        //2 
        authUI.delegate = self
        let providers: [FUIAuthProvider] = [FUIGoogleAuth(), FUIFacebookAuth()]
        authUI.providers = providers

        //3
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()


        // Dispose of any resources that can be recreated.
    }


}


extension LoginViewController2: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {

       
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }

        // 1
        guard let user = user
                else {
            return
        }

        // 2
        let userRef = Database.database().reference().child("users").child(user.uid)

        // 3
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // 4 retrieve user data from snapshot
        })

        

        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // 1
            if let user = User(snapshot: snapshot) {
                print("Welcome back, \(user.username).")
            } else {
                print("New user!")
            }
        })

       


        UserService.show(forUID: user.uid) {  (user) in
            if let user = user{
                 User.setCurrent(user, writeToUserDefaults: true)

                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()

            } else {
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
        }


        print("handle user signup / login")
    }


}




