//
//  main.swift
//  1520 - 내리막 길
//
//  Created by Ick on 2020/10/19.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let m = firstLine[0]
    let n = firstLine[1]
    
    var graph: [[Int]] = []
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    
    for _ in 0..<m {
        graph.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    var stack: [(Int,Int)] = [(0,0)]
}

solution()
