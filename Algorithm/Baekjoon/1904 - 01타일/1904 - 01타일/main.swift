//
//  main.swift
//  1904 - 01타일
//
//  Created by Ick on 2020/10/06.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

//func solution() -> Int {
//    let n = Int(readLine()!)!
//    var data: [Int] = [0,1,2]
//    if n == 1 {
//        return data[n]
//    } else if n == 2{
//        return data[n]
//    } else {
//        for i in 3...n{
//            data.append((data[i-1] + data[i-2]) % 15746)
//        }
//        return data[n]
//    }
//
//}

func solution() -> Int {
    let n = Int(readLine()!)!
    var first: Int = 1
    var second: Int = 2
    if n == 1 {
        return first
    } else if n == 2 {
        return second
    } else {
        var result: Int = 0
        for _ in 3...n{
            result = (first + second) % 15746
            first = second % 15746
            second = result
        }
        return result
    }
}

print(solution())
