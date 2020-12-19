//
//  BountyListViewModel.swift
//  CollectionViewWithoutSB
//
//  Created by Ick on 2020/09/17.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

class BountyListViewModel{
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "zoro", bounty: 120000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "franky", bounty: 44000000)
    ]
    
    var sortedList: [BountyInfo]{
        let sortedList = bountyInfoList.sorted { (prev, next) -> Bool in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}
