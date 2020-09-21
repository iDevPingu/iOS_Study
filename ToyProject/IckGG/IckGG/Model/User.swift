//
//  User.swift
//  IckGG
//
//  Created by Ick on 2020/09/09.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation
struct APIResponse: Codable{
    let results: [User]
}
struct User: Codable {
    let leagueId: String
    let queueType: String
    let tier: String
    let rank: String
    let summonerId: String
    let summonerName: String
    let leaguePoints: Int
    let wins: Int
    let losses: Int
    let veteran: Bool
    let inactive: Bool
    let freshBlood: Bool
    let hotStreak: Bool
    var winsAndLosees: String{
        return "승 : " + String(self.wins) + " 패 : " + String(self.losses)
    }
}
