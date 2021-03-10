//
//  main.swift
//  2616 - 소형기관차
//
//  Created by Ick on 2021/03/08.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var customerSum: [Int] = [0]
    
    let _ = readLine()!.split(separator: " ").map { (num) in
        customerSum.append(Int(num)! + customerSum.last!)
    }
    let k = Int(readLine()!)!
    
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: 4)
    var result: Int = 0
    for i in 1...3 {
        for j in i*k...n {
            if i == 1 {
                dp[i][j] = max(dp[i][j-1], customerSum[j] - customerSum[j-k])
            } else {
                dp[i][j] = max(dp[i][j-1], dp[i-1][j-k] + customerSum[j] - customerSum[j-k])
            }
            result = max(result, dp[i][j])
        }
    }
    print(result)
}
solution()

/* example
7
35 40 50 10 30 45 60
2
 
 answer = 240
 */
