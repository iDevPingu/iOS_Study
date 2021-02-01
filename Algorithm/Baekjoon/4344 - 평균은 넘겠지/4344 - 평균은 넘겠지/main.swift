//
//  main.swift
//  4344 - 평균은 넘겠지
//
//  Created by Ick on 2020/10/01.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let c = Int(readLine()!)!
    for _ in 0..<c{
        let line = readLine()!.split(separator: " ").map({Double(String($0))!})
        var sum: Double = 0
        for i in 1..<line.count{
            sum += line[i]
        }
        sum = sum / line[0]
        
        var count: Double = 0
        
        for i in 1..<line.count{
            if line[i] > sum {
                count += 1
            }
        }
        print(String(format: "%.3f", round(count * 100 * 1000 / line[0]) / 1000)+"%")
    }
}
solution()
