//
//  main.swift
//  2565 - 전깃줄
//
//  Created by Ick on 2020/10/09.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int {
    let n = Int(String(readLine()!))!
    
    // 출발, 도착, 겹치는 수
    var lines: [(Int,Int)] = []
    
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map({Int(String($0))!})
        lines.append((line[0], line[1]))
    }
    if n == 1{
        return 0
    }
    
    lines.sort { (a, b) -> Bool in
        a.0 < b.0
    }
    print(lines)
    var dict: [Int : Int] = [:]
    var len: [Int] = []
    for i in 0..<lines.count {
        if dict.keys.contains(lines[i].1) {
            let now = dict[lines[i].1]!
            var length: Int = 0
            for j in dict.keys {
                if lines[i].1 > j {
                    if dict[j]! > length {
                        length = dict[j]!
                    }
                }
            }
            len.append(max(length + 1, now))
            dict[lines[i].1] = max(length + 1, now)
        } else {
            var length: Int = 0
            for j in dict.keys {
                if lines[i].1 > j {
                    if dict[j]! > length {
                        length = dict[j]!
                    }
                }
            }
            len.append(length + 1)
            dict[lines[i].1] = length + 1
        }
    }
    print(len)
    return n - len.max()!
}

print(solution())
