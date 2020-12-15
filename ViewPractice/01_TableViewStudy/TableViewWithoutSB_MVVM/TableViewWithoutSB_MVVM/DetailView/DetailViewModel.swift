//
//  DetailViewModel.swift
//  TableViewWithoutSB_MVVM_version
//
//  Created by Ick on 2020/09/16.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

class DetailViewModel {
    
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?){
        bountyInfo = model
    }
}
