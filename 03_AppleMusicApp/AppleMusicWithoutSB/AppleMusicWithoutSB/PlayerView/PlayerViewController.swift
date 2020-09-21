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
    var isSeeking: Bool = false
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
    var currentTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var totalDurationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var timeObserver: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.addSubviewsToView()
        self.viewSetting()
        // Do any additional setup after loading the view.
        // 타임 옵저버
        timeObserver = myPlayer.addPeriodcTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 10), queue: DispatchQueue.main, using: { (time) in
            self.updateTime()
        })
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateTintColor()
        self.updateTrackInfo()

        
        self.updateTime()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myPlayer.pause()
        self.myPlayer.replaceCurrentItem(with: nil)
    }
    func addSubviewsToView(){
        self.view.addSubview(self.artworkImgView)
        self.view.addSubview(self.artistNameLabel)
        self.view.addSubview(self.songNameLabel)
        self.view.addSubview(self.playButton)
        self.view.addSubview(self.timeSlider)
        self.view.addSubview(self.currentTimeLabel)
        self.view.addSubview(self.totalDurationLabel)
    }
    func viewSetting(){
        self.artworkImgViewSetting()
        self.songNameLabelSetting()
        self.artistNameLabelSetting()
        self.playButtonSetting()
        self.timeSliderSetting()
        self.currentTimeLabelSetting()
        self.totalDurationLabelSetting()
    }
    
    func updateTrackInfo(){
        guard let track = self.myPlayer.currentItem?.convertToTrack() else { return }
        self.artworkImgView.image = track.artwork
        self.songNameLabel.text = track.title
        self.artistNameLabel.text = track.artist
    }
    
    func updateTintColor() {
        self.playButton.tintColor = DefaultStyle.Colors.tint
        self.timeSlider.tintColor = DefaultStyle.Colors.tint
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
extension PlayerViewController {
    @objc func beginDrag(_ sender: UISlider){
        self.isSeeking = true
    }
    @objc func endDrag(_ sender: UISlider){
        self.isSeeking = false
    }
    @objc func seek(_ sender: UISlider){
        guard let currentItem = self.myPlayer.currentItem else { return }
        let position = Double(sender.value)
        let seconds = position * currentItem.duration.seconds
        let time = CMTime(seconds: seconds, preferredTimescale: 100)
        self.myPlayer.seek(to: time)
    }
    func updateTime(){
        self.currentTimeLabel.text = secondsToString(sec: self.myPlayer.currentTime)
        self.totalDurationLabel.text = secondsToString(sec: self.myPlayer.totalDurationTime)
        if isSeeking == false{
            self.timeSlider.value = Float(self.myPlayer.currentTime / self.myPlayer.totalDurationTime)
        }
    }
    func secondsToString(sec: Double) -> String{
        guard sec.isNaN == false else { return "00:00" }
        let totalSeconds = Int(sec)
        let min = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format:"%02d:%02d",min,seconds)
    }
}
extension PlayerViewController {
    @objc func touchUpPlayButton(_ sender: UIButton){
        if self.myPlayer.isPlaying {
            self.myPlayer.pause()
        } else {
            self.myPlayer.play()
        }
        self.updatePlayButton()
    }
    
    func updatePlayButton(){
        if self.myPlayer.isPlaying{
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "pause.fill",withConfiguration: configuration)
            self.playButton.setImage(image, for: .normal)
        } else {
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "play.fill",withConfiguration: configuration)
            self.playButton.setImage(image, for: .normal)
        }
    }
}

extension PlayerViewController{
    func artworkImgViewSetting(){
        self.artworkImgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.artworkImgView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        self.artworkImgView.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2).isActive = true
        self.artworkImgView.heightAnchor.constraint(equalTo: self.artworkImgView.widthAnchor).isActive = true
        
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
        
        self.timeSlider.addTarget(self, action: #selector(self.beginDrag(_:)), for: .touchDragEnter)
        self.timeSlider.addTarget(self, action: #selector(self.endDrag(_:)), for: .touchDragExit)
        self.timeSlider.addTarget(self, action: #selector(self.seek(_:)), for: .valueChanged)
    }
    func playButtonSetting(){
        self.playButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.playButton.topAnchor.constraint(equalTo: self.timeSlider.bottomAnchor, constant: 20).isActive = true
        let configuration = UIImage.SymbolConfiguration(pointSize: 40)
        self.playButton.setImage(UIImage.init(systemName: "play.fill",withConfiguration: configuration), for: UIControl.State.normal)
        self.playButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.playButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.playButton.addTarget(self, action: #selector(self.touchUpPlayButton(_:)), for: .touchUpInside)
    }
    func currentTimeLabelSetting(){
        self.currentTimeLabel.topAnchor.constraint(equalTo: self.timeSlider.bottomAnchor,constant: 5).isActive = true
        self.currentTimeLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
    }
    func totalDurationLabelSetting(){
        self.totalDurationLabel.topAnchor.constraint(equalTo: self.timeSlider.bottomAnchor, constant: 5).isActive = true
        self.totalDurationLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
    }

}
