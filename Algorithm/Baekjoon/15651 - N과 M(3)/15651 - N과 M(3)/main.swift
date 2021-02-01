//
//  main.swift
//  15651 - N과 M(3)
//
//  Created by Ick on 2020/10/22.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var result: [String] = []
    
    func dfs() {
        if result.count == m {
            print(result.joined(separator: " "))
            return
        }
        for i in 1...n {
            result.append(String(i))
            dfs()
            _ = result.popLast()!
        }
    }
    dfs()
    
}
solution()
