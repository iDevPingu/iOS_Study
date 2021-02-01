//
//  main.swift
//  1167 - 트리의 지름
//
//  Created by Ick on 2020/09/29.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

//func solution(){
//    let v = Int(readLine()!)!
//    // 도착노드, 가중치 [[1번노드출발], [2번노드출발] ...]
//    var graph: [[(Int,Int)]] = [[(Int,Int)]](repeating: [], count: v+1)
//    for i in 1...v{
//        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
//        for j in 0..<(data.count/2 - 1){
//            graph[i].append((data[2*j + 1], data[2*j + 2]))
//        }
//    }
//    var visited: [Int] = [Int](repeating: 0, count: v+1)
//
//    func dfs(_ start: (Int,Int,Int)){
//        var stack: [(Int,Int,Int)] = [start]
//
//        while !stack.isEmpty {
//            let now = stack.popLast()!
//            if now.0 == now.1 {
//                for i in 0..<graph[now.1].count{
//                    stack.append((now.1, graph[now.1][i].0,graph[now.1][i].1))
//                }
//            } else {
//                if visited[now.1] == 0 {
//                    visited[now.1] = visited[now.0] + now.2
//                    for i in 0..<graph[now.1].count{
//                        stack.append((now.1, graph[now.1][i].0,graph[now.1][i].1))
//                    }
//                }
//            }
//        }
//    }
//
//    dfs((1,1,0))
//    visited[1] = 0
//
//    var max = visited.max()!
//    var edge = 0
//    for i in 0..<visited.count{
//        if visited[i] == max {
//            edge = i
//            break
//        }
//    }
//    visited = [Int](repeating: 0, count: v+1)
//
//    dfs((edge,edge,0))
//    visited[edge] = 0
//    max = visited.max()!
//    print(max)
//
//
//}
//solution()

//12
//1 2 3 3 2 -1
//2 1 3 4 5 -1
//3 1 2 5 11 6 9 -1
//4 2 5 7 1 8 7 -1
//5 3 11 9 15 10 4 -1
//6 3 9 12 10 11 6 -1
//7 4 1 -1
//8 4 7 -1
//9 5 15 -1
//10 5 4 -1
//11 6 6 -1
//12 6 10 -1

func solution(){
    let v = Int(readLine()!)!
    // (출발노드번호, 도착노드번호, 가중치)
    var graph: [[(Int,Int,Int)]] = [[(Int,Int,Int)]](repeating: [], count: v+1)
    
    for i in 1...v{
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        for j in 0..<(data.count/2 - 1){
            graph[i].append((i ,data[2*j + 1], data[2*j + 2]))
        }
    }
    var visited: [Int] = [Int](repeating: 0, count: v+1)
    print(graph)
    func dfs(_ start: (Int,Int,Int)){
        // 지금 도착 노드, 가중치
        var stack: [(Int,Int,Int)] = [start]
        while !stack.isEmpty {
            let now = stack.popLast()!
            if visited[now.1] == 0{
                // 현재 가중치
                visited[now.1] = visited[now.0] + now.2
                stack += graph[now.1]
            }
        }
    }
    
    dfs((1,1,0))
    visited[1] = 0
    let maxValue = visited.max()!
    var temp = 0
    
    for index in 0..<visited.count{
        if visited[index] == maxValue {
            temp = index
            break
        }
    }
    
    visited = [Int](repeating: 0, count: v+1)
    dfs((temp,temp,0))
    visited[temp] = 0
    print(visited.max()!)
}
solution()
