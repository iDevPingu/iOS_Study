//
//  main.swift
//  12865 - 평범한 배낭
//
//  Created by Ick on 2020/10/17.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let k = firstLine[1]
    
    var value: [(Int,Int)] = []
    
    for _ in 0..<n {
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        value.append((data[0],data[1]))
    }

    
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n)
    
    for i in 0..<n{
        for j in 1...k {
            // 첫 번째 물건 일 때
            if i == 0 {
                // 현재 고려하는 무게가 현재 무게 보다 크면 그냥 그 무게가 최대값
                if j >= value[i].0 {
                    dp[i][j] = value[i].1
                    
                }
            // 두 번째 물건 부터
            } else {
                if j < value[i].0 {
                    dp[i][j] = dp[i-1][j]
                // 현재 고려하는 무게가 현재 무게 보다 크면
                // max(현재 물건 가치 + (지금 고려하는 무게 - 현재 물건 무게)에서의 가치, 현재 까지 지금 무게에서의 최대값)
                } else {
                    dp[i][j] = max(dp[i-1][j], value[i].1 + dp[i-1][j-value[i].0])
                }
            }
        }
    }
    print(dp[n-1][k])
    
}
solution()
