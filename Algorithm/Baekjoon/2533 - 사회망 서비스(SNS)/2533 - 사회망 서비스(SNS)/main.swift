//
//  main.swift
//  2533 - 사회망 서비스(SNS)
//
//  Created by Ick on 2021/04/22.
//

import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    var friendMap: [Int: [Int]] = [:]
    
    for _ in 0..<n-1 {
        let friend = readLine()!.split(separator: " ").map({Int(String($0))!})
        var value = friendMap[friend[0], default: []]
        friendMap[friend[0]] = value + [friend[1]]
        
        value = friendMap[friend[1], default: []]
        friendMap[friend[1]] = value + [friend[0]]
    }
    
}
solution()
