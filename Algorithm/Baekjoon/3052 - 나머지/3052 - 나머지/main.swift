//
//  main.swift
//  3052 - 나머지
//
//  Created by Ick on 2020/09/30.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    var list: [Int] = []
    for _ in 0..<10{
        let input = Int(readLine()!)!
        list.append(input)
    }
    for i in 0..<list.count{
        list[i] = list[i] % 42
    }
    
    print(Set(list).count)
}

solution()
