//
//  main.swift
//  14225 - 부분수열의 합
//
//  Created by Ick on 2021/04/05.
//

import Foundation

// My Solution
func solution() -> Int {
    let n = Int(String(readLine()!))!
    let s = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    let maxSum = s.reduce(0, +)
    var isAvailable = [Bool](repeating: false, count: maxSum + 1)
    var checked = [Bool](repeating: false, count: n)

    var stack: [Int] = []
    func dfs(count: Int, index: Int) {
        if stack.count == count {
            isAvailable[stack.reduce(0, +)] = true
            return
        }
        for i in index+1..<n {
            if !checked[i] {
                checked[i] = true
                stack.append(s[i])
                dfs(count: count, index: i)
                stack.removeLast()
                checked[i] = false
            }
        }
    }
    
    for count in 1...n {
        for index in 0..<n {
            checked[index] = true
            stack.append(s[index])
            dfs(count: count, index: index)
            stack.removeLast()
            checked[index] = false
        }
    }
    
    for answer in 1...maxSum {
        if !isAvailable[answer] {
            return answer
        }
    }
    return maxSum + 1
}

// Another Solution
func solution2() -> Int {
    let n = Int(String(readLine()!))!
    let s = readLine()!.split(separator: " ").map({Int(String($0))!})
    let maxSum = s.reduce(0, +)
    var isAvailable = [Bool](repeating: false, count: maxSum + 1)
    func dfs(index: Int, sum: Int) {
        if index == n {
            isAvailable[sum] = true
            return
        }
        dfs(index: index + 1, sum: sum + s[index])
        dfs(index: index + 1, sum: sum)
    }
    dfs(index: 0, sum: 0)
    
    for i in 1...maxSum {
        if !isAvailable[i] {
            return i
        }
    }
    return maxSum + 1
}

print(solution2())
