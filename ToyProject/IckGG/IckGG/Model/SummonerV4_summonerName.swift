//
//  SummonerV4_summonerName.swift
//  IckGG
//
//  Created by Ick on 2020/09/09.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

struct SummonerDTO: Codable{
    let accountId: String
    let profileIconId: Int
    let revisionDate: CLong
    let name: String
    let id: String
    let puuid: String
    let summonerLevel: CLong
}
