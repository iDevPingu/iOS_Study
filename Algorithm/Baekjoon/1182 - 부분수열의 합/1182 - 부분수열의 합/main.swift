//
//  main.swift
//  1182 - 부분수열의 합
//
//  Created by Ick on 2021/03/08.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let s = firstLine[1]
    let numbers = readLine()!.split(separator: " ").map({Int(String($0))!})
    var result: Int = 0
    func dfs(_ sum: Int, _ count: Int, _ index: Int) {
        if sum == s {
            result += 1
        }
        if count == n {
            return
        }
        for i in index+1..<n {
            dfs(sum + numbers[i], count + 1, i)
        }
    }
    
    for i in 0..<n{
        dfs(numbers[i], 1, i)
    }
    print(result)
}

solution()
