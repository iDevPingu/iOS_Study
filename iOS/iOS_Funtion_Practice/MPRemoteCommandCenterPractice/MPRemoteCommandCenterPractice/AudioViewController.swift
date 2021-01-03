//
//  ViewController.swift
//  MPRemoteCommandCenterPractice
//
//  Created by Ick on 2021/01/02.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer!
    var session: AVAudioSession!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initPlayer()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.player.pause()
    }

    @IBAction func touchUpPlayButton(_ sender: UIButton) {
        // 재생 합니다.
        self.player.play()
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
    }
    
    @IBAction func touchUpVideoButton(_ sender: UIButton) {
        // VideoViewController를 modal로 present 합니다.
        guard let videoVC = self.storyboard?.instantiateViewController(identifier: "videoView") as? VideoViewController else { return }
        videoVC.modalPresentationStyle = .fullScreen
        self.present(videoVC, animated: true, completion: nil)
    }
    
}

