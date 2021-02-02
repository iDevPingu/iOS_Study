//
//  ViewController.swift
//  MPRemoteCommandCenterPractice
//
//  Created by Ick on 2021/01/02.
//

import UIKit
import AVFoundation
import MediaPlayer

class AudioViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer!
    var session: AVAudioSession!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initPlayer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    @IBAction func touchUpPlayButton(_ sender: UIButton) {
        // 재생 합니다.
        self.play()
    }
    
    @IBAction func touchUpPauseButton(_ sender: UIButton) {
        // 재생을 멈춥니다.
        self.pause()
    }
    
    func play() {
        self.player.play()
        MPNowPlayingInfoCenter.default().nowPlayingInfo?[MPNowPlayingInfoPropertyPlaybackRate] = 1
    }
    func pause() {
        self.player.pause()
        MPNowPlayingInfoCenter.default().nowPlayingInfo?[MPNowPlayingInfoPropertyPlaybackRate] = 0
    }
    
    func initPlayer() {
        // Audio Session 설정
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options: [])
        } catch let error as NSError {
            print("audioSession 설정 오류 : \(error.localizedDescription)")
        }
        
        // 음악 파일 가져오기
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sample") else {
            print("음악 파일이 없습니다.")
            return
        }
        
        // audio player를 초기화합니다.
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
            self.player.play()
        } catch let error as NSError {
            print("플레이어 초기화 오류 발생 : \(error.localizedDescription)")
        }
        
        self.remoteCommandCenterSetting()
        self.remoteCommandInfoCenterSetting()
    }
    
    func remoteCommandCenterSetting() {
        // remote control event 받기 시작
        UIApplication.shared.beginReceivingRemoteControlEvents()
        let center = MPRemoteCommandCenter.shared()
        center.playCommand.removeTarget(nil)
        center.pauseCommand.removeTarget(nil)
        // 제어 센터 재생버튼 누르면 발생할 이벤트를 정의합니다.
        center.playCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            self.player.play()
            MPNowPlayingInfoCenter.default().nowPlayingInfo?[MPNowPlayingInfoPropertyElapsedPlaybackTime] = NSNumber(value: self.player.currentTime)
            // 재생 할 땐 now playing item의 rate를 1로 설정하여 시간이 흐르도록 합니다.
            MPNowPlayingInfoCenter.default().nowPlayingInfo?[MPNowPlayingInfoPropertyPlaybackRate] = 1
            return .success
        }
        
        // 제어 센터 pause 버튼 누르면 발생할 이벤트를 정의합니다.
        center.pauseCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            self.player.pause()
            MPNowPlayingInfoCenter.default().nowPlayingInfo?[MPNowPlayingInfoPropertyElapsedPlaybackTime] = NSNumber(value: self.player.currentTime)
            // 일시정지 할 땐 now playing item의 rate를 0으로 설정하여 시간이 흐르지 않도록 합니다.
            MPNowPlayingInfoCenter.default().nowPlayingInfo?[MPNowPlayingInfoPropertyPlaybackRate] = 0
            return .success
        }
        center.playCommand.isEnabled = true
        center.pauseCommand.isEnabled = true
    }
    
    func remoteCommandInfoCenterSetting() {
        let center = MPNowPlayingInfoCenter.default()
        var nowPlayingInfo = center.nowPlayingInfo ?? [String: Any]()
        
        nowPlayingInfo[MPMediaItemPropertyTitle] = "콘텐츠 제목"
        nowPlayingInfo[MPMediaItemPropertyArtist] = "콘텐츠 아티스트"
        if let albumCoverPage = UIImage(named: "Pingu") {
            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: albumCoverPage.size, requestHandler: { size in
                return albumCoverPage
            })
        }
        // 콘텐츠 총 길이
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = self.player.duration
        // 콘텐츠 재생 시간에 따른 progressBar 초기화
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = 1
        // 콘텐츠 현재 재생시간
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = NSNumber(value: self.player.currentTime)
        
        center.nowPlayingInfo = nowPlayingInfo
        
    }
    
    @IBAction func touchUpVideoButton(_ sender: UIButton) {
        // VideoViewController를 modal로 present 합니다.
        guard let videoVC = self.storyboard?.instantiateViewController(identifier: "videoView") as? VideoViewController else { return }
        videoVC.modalPresentationStyle = .fullScreen
        self.present(videoVC, animated: true, completion: nil)
    }
    
}

