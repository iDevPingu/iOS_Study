//
//  Track.swift
//  AppleMusicWithoutSB
//
//  Created by Ick on 2020/09/17.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

struct Track{
    let title: String
    let artist: String
    let albumName: String
    let artwork: UIImage
    
    init(title: String, artist: String, albumName: String, artwork: UIImage){
        self.title = title
        self.artist = artist
        self.albumName = albumName
        self.artwork = artwork
    }
}
