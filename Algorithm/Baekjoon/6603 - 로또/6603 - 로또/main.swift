//
//  main.swift
//  6603 - 로또
//
//  Created by Ick on 2021/03/08.
//

import Foundation

func solution() {
    func dfs(_ numbers: [Int], _ now: [Int], _ index: Int) {
        if now.count == 6 {
            let str = now.map({String($0)})
            print(str.joined(separator: " "))
            return
        }
        for i in index+1..<numbers.count {
            dfs(numbers, now + [numbers[i]], i)
        }
    }
    while true {
        let input = readLine()!.split(separator: " ").map({Int(String($0))!})
        if input.count == 1 {
            break
        }
        let k = input[0]
        let numbers = Array(input[1...])
        
        for i in 0..<k {
            dfs(numbers, [numbers[i]], i)
        }
        
        print("")
    }
}
solution()
