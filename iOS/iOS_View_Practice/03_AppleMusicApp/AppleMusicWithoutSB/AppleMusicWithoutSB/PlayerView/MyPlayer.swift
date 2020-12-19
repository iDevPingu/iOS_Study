//
//  MyPlayer.swift
//  AppleMusicWithoutSB
//
//  Created by Ick on 2020/09/18.
//  Copyright © 2020 ick. All rights reserved.
//

import AVFoundation

// 싱글톤 만들기
// 하나만 있으면 될 것 같고 필요할 때마다 부르면 될 것 같은데..
// 클래스로 만들어서 참조만 하자
class MyPlayer {
    static let shared = MyPlayer()
    private let player = AVPlayer()
    
    var currentTime: Double {
        return self.player.currentItem?.currentTime().seconds ?? 0
    }
    
    var totalDurationTime: Double{
        return self.player.currentItem?.duration.seconds ?? 0
    }
    var isPlaying: Bool{
        return self.player.isPlaying
    }
    var currentItem: AVPlayerItem?{
        return self.player.currentItem
    }
    
    func pause(){
        self.player.pause()
    }
    func play(){
        self.player.play()
    }
    func seek(to time: CMTime){
        self.player.seek(to: time)
    }
    func replaceCurrentItem(with item: AVPlayerItem?){
        self.player.replaceCurrentItem(with: item)
    }
    func addPeriodcTimeObserver(forInterval: CMTime, queue: DispatchQueue?, using: @escaping (CMTime) -> Void){
        self.player.addPeriodicTimeObserver(forInterval: forInterval, queue: queue, using: using)
    }
}
