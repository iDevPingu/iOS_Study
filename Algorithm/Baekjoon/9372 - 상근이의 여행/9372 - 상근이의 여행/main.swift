//
//  main.swift
//  9372 - 상근이의 여행
//
//  Created by Ick on 2020/09/25.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let testCase = Int(readLine()!)!
    for _ in 0..<testCase{
        let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
        let n = firstLine[0]
        let m = firstLine[1]
        for _ in 0..<m{
            let _ = readLine()!.split(separator: " ").map({Int(String($0))!})
            
        }
        print(n-1)
    }
}

solution()
