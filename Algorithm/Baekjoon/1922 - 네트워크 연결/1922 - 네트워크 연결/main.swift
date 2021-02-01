//
//  main.swift
//  1922 - 네트워크 연결
//
//  Created by Ick on 2020/09/02.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    
    var networks: [[Int]] = []
    var result = 0
    var lineNumber = 0
    
    var networkTable: [Int] = []
    for i in 0...n{
        networkTable.append(i)
    }
    
    for _ in 0..<m{
        networks.append(readLine()!.split(separator: " ").map({Int($0)!}))
    }
    
    networks.sort { (a, b) -> Bool in
        a[2] < b[2]
    }
    
    for i in 0..<networks.count{
        if lineNumber == n-1 {
            return result
        }
        
        if !compareParents(networkTable, networks[i][0], networks[i][1]) {
            unionParents(&networkTable, networks[i][0], networks[i][1])
            lineNumber += 1
            result += networks[i][2]
            print("**\(networks[i][0]),\(networks[i][1])")
        }
    }
    
    
    return result
}

func unionParents(_ table: inout [Int], _ a: Int, _ b: Int) {
    let p1 = findParents(table, a)
    let p2 = findParents(table, b)
    if a < b{
        table[p2] = p1
    } else {
        table[p1] = p2
    }
    
}

func compareParents(_ table: [Int], _ a: Int, _ b: Int) -> Bool{
    if findParents(table, a) == findParents(table, b) {
        return true
    } else {
        return false
    }
}

func findParents(_ table: [Int], _ a: Int) -> Int{
    if table[a] == a {
        return a
    }
    
    return findParents(table, table[a])
}

print(solution())
