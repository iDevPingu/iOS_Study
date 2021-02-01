//
//  main.swift
//  11403 - 경로 찾기
//
//  Created by Ick on 2020/11/15.
//
// 플로이드 와샬
import Foundation

func solution() {
    let n = Int(readLine()!)!
    var graph: [[Int]] = []
    
    for _ in 0..<n {
        graph.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
}

solution()
