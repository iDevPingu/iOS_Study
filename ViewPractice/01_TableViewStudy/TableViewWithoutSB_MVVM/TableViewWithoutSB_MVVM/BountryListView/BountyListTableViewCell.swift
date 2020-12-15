//
//  TableViewCell.swift
//  TableViewWithoutSB
//
//  Created by Ick on 2020/09/16.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

class BountyListTableViewCell: UITableViewCell {

    var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var bountyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 셀을 생성하고 설정합니다.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellSetting()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // Cell을 설정합니다
    func cellSetting(){
        self.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.addSubview(self.imgView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.bountyLabel)
        self.imgViewSetting()
        self.bountyLabelSetting()
        self.nameLabelSetting()

        
    }
    
    func imgViewSetting(){
        self.imgView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.imgView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        self.imgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        self.imgView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.imgView.widthAnchor.constraint(equalTo: self.imgView.heightAnchor, multiplier: 0.8).isActive = true
    }
    
    func nameLabelSetting(){
        
        self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
        self.nameLabel.leftAnchor.constraint(equalTo: self.imgView.rightAnchor, constant: 50).isActive = true
        self.nameLabel.textAlignment = .center
        self.nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.nameLabel.font = UIFont.italicSystemFont(ofSize: 30)
    }
    
    func bountyLabelSetting(){
        
        self.bountyLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20).isActive = true
        self.bountyLabel.leftAnchor.constraint(equalTo: self.imgView.rightAnchor, constant: 50).isActive = true
        self.bountyLabel.textAlignment = .center
        self.bountyLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.bountyLabel.textColor = .gray
        self.bountyLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
    }

    func updateData(info: BountyInfo){
        self.imgView.image = info.image
        self.nameLabel.text = info.name
        self.bountyLabel.text = String(info.bounty)
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
