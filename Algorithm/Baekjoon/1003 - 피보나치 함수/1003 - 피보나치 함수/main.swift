//
//  main.swift
//  1003 - 피보나치 함수
//
//  Created by Ick on 2020/10/06.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let t = Int(String(readLine()!))!
    var test: [Int] = []
    
    for _ in 0..<t {
        test.append(Int(String(readLine()!))!)
    }
    
    var result: [(Int,Int)] = [(Int,Int)](repeating: (0,0), count: 41)
    result[0] = (1,0)
    result[1] = (0,1)
    
    for i in 2..<result.count{
        result[i] = (result[i-1].0 + result[i-2].0, result[i-1].1 + result[i-2].1)
    }
    print(result)
    for num in test {
        print("\(result[num].0) \(result[num].1)")
    }
}

solution()
