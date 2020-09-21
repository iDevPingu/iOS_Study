//
//  HomeViewCell.swift
//  AppleMusicWithoutSB
//
//  Created by Ick on 2020/09/17.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        self.cellSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    var songNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func cellSetting(){
        self.addSubviewsToCell()
        self.imgViewSetting()
        self.songNameLabelSetting()
        self.artistNameLabelSetting()
    }
    
    func addSubviewsToCell(){
        self.addSubview(self.imgView)
        self.addSubview(self.songNameLabel)
        self.addSubview(self.artistNameLabel)
    }
    
    func updateData(item: Track?){
        guard let track = item else { return }
        self.imgView.image = track.artwork
        self.songNameLabel.text = track.title
        self.artistNameLabel.text = track.artist
    }
    
    func imgViewSetting(){
        self.imgView.contentMode = .scaleToFill
        self.imgView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.imgView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10).isActive = true
        self.imgView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10).isActive = true
        
        self.imgView.widthAnchor.constraint(equalToConstant: self.bounds.width - 20).isActive = true
        self.imgView.heightAnchor.constraint(equalTo: self.imgView.widthAnchor).isActive = true
    }
    func songNameLabelSetting(){
        self.songNameLabel.topAnchor.constraint(equalTo: self.imgView.bottomAnchor).isActive = true
        self.songNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10).isActive = true
        self.songNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant:  -10).isActive = true
    }
    func artistNameLabelSetting(){
        self.artistNameLabel.topAnchor.constraint(equalTo: self.songNameLabel.bottomAnchor, constant: 10).isActive = true
        self.artistNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant:  10).isActive = true
        self.artistNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant:  -10).isActive = true
    }
    
    // awakeFromNib 스토리보드에서 실제 앱으로 로드될때 메서드 호출
}
