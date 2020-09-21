//
//  BountyListCollectionViewCell.swift
//  CollectionViewWithoutSB
//
//  Created by Ick on 2020/09/17.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

class BountyListCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func cellSetting(){
        self.addSubviewsToCell()
        self.imgViewSetting()
        self.nameLabelSetting()
        self.bountyLabelSetting()
    }
    
    func addSubviewsToCell(){
        self.addSubview(self.imgView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.bountyLabel)
    }
    
    func imgViewSetting(){
        self.imgView.contentMode = .scaleToFill
        self.imgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.imgView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        self.imgView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 5).isActive = true
        self.imgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.frame.height * 0.3).isActive = true
        
    }
    
    func nameLabelSetting(){
        self.nameLabel.textAlignment = .center
//        self.nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.nameLabel.topAnchor.constraint(equalTo: self.imgView.bottomAnchor, constant: 5).isActive = true
        self.nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    func bountyLabelSetting(){
        self.bountyLabel.textAlignment = .center
        self.bountyLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5).isActive = true
        self.bountyLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.bountyLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var bountyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func updateData(info: BountyInfo){
        self.imgView.image = info.image
        self.nameLabel.text = info.name
        self.bountyLabel.text = String(info.bounty)
    }
    
}
