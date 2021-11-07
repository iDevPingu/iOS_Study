//
//  TestViewController.swift
//  FSCalendar_Tuto
//
//  Created by Pingu on 2020/10/14.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    var date: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLabel.text = date
    }}
