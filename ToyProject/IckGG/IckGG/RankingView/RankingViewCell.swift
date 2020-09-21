//
//  RankingViewCell.swift
//  IckGG
//
//  Created by Ick on 2020/09/09.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

class RankingViewCell: UITableViewCell {
    
    var userIDLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var rankingNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var tierLPLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var summonerIconImageView: UIImageView = {
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
        self.addSubview(self.userIDLabel)
        self.addSubview(self.rankingNumberLabel)
        self.addSubview(self.tierLPLabel)
        self.addSubview(self.summonerIconImageView)
        self.userIDLabelSetting()
        self.rankingNumberLabelSetting()
        self.tierLPLabelSetting()
        self.summonerIconImageViewSetting()
        
    }
    
    func rankingNumberLabelSetting(){
        self.rankingNumberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.rankingNumberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.rankingNumberLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
    }
    
    func userIDLabelSetting(){
        self.userIDLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.userIDLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.userIDLabel.leftAnchor.constraint(equalTo: self.summonerIconImageView.rightAnchor, constant: 5).isActive = true
    }
    
    func tierLPLabelSetting(){
        self.tierLPLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        self.tierLPLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.tierLPLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    }
    
    func summonerIconImageViewSetting(){
        self.summonerIconImageView.leftAnchor.constraint(equalTo: self.rankingNumberLabel.rightAnchor, constant: 5).isActive = true
        self.summonerIconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.summonerIconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.summonerIconImageView.widthAnchor.constraint(equalTo: self.summonerIconImageView.heightAnchor).isActive = true
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
