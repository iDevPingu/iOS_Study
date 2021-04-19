//
//  main.swift
//  11866 - 요세푸스 문제 0
//
//  Created by Ick on 2021/04/20.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0], k = firstLine[1]
    var result: [String] = []
    var people: [Int] = []
    
    for i in 1...n {
        people.append(i)
    }
    
    var index = 0
    while !people.isEmpty {
        index += k-1
        if index >= people.count {
            while index >= people.count {
                index -= people.count
            }
            result.append(String(people.remove(at: index)))
        } else {
            result.append(String(people.remove(at: index)))
        }
    }

    print("<" + result.joined(separator: ", ") + ">")
}
solution()
