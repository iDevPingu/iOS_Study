//
//  main.swift
//  11047 - 동전 0
//
//  Created by Ick on 2020/08/26.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int {
    
    let temp = readLine()!.split(separator: " ").map({Int($0)!})
    let n = temp[0]
    var k = temp[1]
    
    var coins = [Int]()
    var result: Int = 0
    
    for _ in 0..<n{
        coins.append(Int(readLine()!)!)
    }
    
    coins = Array(coins.reversed())
    
    for value in coins{
        if value <= k{
            result += (k / value)
            k = (k % value)
        }
        if k == 0{
            break
        }
    }
    
    return result
}

print(solution())
