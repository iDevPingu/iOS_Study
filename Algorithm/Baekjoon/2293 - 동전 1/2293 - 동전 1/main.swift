//
//  main.swift
//  2293 - 동전 1
//
//  Created by Ick on 2020/10/18.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let k = firstLine[1]
    
    var coins: [Int] = [Int](repeating: 0, count: 101)
    
    for i in 0..<n{
        coins[i] = Int(readLine()!)!
    }
    
    var dp: [Int] = [Int](repeating: 0, count: 10001)
    dp[0] = 1
    for i in 0..<n {
        if coins[i] > k {
            continue
        } else {
            for j in coins[i]...k {
                dp[j] += dp[j-coins[i]]
                if dp[j] > Int(pow(2.0, 31.0)){
                    dp[j] = 0
                }
            }
        }
    }
    print(dp[k])
}

solution()
