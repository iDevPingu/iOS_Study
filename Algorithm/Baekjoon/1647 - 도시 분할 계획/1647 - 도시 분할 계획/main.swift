//
//  main.swift
//  1647 - 도시 분할 계획
//
//  Created by Ick on 2020/09/02.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func findParents(_ table: [Int], _ child: Int) -> Int{
    
    if table[child] == child {
        return child
    }
    
    return findParents(table, table[child])
}

func compareParents(_ table: [Int], _ child1: Int, _ child2: Int) -> Bool {
    
    if findParents(table, child1) == findParents(table, child2) {
        return true
    }
    
    return false
}

func unionParents(_ table: inout [Int], _ child1: Int, _ child2 : Int) {
    let parent1 = findParents(table, child1)
    let parent2 = findParents(table, child2)
    
    if child1 < child2 {
        table[parent2] = parent1
    } else {
        table[parent1] = parent2
    }
}

func solution() -> Int {
    var result = 0
    
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var loads = [[Int]]()
    var loadCount = 0
    var loadTable = [Int]()
    for i in 0...n{
        loadTable.append(i)
    }
    
    for _ in 0..<m{
        loads.append(readLine()!.split(separator: " ").map({Int($0)!}))
    }
    
    loads.sort { (a, b) -> Bool in
        a[2] < b[2]
    }
    
    for load in loads{
        if loadCount == n - 1{
            return result
        }
        
        if !compareParents(loadTable, load[0], load[1]) {
            result += load[2]
            loadCount += 1
            unionParents(&loadTable, load[0], load[1])
        }
    }
    
    return result
}

print(solution())
