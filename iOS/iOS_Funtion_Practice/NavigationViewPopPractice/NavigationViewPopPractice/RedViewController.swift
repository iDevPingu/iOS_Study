//
//  RedViewController.swift
//  NavigationViewPopPractice
//
//  Created by Ick on 2021/01/04.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func touchUpButton(_ sender: UIButton) {
        guard let blueView = self.storyboard?.instantiateViewController(identifier: "blueViewController") as? BlueViewController else { return }
        self.navigationController?.pushViewController(blueView, animated: true)
    }
    
}
