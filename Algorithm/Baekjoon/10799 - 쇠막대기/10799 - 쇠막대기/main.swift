//
//  main.swift
//  10799 - 쇠막대기
//
//  Created by Ick on 2020/11/16.
//

import Foundation

func solution() {
    let input = Array(readLine()!)
    var lazerPoint: [(Int,Int)] = []
    var bar: [(Int,Int)] = []
    var stack: [Int] = []
    for i in 0..<input.count {
        if input[i] == "(" {
            stack.append(i)
        } else if input[i] == ")" {
            guard let temp = stack.popLast() else { fatalError() }
            if i - temp == 1 {
                lazerPoint.append((temp,i))
            } else {
                bar.append((temp, i))
            }
        }
    }

    bar.sort { (a, b) -> Bool in
        return a.0 < b.0
    }
    var result: Int = bar.count
    lazerPoint.sort { (a, b) -> Bool in
        return a.0 < b.0
    }

    for i in 0..<lazerPoint.count {
        for j in 0..<bar.count {
            if lazerPoint[i].1 < bar[j].0 {
                break
            } else if lazerPoint[i].0 > bar[j].0 && lazerPoint[i].1 < bar[j].1 {
                result += 1
            }
        }
    }
    print(result)
}

solution()
