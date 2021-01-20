//
//  BlueViewController.swift
//  NavigationViewPopPractice
//
//  Created by Ick on 2021/01/04.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(self.popBlueView), name: Notification.Name("gotoRedView"), object: nil)
    }

    @objc func popBlueView() {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func touchUpButton(_ sender: UIButton) {
        guard let greenView = self.storyboard?.instantiateViewController(identifier: "greenViewController") as? GreenViewController else { return }
        self.navigationController?.pushViewController(greenView, animated: true)
    }
    


}
