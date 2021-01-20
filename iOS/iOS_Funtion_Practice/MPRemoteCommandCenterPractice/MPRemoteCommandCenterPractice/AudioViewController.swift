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
        UIApplication.shared.beginReceivingRemoteControlEvents()
        self.remoteCommandCenterSetting()
        self.remoteCommandInfoCenterSetting()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.player.pause()
        UIApplication.shared.endReceivingRemoteControlEvents()
    }

    @IBAction func touchUpPlayButton(_ sender: UIButton) {
        // 재생 합니다.
        self.player.play()
        self.remoteCommandCenterSetting()
        self.remoteCommandInfoCenterSetting()
    }
    
    @IBAction func touchUpPauseButton(_ sender: UIButton) {
        // 재생을 멈춥니다.
        self.player.pause()
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
        
        // 제어 센터 재생버튼 누르면 발생할 이벤트를 정의합니다.
        center.playCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            self.player.play()
            return MPRemoteCommandHandlerStatus.success
        }
        // 제어 센터 pause 버튼 누르면 발생할 이벤트를 정의합니다.
        center.pauseCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            self.player.pause()
            return MPRemoteCommandHandlerStatus.success
        }
        
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
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = player.duration
        // 콘텐츠 재생 시간에 따른 progressBar 초기화
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = player.rate
        // 콘텐츠 현재 재생시간
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = player.currentTime
        
        center.nowPlayingInfo = nowPlayingInfo
        
    }
    
    @IBAction func touchUpVideoButton(_ sender: UIButton) {
        // VideoViewController를 modal로 present 합니다.
        guard let videoVC = self.storyboard?.instantiateViewController(identifier: "videoView") as? VideoViewController else { return }
        videoVC.modalPresentationStyle = .fullScreen
        self.present(videoVC, animated: true, completion: nil)
    }
    
}

