//
//  main.swift
//  2579 - 계단오르기
//
//  Created by Ick on 2020/10/08.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int {
    let n = Int(String(readLine()!))!
    var stairs: [Int] = []
    var value: [Int] = [Int](repeating: 0, count: n)
    
    for _ in 0..<n{
        stairs.append(Int(String(readLine()!))!)
    }

    if n == 1 {
        return stairs[0]
    } else if n == 2{
        return stairs[0] + stairs[1]
    } else if n == 3 {
        return max(stairs[0] + stairs[2], stairs[1] + stairs[2])
    } else {
        value[0] = stairs[0]
        value[1] = max(stairs[0] + stairs[1], stairs[1])
        value[2] = max(stairs[0] + stairs[2], stairs[1] + stairs[2])
        
        for i in 3..<stairs.count{
            value[i] = max(stairs[i] + value[i-2], stairs[i] + stairs[i-1] + value[i-3])
        }
        
        return value[value.count - 1]
    }
}

print(solution())
