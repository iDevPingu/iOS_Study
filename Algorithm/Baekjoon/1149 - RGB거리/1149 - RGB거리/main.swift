//
//  main.swift
//  1149 - RGB거리
//
//  Created by Ick on 2020/10/06.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let n = Int(String(readLine()!))!
    
    var house: [[Int]] = []
    for _ in 0..<n{
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        house.append(data)
    }
    
    var result: [[Int]] = [house[0]]
    
    for i in 1..<house.count {
        var temp: [Int] = []
        temp.append(min(result[i-1][1], result[i-1][2]) + house[i][0])
        temp.append(min(result[i-1][0], result[i-1][2]) + house[i][1])
        temp.append(min(result[i-1][0], result[i-1][1]) + house[i][2])
        result.append(temp)
    }
    
    print(result[result.count-1].min()!)
}

solution()
