//
//  ViewController.swift
//  NotificationPractice
//
//  Created by Ick on 2021/02/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.buttonClicked),
                                               name: Notification.Name("buttonClicked"),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didEnterBackground),
                                               name: UIApplication.didEnterBackgroundNotification,
                                               object: nil)
        
        
        NotificationCenter.default.removeObserver(self,
                                                  name: Notification.Name("buttonClicked"),
                                                  object: nil)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: UIApplication.didEnterBackgroundNotification,
                                                  object: nil)
    }
    
    
    
    @IBAction func clickButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("buttonClicked"), object: nil)
    }
    
    @objc func buttonClicked() {
        self.label.text = "Button이 눌러졌어요."
        self.label.backgroundColor = .yellow
    }
    
    @objc func didEnterBackground() {
        print("앱이 백그라운드 상태가 되었습니다.")
    }
}
