//
//  ViewController.swift
//  NavigationViewPopPractice
//
//  Created by Ick on 2021/01/04.
//

import UIKit

class WhiteViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func touchUpButton(_ sender: UIButton) {
        guard let redView = self.storyboard?.instantiateViewController(identifier: "redViewController") as? RedViewController else { return }
        self.navigationController?.pushViewController(redView, animated: true)
    }
    


}

