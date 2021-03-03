//
//  main.swift
//  2740 - 행렬곱셈
//
//  Created by Ick on 2021/03/03.
//

import Foundation

func solution() {
    var a: [[Int]] = []
    var b: [[Int]] = []
    
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    for _ in 0..<firstLine[0] {
        a.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }

    let secondLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    for _ in 0..<secondLine[0] {
        b.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }

    var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: secondLine[1]), count: firstLine[0])
    
    for i in 0..<firstLine[0] {
        for j in 0..<secondLine[1] {
            for k in 0..<firstLine[1] {
                result[i][j] += (a[i][k] * b[k][j])
            }
        }
    }
    for i in 0..<result.count {
        var temp: String = ""
        for j in 0..<result[i].count {
            temp += "\(result[i][j]) "
        }
        print(temp)
    }
}

solution()
