//
//  main.swift
//  11660 - 구간 합 구하기 5
//
//  Created by Ick on 2021/03/08.
//

import Foundation

// Swift는 이 방법을 쓰려면 fread를 사용해야 한다.
// 이에 대해 공부하도록 합시다
// 이 방법 외에도 segment tree 방법이 있는데 이것 역시 공부하도록 합시다.
func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var table: [[Int]] = []
    var targets: [[Int]] = []
    for _ in 0..<n {
        table.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    for _ in 0..<m {
        targets.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for i in 0..<n {
        for j in 0..<n {
            if i == 0 && j == 0 {
                dp[i][j] = table[i][j]
            } else if i > 0 && j == 0 {
                dp[i][j] = dp[i-1][n-1] + table[i][j]
            } else {
                dp[i][j] = dp[i][j-1] + table[i][j]
            }
        }
    }
    
    for i in 0..<targets.count {
        let target = targets[i]
        let x1 = target[0] - 1
        let y1 = target[1] - 1
        let x2 = target[2] - 1
        let y2 = target[3] - 1
        var sum: Int = 0
        for y in y1...y2 {
            if x1 == 0 {
                if y == 0 {
                    sum += dp[0][x2]
                } else {
                    sum += (dp[y][x2] - dp[y - 1][x2])
                }
            } else {
                sum += (dp[y][x2] - dp[y][x1 - 1])
            }
        }
        print(sum)
    }
    
}

solution()
