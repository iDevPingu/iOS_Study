//
//  TodoListViewCell.swift
//  TodoListAppWithoutSB
//
//  Created by Ick on 2020/09/25.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

class TodoListViewCell: UICollectionViewCell {
    
    var toDoListLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func cellSetting(){
        self.addSubviewToCell()
        self.checkButtonSetting()
        self.toDoListLabelSetting()
        self.deleteButtonSetting()
    }
    
    func addSubviewToCell(){
        self.addSubview(self.toDoListLabel)
        self.addSubview(self.deleteButton)
        self.addSubview(self.checkButton)
    }
    
    func checkButtonSetting(){
        self.checkButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        self.checkButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.checkButton.setImage(UIImage(systemName: "circle"), for: .normal)
        self.checkButton.setImage(UIImage(systemName: "circle.fill"), for:.selected)
        self.checkButton.tintColor = .systemPink
        self.checkButton.addTarget(self, action: #selector(self.touchUpCheckButton(_:)), for: .touchUpInside)
    }
    
    func toDoListLabelSetting(){
        self.toDoListLabel.leftAnchor.constraint(equalTo: self.checkButton.rightAnchor, constant: 10).isActive = true
        self.toDoListLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.toDoListLabel.text = "HELLO"
    }
    
    func deleteButtonSetting(){
        self.deleteButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        self.deleteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.deleteButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        self.deleteButton.tintColor = .systemPink
    }
    
    @objc func touchUpCheckButton(_ sender: UIButton){
        if sender.isSelected == false {
            sender.isSelected = true
            self.toDoListLabel.tintColor = .lightGray
            
            let attributedString = NSMutableAttributedString(string: self.toDoListLabel.text!)
            attributedString.addAttribute(.strikethroughStyle, value: 0, range: NSRange.init(location: 0, length: attributedString.length))
            attributedString.addAttribute(.baselineOffset, value: 0, range: NSRange.init(location: 0, length: attributedString.length))
            self.toDoListLabel.attributedText = attributedString
        } else {
            sender.isSelected = false
        }
    }
    
}
