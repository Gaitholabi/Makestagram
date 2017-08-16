//
//  ViewController.swift
//  Makestagram
//
//  Created by Mhd Ghaith on 8/3/17.
//  Copyright © 2017 Mhd Ghaith. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {


    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var userNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let firUser = Auth.auth().currentUser,
              let username = userNameTextField.text,
              !username.isEmpty else {
            return
        }

        print(firUser.displayName)
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {
                return
            }

             User.setCurrent(user, writeToUserDefaults: true)

            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()


            print("Created new user: \(user.username)")
        }


    }

}

