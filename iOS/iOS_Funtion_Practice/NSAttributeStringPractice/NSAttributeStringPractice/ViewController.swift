//
//  ViewController.swift
//  NSAttributeStringPractice
//
//  Created by Ick on 2020/12/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.changeTextAttributes()
    }
    
    func changeTextAttributes() {
        guard let text = self.myLabel.text else { return }
//        guard let font = UIFont(name: "Bradley Hand", size: 60) else { return }
        
        let attributeString = NSMutableAttributedString(string: text)
        
        // Pingu에만 빨간색 적용
//        attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "Pingu"))
        
        // Pingu에만 빨간색 바탕 적용
//        attributeString.addAttribute(.backgroundColor, value: UIColor.red, range: (text as NSString).range(of: "Pingu"))
        
        // 테두리
//        attributeString.addAttribute(.strokeColor, value: UIColor.red, range: (text as NSString).range(of: "Pingu"))
//        attributeString.addAttribute(.strokeWidth, value: 10, range: (text as NSString).range(of: "Pingu"))
        
        // 밑줄 긋기
//        attributeString.addAttribute(.underlineColor, value: UIColor.red, range: (text as NSString).range(of: "Pingu"))
//        attributeString.addAttribute(.underlineStyle, value: 1, range: (text as NSString).range(of: "Pingu"))
        
//         중간 줄 긋기
//        attributeString.addAttribute(.strikethroughColor, value: UIColor.red, range: (text as NSString).range(of: "Pingu"))
//        attributeString.addAttribute(.strikethroughStyle, value: 10, range: (text as NSString).range(of: "Pingu"))
        
        // base offset
//        attributeString.addAttribute(.baselineOffset, value: 10, range: (text as NSString).range(of: "Pingu"))
        
        // 글자 간격?
        attributeString.addAttribute(.kern, value: -10, range: (text as NSString).range(of: "Pingu"))
        

        
        // Pingu에만 글자 크기 크게 적용
//        attributeString.addAttribute(.font, value: font, range: (text as NSString).range(of: "Pingu"))
        
        self.myLabel.attributedText = attributeString
    }

}

