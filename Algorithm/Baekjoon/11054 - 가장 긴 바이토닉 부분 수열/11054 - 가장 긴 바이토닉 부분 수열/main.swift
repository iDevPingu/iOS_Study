//
//  main.swift
//  11054 - 가장 긴 바이토닉 부분 수열
//
//  Created by Ick on 2020/10/09.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    var backResult: [Int:Int] = [:]
    var frontResult: [Int:Int] = [:]
    var backLength: [Int] = []
    var frontLength: [Int] = []
    

    // [1 2 2 1 3 3 4 5 2 1]
    // [1 5 2 1 4 3 3 3 2 1]
    
    for i in 0..<numbers.count {
        if frontResult.keys.contains(numbers[i]) {
            let now = frontResult[numbers[i]]!
            var length: Int = 0
            
            for j in frontResult.keys {
                if j < numbers[i] {
                    if frontResult[j]! > length {
                        length = frontResult[j]!
                    }
                }
            }
            frontLength.append(max(length + 1, now))
            frontResult[numbers[i]] = max(length + 1, now)
        } else {
            var length: Int = 0
            
            for j in frontResult.keys {
                if j < numbers[i] {
                    if frontResult[j]! > length {
                        length = frontResult[j]!
                    }
                }
            }
            frontLength.append(length + 1)
            frontResult[numbers[i]] = length + 1
        }
    }
    
    // 거꾸로 커지는 거 구하기
    for i in stride(from: numbers.count - 1, to: -1, by: -1) {
        if backResult.keys.contains(numbers[i]) {
            let now = backResult[numbers[i]]!
            var length: Int = 0
            
            for j in backResult.keys{
                if j < numbers[i] {
                    if backResult[j]! > length {
                        length = backResult[j]!
                    }
                }
            }
            backLength.append(max(length + 1, now))
            backResult[numbers[i]] = max(length + 1, now)
        } else {
            var length: Int = 0
            
            for j in backResult.keys {
                if j < numbers[i] {
                    if backResult[j]! > length {
                        length = backResult[j]!
                    }
                }
            }
            backLength.append(length + 1)
            backResult[numbers[i]] = length + 1
        }
    }
    
    backLength.reverse()
    var result: Int = 0
    
    for i in 0..<backLength.count {
        let now = backLength[i] + frontLength[i] - 1
        if now > result {
            result = now
        }
    }
    print(result)
}

solution()
