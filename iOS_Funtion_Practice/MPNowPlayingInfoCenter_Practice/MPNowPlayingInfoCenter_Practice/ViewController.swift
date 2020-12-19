//
//  ViewController.swift
//  MPNowPlayingInfoCenter_Practice
//
//  Created by Ick on 2020/12/16.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var player: AVAudioPlayer!
    var timer: Timer!
    var remoteCommandCenter = MPRemoteCommandCenter.shared()
    var session: AVAudioSession!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 외부 컨트롤러의 이벤트를 받기 시작
        UIApplication.shared.beginReceivingRemoteControlEvents()
        // 앱에서 공유되는 오디오세션 생성
        self.session = AVAudioSession.sharedInstance()
        
        // 백그라운드에서도 재생하도록 설정
        do {
            try self.session.setCategory(.playback, mode: .default, policy: .longFormAudio, options: [])
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
        self.remoteCommandCenter.playCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            self.player.prepareToPlay()
            self.player.play()
           return MPRemoteCommandHandlerStatus.success
        }
        self.remoteCommandCenter.pauseCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            self.player.pause()
           return MPRemoteCommandHandlerStatus.success
        }
        self.remoteCommandCenter.previousTrackCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            guard let soundAsset: NSDataAsset = NSDataAsset(name: "test") else {
                return MPRemoteCommandHandlerStatus.success
            }
            do {
                try self.player = AVAudioPlayer(data: soundAsset.data)
                self.player.delegate = self
                self.player.play()
            } catch let err {
                print(err.localizedDescription)
            }
            return MPRemoteCommandHandlerStatus.success
            
        }
        
        self.remoteCommandCenter.nextTrackCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            guard let soundAsset: NSDataAsset = NSDataAsset(name: "sample") else {
                return MPRemoteCommandHandlerStatus.success
            }
            do {
                try self.player = AVAudioPlayer(data: soundAsset.data)
                self.player.delegate = self
                self.player.play()
            } catch let err {
                print(err.localizedDescription)
            }
            return MPRemoteCommandHandlerStatus.success
            
        }

        initPlay()
    }
    
    @objc func remoteCommandCenterPauseCommandHandler() {
        self.player.pause()
    }
    @objc func remoteCommandCenterPlayCommandHandler() {
            
        self.player.play()
    }
    
    func updateInfoCenter() {
        var nowPlayingInfo = [String: Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = "Hello"
        if let image = UIImage(named: "핑구") {
            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size, requestHandler: { (size) -> UIImage in
                return image
            })
        }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    func initPlay() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sample") else {
            print("음원파일이없습니다")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
            self.player.play()
            print("play")
        } catch let error as NSError {
            print("오류발생 \(error.localizedDescription)")
        }
        self.updateInfoCenter()

    }

    @IBAction func touchUpPlayButton(_ sender: UIButton) {
        self.player.play()
    }
    
    @IBAction func touchUpPauseButton(_ sender: UIButton) {
        self.player.pause()
    }
}

