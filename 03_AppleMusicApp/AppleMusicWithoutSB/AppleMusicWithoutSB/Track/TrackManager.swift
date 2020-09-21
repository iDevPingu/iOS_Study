//
//  TrackManager.swift
//  AppleMusicWithoutSB
//
//  Created by Ick on 2020/09/17.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit
import AVFoundation

class TrackManager{
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todayTrack: AVPlayerItem?
    
    init(){
        let tracks = loadTracks()
        self.tracks = tracks
        self.albums = loadAlbums(tracks: tracks)
        self.todayTrack = self.tracks.randomElement()
    }
    
    
    
    func loadTracks() -> [AVPlayerItem] {
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        
        let items = urls.map { url -> AVPlayerItem in
            return AVPlayerItem(url: url)
        }
        
        return items
    }
    
    func track(at index: Int) -> Track?{
        let playerItem = tracks[index]
        return playerItem.convertToTrack()
    }
    
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        let trackList: [Track] = tracks.compactMap { (item) -> Track in
            guard let result = item.convertToTrack() else { fatalError() }
            return result
        }
        let albumDics = Dictionary(grouping: trackList, by: { track in track.albumName})
        var albums: [Album] = []
        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }
        return albums
    }
    
    func loadOtherTodaysTrack(){
        self.todayTrack = self.tracks.randomElement()
    }
    
}
