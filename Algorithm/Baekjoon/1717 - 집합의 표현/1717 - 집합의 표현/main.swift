//
//  main.swift
//  1717 - 집합의 표현
//
//  Created by Ick on 2020/09/21.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var parent = Array(0...n)
    
    func getParent(index: Int) -> Int{
        if parent[index] == index {
            return index
        } else {
            
            parent[index] = getParent(index: parent[index])
            return parent[index]
        }
    }
    
    func unionParent(a: Int, b: Int){
        let num1 = getParent(index: a)
        let num2 = getParent(index: b)
//        if num1 == num2 { return }
//        parent[num1] = parent[num2]
        if num1 < num2 {
            parent[num2] = parent[num1]
        } else {
            parent[num1] = parent[num2]
        }
    }

    for _ in 0..<m{
        let data = readLine()!.split(separator: " ").map({Int($0)!})
        if data[0] == 0{
            unionParent(a: data[1], b: data[2])
        } else if data[0] == 1{
            if data[1] == data[2] {
                print("YES")
                continue
            } else {
                if getParent(index: data[1]) == getParent(index: data[2]){
                    print("YES")
                } else {
                    print("NO")
                }
            }
        }
    }
}

solution()

// 부모 노드를 찾는 함수
func getParent(_ array: [Int], _ index: Int) -> Int{
    
    if array[index] == index {
        return index
    }
    return getParent(array, array[index])
}

// 부모 노드를 합치는 함수
func unionParent( _ array: inout [Int], _ a: Int, _ b: Int) {
    let num1 = getParent(array, a)
    let num2 = getParent(array, b)
    if a < b {
        array[num2] = num1
    } else {
        array[num1] = num2
    }
}

