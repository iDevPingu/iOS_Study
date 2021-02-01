//
//  main.swift
//  1463 - 1로 만들기
//
//  Created by Ick on 2020/10/08.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int{
    let n = Int(readLine()!)!
    if n == 1 {
        return 0
    } else if n == 2 {
        return 1
    } else if n == 3 {
        return 1
    } else {
        var dp: [Int] = [Int](repeating: 0, count: n+1)
        dp[1] = 0
        dp[2] = 1
        dp[3] = 1
        
        for i in 4...n{
            if i % 3 == 0 {
                dp[i] = min(dp[i-1] + 1, dp[i/3] + 1)
            } else if i % 2 == 0{
                dp[i] = min(dp[i-1] + 1, dp[i/2] + 1)
            } else {
                dp[i] = dp[i-1] + 1
            }
        }
        return dp[n]
    }
}

print(solution())
