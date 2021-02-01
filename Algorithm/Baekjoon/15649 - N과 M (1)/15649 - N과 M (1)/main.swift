//
//  main.swift
//  15649 - N과 M (1)
//
//  Created by Ick on 2020/10/20.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0] // 1~n까지의 자연수
    let m = firstLine[1] // 에서 중복 없이 M개를 고르세요
    
    var result: [String] = []
    
    func dfs() {
        if result.count == m {
            print(result.joined(separator: " "))
            return
        }
        
        for i in 1...n {
            if result.contains(String(i)) {
                continue
            }
            result.append(String(i))
            dfs()
            let _ = result.popLast()
        }
    }
    
    dfs()
}

solution()
