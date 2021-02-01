//
//  main.swift
//  1976 - 여행 가자
//
//  Created by Ick on 2020/09/21.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> String{
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    
    var data: [[Int]] = []
    for _ in 0..<n{
        let temp = readLine()!.split(separator: " ").map({Int($0)!})
        data.append(temp)
    }
    let lastLine = Array(Set(readLine()!.split(separator: " ").map({Int($0)!})))
    
    var parent: [Int] = Array(0...n)
    
    func find(index: Int) -> Int{
        if index == parent[index]{
            return index
        } else {
            parent[index] = find(index: parent[index])
            return parent[index]
        }
    }
    
    func union(a: Int, b: Int){
        let num1 = find(index: a)
        let num2 = find(index: b)
        if num1 == num2 { return }
        parent[num1] = parent[num2]
    }
    
    for i in 0..<n{
        for j in 0..<n{
            if data[i][j] == 1 {
                union(a: i+1, b: j+1)
                print(parent)
            }
        }
    }
    let tempParent = find(index: lastLine[0])
    for i in lastLine{
        if find(index: i) != tempParent {
            return "NO"
        }
    }
    return "YES"
    
}
print(solution())
