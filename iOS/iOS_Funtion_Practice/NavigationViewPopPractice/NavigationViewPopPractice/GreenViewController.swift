//
//  GreenViewController.swift
//  NavigationViewPopPractice
//
//  Created by Ick on 2021/01/04.
//

import UIKit

class GreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
@IBAction func touchUpButton(_ sender: UIButton) {
    // go to white view controller
//    self.navigationController?.popToRootViewController(animated: true)
    
    // go to red
    
//    guard let viewControllerStack = self.navigationController?.viewControllers else { return }
//    // 뷰 스택에서 RedViewController를 찾아서 거기까지 pop 합니다.
//    for viewController in viewControllerStack {
//        if let redView = viewController as? RedViewController {
//            self.navigationController?.popToViewController(redView, animated: true)
//        }
//    }
    // notification
//    self.navigationController?.popViewController(animated: true)
    NotificationCenter.default.post(name: Notification.Name("gotoRedView"), object: nil)
    
}

}
