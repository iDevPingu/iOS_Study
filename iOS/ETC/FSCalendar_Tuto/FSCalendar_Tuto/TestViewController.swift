//
//  TestViewController.swift
//  FSCalendar_Tuto
//
//  Created by Ick on 2020/10/14.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    var date: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLabel.text = date
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
