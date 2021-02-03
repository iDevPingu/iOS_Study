//
//  ViewController.swift
//  LifeCycle
//
//  Created by Ick on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View Did Load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View Will Appear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View Did Diappear")
    }
    
    override func viewDidLayoutSubviews() {
//        print("View Did Layout Subviews")
    }
    @IBAction func touchUpButton(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "pink") as? PinkViewController else { return }
        vc.view.backgroundColor = .systemPink
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

