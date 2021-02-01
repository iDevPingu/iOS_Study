//
//  main.swift
//  2577 - 숫자의 개수
//
//  Created by Ick on 2020/09/30.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let a = Int(readLine()!)!
    let b = Int(readLine()!)!
    let c = Int(readLine()!)!
    
    let multiplyResult = String(a*b*c)
    let list = multiplyResult.map({Int(String($0))!})
    for i in 0..<10{
        var count: Int = 0
        for j in list {
            if i == j {
                count += 1
            }
        }
        print(count)
    }
}

solution()
