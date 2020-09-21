//
//  PlayerViewController.swift
//  AppleMusicWithoutSB
//
//  Created by Ick on 2020/09/18.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    let myPlayer = MyPlayer.shared
    
    var artworkImgView: UIImageView = {
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
    
    var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var timeSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addSubviewsToView()
        self.viewSetting()
        // Do any additional setup after loading the view.
    }
    
    func addSubviewsToView(){
        self.view.addSubview(self.artworkImgView)
        self.view.addSubview(self.artistNameLabel)
        self.view.addSubview(self.songNameLabel)
        self.view.addSubview(self.playButton)
        self.view.addSubview(self.timeSlider)
    }
    func viewSetting(){
        self.artworkImgViewSetting()
        self.songNameLabelSetting()
        self.artistNameLabelSetting()
        self.playButtonSetting()
        self.timeSliderSetting()
    }
    func artworkImgViewSetting(){
        self.artworkImgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.artworkImgView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        self.artworkImgView.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2).isActive = true
        self.artworkImgView.heightAnchor.constraint(equalTo: self.artworkImgView.widthAnchor).isActive = true
        
        self.artworkImgView.image = UIImage(named: "Aatrox.png")
        
    }
    func songNameLabelSetting(){
        self.songNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.songNameLabel.topAnchor.constraint(equalTo: self.artworkImgView.bottomAnchor, constant: 30).isActive = true
        self.songNameLabel.text = "노래이름"
        
    }
    func artistNameLabelSetting(){
        self.artistNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.artistNameLabel.topAnchor.constraint(equalTo: self.songNameLabel.bottomAnchor, constant: 10).isActive = true
        self.artistNameLabel.text = "가수이름"
    }
    func timeSliderSetting(){
        self.timeSlider.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.timeSlider.topAnchor.constraint(equalTo: self.artistNameLabel.bottomAnchor, constant: 50).isActive = true
        self.timeSlider.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15).isActive = true
        self.timeSlider.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
    }
    func playButtonSetting(){
        self.playButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.playButton.topAnchor.constraint(equalTo: self.timeSlider.bottomAnchor, constant: 20).isActive = true
        self.playButton.setImage(UIImage.init(systemName: "play.fill"), for: UIControl.State.normal)
        self.playButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.playButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
