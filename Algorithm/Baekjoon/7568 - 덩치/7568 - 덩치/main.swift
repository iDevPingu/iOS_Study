//
//  main.swift
//  7568 - 덩치
//
//  Created by Ick on 2021/03/07.
//

import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    var people: [[Int]] = []
    var count: Int = 1
    var result: [String] = []
    
    for _ in 0..<n {
        people.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    for i in 0..<people.count {
        for j in 0..<people.count {
            if i == j {
                continue
            } else {
                if people[i][0] < people[j][0] && people[i][1] < people[j][1] {
                    count += 1
                }
            }
        }
        result.append(String(count))
        count = 1
    }
    
    print(result.joined(separator: " "))
}

solution()
