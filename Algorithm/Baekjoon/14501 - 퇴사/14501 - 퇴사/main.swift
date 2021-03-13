//
//  main.swift
//  14501 - 퇴사
//
//  Created by Ick on 2021/03/14.
//

import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    var counsle: [[Int]] = []
    for _ in 0..<n {
        counsle.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    var dp: [Int] = [Int](repeating: 0, count: n+1)
    
    var nextJob: [Int] = [Int](repeating: 0, count: n+1)
    for i in 0..<n {
        nextJob[i] = i + counsle[i][0]
    }
    
    for i in 0..<n {
        if nextJob[i] > n {
            continue
        }
        for j in nextJob[i]...n {
            dp[j] = max(dp[j], dp[i] + counsle[i][1])
        }
    }
    
    print(dp.max()!)
}
solution()
