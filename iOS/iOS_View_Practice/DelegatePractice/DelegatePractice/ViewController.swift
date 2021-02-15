//
//  ViewController.swift
//  DelegatePractice
//
//  Created by Ick on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: MyView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let mymyView = Bundle.main.loadNibNamed("MyView", owner: nil, options: nil)
        guard let myViewReal = mymyView?.first as? MyView else { return }
        myViewReal.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        self.view.addSubview(myViewReal)
        myViewReal.delegate = self
    }
}

extension ViewController: MyViewDelegate {
    func touchUp(_ str: String) {
        print(str)
    }
}
