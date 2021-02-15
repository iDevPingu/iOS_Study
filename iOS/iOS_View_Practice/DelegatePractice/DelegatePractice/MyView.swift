//
//  MyView.swift
//  DelegatePractice
//
//  Created by Ick on 2021/02/16.
//

import UIKit

protocol MyViewDelegate {
    func touchUp(_ str: String)
}

class MyView: UIView {
    var delegate: MyViewDelegate?
    @IBOutlet weak var myButton: UIButton!

    @IBAction func touchUpMyButton(_ sender: UIButton) {
        self.delegate?.touchUp("hello")
    }
    
}
