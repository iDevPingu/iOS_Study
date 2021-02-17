//
//  MyCell.swift
//  DelegatePractice
//
//  Created by Ick on 2021/02/17.
//

import UIKit

class MyCell: UITableViewCell {

    static let identifier: String = "myCell"
    static let nibName: String = "MyCell"
    weak var delegate: MyCellDelegate?
    
    let tabGesture = UITapGestureRecognizer()
    
    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tabGesture.addTarget(self, action: #selector(self.tapLabel))
        self.tabGesture.delegate = self
        self.contentView.addGestureRecognizer(tabGesture)
    }

    @objc func tapLabel() {
        self.delegate?.labelTextReturn(text: self.myLabel.text)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

protocol MyCellDelegate: class {
    func labelTextReturn(text: String?)
}
