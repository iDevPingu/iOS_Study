//
//  main.swift
//  15650 - N과 M(2)
//
//  Created by Ick on 2020/10/20.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var result: [Int] = []
    
    func dfs() {
        if result.count == m {
            var temp: String = ""
            for i in result {
                temp += "\(i) "
            }
            print(temp)
            return
        }
        for i in 1...n{
            if result.contains(i) {
                continue
            }
            if result.count == 0 {
                result.append(i)
            } else {
                if result[result.count - 1] >= i {
                    continue
                } else {
                    result.append(i)
                }
            }
            dfs()
            let _ = result.popLast()
        }
    }
    dfs()
}
solution()
