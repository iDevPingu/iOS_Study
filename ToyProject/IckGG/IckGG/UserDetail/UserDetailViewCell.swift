//
//  UserDetailViewCell.swift
//  IckGG
//
//  Created by Ick on 2020/09/11.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

class UserDetailViewCell: UITableViewCell {

    var championImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellSetting()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func cellSetting(){
        self.backgroundColor = .none
        self.setChampionImageView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setChampionImageView(){
        self.addSubview(self.championImageView)
        self.championImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.championImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        self.championImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.championImageView.heightAnchor.constraint(equalTo: self.championImageView.widthAnchor).isActive = true
    }
}
