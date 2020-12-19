//
//  ViewController.swift
//  UserDefaults_Practice
//
//  Created by Ick on 2020/12/15.
//

import UIKit

class ButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpMenuButton(_ sender: UIButton) {
        let menuView = MenuViewController()
        menuView.modalPresentationStyle = .fullScreen
        self.present(menuView, animated: true, completion: nil)
    }
    
}

