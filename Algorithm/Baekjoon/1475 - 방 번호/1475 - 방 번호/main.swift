//
//  main.swift
//  1475 - 방 번호
//
//  Created by Ick on 2021/03/07.
//

import Foundation

func solution() {
    var n = readLine()!.map({Int(String($0))!})
    var numbers: [Int: Int] = [:]
    var count: Int = 0
    // 9는 6이랑 같기 때문에 따로 필요 없음
    for i in 0...8 {
        numbers[i] = 0
    }
    while !n.isEmpty {
        count += 1
        for i in 0...8 {
            if i == 6 {
                numbers[i]! += 2
            } else {
                numbers[i]! += 1
            }
        }
        while !n.isEmpty {
            let last = n.popLast()!
            if last == 9 {
                if numbers[6]! == 0 {
                    n.append(last)
                    break
                } else {
                    numbers[6]! -= 1
                }
            } else {
                if numbers[last]! == 0 {
                    n.append(last)
                    break
                } else {
                    numbers[last]! -= 1
                }
            }
        }
    }
    print(count)
}

solution()
