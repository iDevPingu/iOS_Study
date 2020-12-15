//
//  MenuViewController.swift
//  UserDefaults_Practice
//
//  Created by Ick on 2020/12/16.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var speedSwitch: UISwitch!
    @IBOutlet weak var speedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.speedSwitch.isOn = UserDefaults.standard.bool(forKey: "switchState")
        if UserDefaults.standard.bool(forKey: "switchState") {
            self.speedLabel.text = "1.5"
        } else {
            self.speedLabel.text = "1.0"
        }
    }
    
    
    @IBAction func switchOnOff(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "switchState")
        
        if UserDefaults.standard.bool(forKey: "switchState") {
            self.speedLabel.text = "1.5"
        } else {
            self.speedLabel.text = "1.0"
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

    @IBAction func touchUpBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}


