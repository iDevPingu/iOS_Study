//
//  ViewController.swift
//  OurSecretSpace
//
//  Created by Ick on 2020/09/02.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth

class ViewController: UIViewController, GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
        } else {
                if let nextViewController = self.storyboard?.instantiateViewController(identifier: "MyTabBar")  {
                    nextViewController.modalPresentationStyle = .fullScreen
                    self.present(nextViewController, animated: true, completion: nil)
                }
                
                
        //This is where you should add the functionality of successful login
        //i.e. dismissing this view or push the home view controller etc
        }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        print(Auth.auth().currentUser)
//        if Auth.auth().currentUser != nil {
//            if let nextViewController = self.storyboard?.instantiateViewController(identifier: "MyTabBar")  {
//                nextViewController.modalPresentationStyle = .fullScreen
//                self.present(nextViewController, animated: true, completion: nil)
//            }
//        }
//    }
    
    @IBAction func pressSignInButton(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }


}

