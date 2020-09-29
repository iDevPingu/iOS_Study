//
//  TodoListViewHeaderView.swift
//  TodoListAppWithoutSB
//
//  Created by Ick on 2020/09/29.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

class TodoListViewHeaderView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.headerViewSetting()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func addSubviewToHeaderView(){
        self.addSubview(self.dateLabel)
    }
    
    func headerViewSetting(){
        self.addSubviewToHeaderView()
        self.dateLabelSetting()
    }
    
    func dateLabelSetting(){
        self.dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        self.dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.dateLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
    }
}
