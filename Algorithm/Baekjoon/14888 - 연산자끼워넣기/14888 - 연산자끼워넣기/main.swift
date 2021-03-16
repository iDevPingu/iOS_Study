//
//  main.swift
//  14888 - 연산자끼워넣기
//
//  Created by Ick on 2021/03/15.
//

import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    let a = readLine()!.split(separator: " ").map({Int(String($0))!})
    // +, -, x, ÷
    var operators = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    var maxValue: Int = -1000000001
    var minValue: Int = 1000000001
    
    func dfs(_ index: Int, _ now: Int) {
        if index == n {
            maxValue = max(now, maxValue)
            minValue = min(now, minValue)
            return
        }
        for i in 0..<4 {
            switch i {
            case 0:
                if operators[i] != 0 {
                    operators[i] -= 1
                    dfs(index + 1, now + a[index])
                    operators[i] += 1
                }
            case 1:
                if operators[i] != 0 {
                    operators[i] -= 1
                    dfs(index + 1, now - a[index])
                    operators[i] += 1
                }
            case 2:
                if operators[i] != 0 {
                    operators[i] -= 1
                    dfs(index + 1, now * a[index])
                    operators[i] += 1
                }
            case 3:
                if operators[i] != 0 {
                    operators[i] -= 1
                    dfs(index + 1, now / a[index])
                    operators[i] += 1
                }
            default:
                continue
            }
        }
    }
    dfs(1, a[0])
    print(maxValue)
    print(minValue)
}
solution()
