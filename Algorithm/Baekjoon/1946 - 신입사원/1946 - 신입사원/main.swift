//
//  main.swift
//  1946 - 신입사원
//
//  Created by Ick on 2020/08/27.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var result = [Int]()
    
    for _ in 0..<n {
        let temp = Int(readLine()!)!
        var people = [Int](repeating: 0, count: temp+1)
        var tempResult = 1
        for _ in 0..<temp {
            let person = readLine()!.split(separator: " ").map({Int(String($0))!})
            people[person[0]] = person[1]
        }

        var min: Int = people[1]
        for i in 1..<people.count {
            if min > people[i] {
                tempResult += 1
                min = people[i]
            }
        }
        result.append(tempResult)
    }
    for i in result {
        print(i)
    }
}
solution()
