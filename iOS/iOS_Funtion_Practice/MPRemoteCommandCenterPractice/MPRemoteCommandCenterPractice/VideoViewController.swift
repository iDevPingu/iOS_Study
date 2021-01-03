//
//  VideoViewController.swift
//  MPRemoteCommandCenterPractice
//
//  Created by Ick on 2021/01/03.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer


class VideoViewController: UIViewController {

    @IBOutlet var videoView: UIView!
    var videoPlayer: AVPlayer!
    var videoPlayerViewController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeVideoView()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.videoPlayer.pause()
        print("disappear")
    }


    func makeVideoView() {
        
        
        guard let url = URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4") else {
            print("url 오류")
            return
        }
        // video 플레이어를 초기화 합니다.
        self.videoPlayer = AVPlayer(url: url)
        
        // AVPlayerViewController를 초기화합니다.
        self.videoPlayerViewController = AVPlayerViewController()
        // playerViewController의 플레이어를 아까 만든 videoPlayer로 설정합니다.
        self.videoPlayerViewController.player = self.videoPlayer
        // playerViewController의 view를 알맞게 만듭니다.
        self.videoPlayerViewController.view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        self.videoView.addSubview(self.videoPlayerViewController.view)
        self.videoPlayerViewController.player?.play()
        
        self.setRemoteCommandCenter()
    }
    
    func setRemoteCommandCenter() {
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        let remoteCommandCenter = MPRemoteCommandCenter.shared()
        remoteCommandCenter.playCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            self.videoPlayer.play()
            return MPRemoteCommandHandlerStatus.success
        }
        
        remoteCommandCenter.pauseCommand.addTarget { (commandEvent) -> MPRemoteCommandHandlerStatus in
            self.videoPlayer.pause()
            return MPRemoteCommandHandlerStatus.success
        }
    }
    
    @IBAction func touchUpBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


