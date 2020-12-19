//
//  SettingViewCell.swift
//  TodoListAppWithoutSB
//
//  Created by Ick on 2020/09/25.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

class SettingViewCell: UITableViewCell {

    
    var menuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.settingCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func settingCell(){
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.menuLabelSetting()
    }
    
    func menuLabelSetting(){
        self.addSubview(self.menuLabel)
        self.menuLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.menuLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.menuLabel.textColor = .none
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
