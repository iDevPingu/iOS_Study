//
//  main.swift
//  11404 - 플로이드
//
//  Created by Ick on 2020/09/14.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let inf = 7777777777
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    
    var bus: [[Int]] = [[Int]](repeating: [Int](repeating: inf, count: n), count: n)
    
    for _ in 0..<m{
        let busData = readLine()!.split(separator: " ").map({Int($0)!})
        if bus[busData[0]-1][busData[1]-1] > busData[2]{
            bus[busData[0]-1][busData[1]-1] = busData[2]
        }
    }
    
    for i in 0..<bus.count{
        bus[i][i] = 0
    }
    
    for i in 0..<n{
        for j in 0..<n{
            if i == j {
                continue
            }
            for k in 0..<n{
                if j == k{
                    continue
                }
                let currentCost = bus[j][k]
                let newCost = bus[j][i] + bus[i][k]
                
                if currentCost > newCost{
                    bus[j][k] = newCost
                }
            }
        }
    }
    
    for i in 0..<n{
        for j in 0..<n{
            if bus[i][j] == inf{
                print(0,terminator: " ")
            }else {
                print(bus[i][j], terminator: " ")
            }
        }
        print("")
    }


}

solution()
