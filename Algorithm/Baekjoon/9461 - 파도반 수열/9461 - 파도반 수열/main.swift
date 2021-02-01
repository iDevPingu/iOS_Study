//
//  main.swift
//  9461 - 파도반 수열
//
//  Created by Ick on 2020/10/06.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() {
    let t = Int(readLine()!)!
    var testCase: [Int] = []
    for _ in 0..<t {
        testCase.append(Int(readLine()!)!)
    }
    
    var result = [1,1,1,2,2]
    
    for i in 0..<95 {
        result.append(result[i] + result[i+4])
    }
    
    for num in testCase {
        print(result[num - 1])
    }
    
}


solution()
