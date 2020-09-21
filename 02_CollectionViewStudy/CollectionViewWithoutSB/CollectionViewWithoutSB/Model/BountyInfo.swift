//
//  BountyInfo.swift
//  CollectionViewWithoutSB
//
//  Created by Ick on 2020/09/17.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

struct BountyInfo{
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(self.name).jpg")
    }
    
    init(name: String, bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}

