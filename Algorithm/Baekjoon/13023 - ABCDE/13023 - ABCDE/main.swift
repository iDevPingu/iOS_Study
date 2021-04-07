//
//  main.swift
//  13023 - ABCDE
//
//  Created by Ick on 2021/04/02.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0], m = firstLine[1]
    
    // 친구 관계 그래프
    var friendGraph: [[Int]] = [[Int]](repeating: [], count: n)
    
    var isAvailable: Bool = false
    for _ in 0..<m {
        let friend = readLine()!.split(separator: " ").map({Int(String($0))!})
        friendGraph[friend[0]].append(friend[1])
        friendGraph[friend[1]].append(friend[0])
    }
    
    var checked: [Bool] = [Bool](repeating: false, count: n)
    
    func dfs(_ now: Int, level: Int) {
        if isAvailable {
            return
        }
        if level == 4 {
            isAvailable = true
            return
        }
        checked[now] = true
        for i in 0..<friendGraph[now].count {
            let friend = friendGraph[now][i]
            if !checked[friend] {
                checked[friend] = true
                dfs(friend, level: level + 1)
                if isAvailable {
                    return
                }
                checked[friend] = false
            }
        }
        checked[now] = false
    }
    
    for i in 0..<n {
        dfs(i, level: 0)
        if isAvailable {
            break
        }
    }
    
    if isAvailable {
        print(1)
    } else {
        print(0)
    }
}
solution()
