//
//  ViewController.swift
//  DifferenceOfBoundsAndFrame
//
//  Created by Ick on 2020/11/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var thisIsSuperView: UIView!
    @IBOutlet weak var thisIsSubView: UIView!
    @IBOutlet weak var thisIsSubSubView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        thisIsSubView.bounds.origin.x = 50
//        thisIsSubView.bounds.origin.y = 50
        
        thisIsSubView.bounds.size = CGSize(width: 130, height: 130)
        
        print("슈퍼뷰 frame : \(thisIsSuperView.frame)")
        print("슈퍼뷰 bounds : \(thisIsSubView.bounds)")
        
        
        print("서브뷰 frame : \(thisIsSubView.frame)")
        print("서브뷰 bounds : \(thisIsSubView.bounds)")
        
        print("서브뷰의 서브뷰 frame : \(thisIsSubSubView.frame)")
        print("서브뷰의 서브뷰 bounds : \(thisIsSubSubView.bounds)")
        
        
        
        
    }

    
}


