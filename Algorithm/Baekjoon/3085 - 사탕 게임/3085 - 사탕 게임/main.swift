//
//  main.swift
//  3085 - 사탕 게임
//
//  Created by Ick on 2021/04/01.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var candys: [[String]] = []
    
    for _ in 0..<n {
        candys.append(readLine()!.map({String($0)}))
    }
    
    func swap(_ first: (Int, Int), _ second: (Int, Int)) {
        let temp = candys[first.0][first.1]
        candys[first.0][first.1] = candys[second.0][second.1]
        candys[second.0][second.1] = temp
    }
    func check() -> Int {
        var result: Int = 1
        var temp: Int = 1
        
        for i in 0..<n {
            temp = 1
            for j in 0..<n-1 {
                if candys[i][j] == candys[i][j+1] {
                    temp += 1
                } else {
                    result = max(result, temp)
                    temp = 1
                }
            }
            result = max(result, temp)
        }
        
        for i in 0..<n {
            temp = 1
            for j in 0..<n-1 {
                if candys[j][i] == candys[j+1][i] {
                    temp += 1
                } else {
                    result = max(result, temp)
                    temp = 1
                }
            }
            result = max(result, temp)
        }
        
        return result
    }
    
    var maxEat: Int = 1
    for i in 0..<n {
        for j in 0..<n-1 {
            swap((i,j), (i,j+1))
            maxEat = max(maxEat, check())
            swap((i,j), (i,j+1))
        }
    }
    for i in 0..<n-1 {
        for j in 0..<n {
            swap((i,j), (i+1,j))
            maxEat = max(maxEat, check())
            swap((i,j), (i+1,j))
        }
    }
    print(maxEat)
}
solution()
