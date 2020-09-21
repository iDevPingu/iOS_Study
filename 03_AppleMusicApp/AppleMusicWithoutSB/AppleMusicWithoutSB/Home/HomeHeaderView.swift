//
//  HomeHeaderView.swift
//  AppleMusicWithoutSB
//
//  Created by Ick on 2020/09/18.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit
import AVFoundation

class HomeHeaderView: UICollectionReusableView{
    
    var todayPickLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var thumbnailImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var playImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var viewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var item: AVPlayerItem?
    var tapHandler: ((AVPlayerItem) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        headerViewSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func update(with item: AVPlayerItem){
        self.item = item
        guard let track = item.convertToTrack() else { return }
        self.thumbnailImgView.image = track.artwork
        self.descriptionLabel.text = "Today's pick is \(track.artist)'s album \n \(track.albumName), Let listem."
    }
    
    @objc func cardTapped(_ sender: UIButton){
        guard let todayItem = item else { return }
        tapHandler?(todayItem)
    }
    
    func headerViewSetting(){
        self.addSubviewsToHeaderView()
        self.todayPickLabelSetting()
        self.thumbnailImgViewSetting()
        self.descriptionLabelSetting()
        self.playImgViewSetting()
        self.viewButtonSetting()
    }
    
    func addSubviewsToHeaderView(){
        self.addSubview(self.todayPickLabel)
        self.addSubview(self.thumbnailImgView)
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.playImgView)
        self.addSubview(self.viewButton)
    }
    func viewButtonSetting(){
        self.viewButton.tintColor = .none
        self.viewButton.topAnchor.constraint(equalTo: self.thumbnailImgView.topAnchor).isActive = true
        self.viewButton.bottomAnchor.constraint(equalTo: self.thumbnailImgView.bottomAnchor).isActive = true
        self.viewButton.leftAnchor.constraint(equalTo: self.thumbnailImgView.leftAnchor).isActive = true
        self.viewButton.rightAnchor.constraint(equalTo: self.thumbnailImgView.rightAnchor).isActive = true
        self.viewButton.addTarget(self, action: #selector(self.pressViewButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressViewButton(_ sender: UIButton){
        guard let todayItem = item else { return }
        tapHandler?(todayItem)
    }
    
    func playImgViewSetting(){
        self.playImgView.image = UIImage.init(systemName: "play.circle")
        self.playImgView.tintColor = .systemPink
        self.playImgView.rightAnchor.constraint(equalTo: self.thumbnailImgView.rightAnchor, constant: -5).isActive = true
        self.playImgView.bottomAnchor.constraint(equalTo: self.thumbnailImgView.bottomAnchor, constant: -5).isActive = true
        self.playImgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.playImgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func todayPickLabelSetting(){
        self.todayPickLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 10).isActive = true
        self.todayPickLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10).isActive = true
        self.todayPickLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

        self.todayPickLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.todayPickLabel.font = UIFont.boldSystemFont(ofSize: 30)
        self.todayPickLabel.text = "Today Pick!"
    }
    
    func thumbnailImgViewSetting(){
        self.thumbnailImgView.contentMode = .scaleToFill
        self.thumbnailImgView.topAnchor.constraint(equalTo: self.todayPickLabel.bottomAnchor,constant: 10).isActive = true
        self.thumbnailImgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        self.thumbnailImgView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 5).isActive = true
        self.thumbnailImgView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -5).isActive = true
        
        self.thumbnailImgView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        self.thumbnailImgView.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
//
    }
    func descriptionLabelSetting(){
        self.descriptionLabel.bottomAnchor.constraint(equalTo: self.thumbnailImgView.bottomAnchor).isActive = true
        self.descriptionLabel.leftAnchor.constraint(equalTo: self.thumbnailImgView.leftAnchor,constant: 5).isActive = true
        self.descriptionLabel.numberOfLines = 2
        self.descriptionLabel.widthAnchor.constraint(equalToConstant: self.frame.width - 100).isActive = true
        self.descriptionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.descriptionLabel.textColor = .systemPink
    }
    

}
