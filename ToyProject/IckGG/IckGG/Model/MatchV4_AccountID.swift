//
//  MatchV4_AccountID.swift
//  IckGG
//
//  Created by Ick on 2020/09/11.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

struct MatchlistDto: Codable{
    let startIndex: Int
    let totalGames: Int
    let endIndex: Int
    let matches: [MatchReferenceDto]
}

struct MatchReferenceDto: Codable{
    let gameId: CLong
    let role: String
    let season: Int
    let platformId: String
    let champion: Int
    let queue: Int
    let lane: String
    let timestamp: CLong
}

