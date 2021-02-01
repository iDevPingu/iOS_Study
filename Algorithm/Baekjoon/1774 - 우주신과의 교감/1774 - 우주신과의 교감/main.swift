//
//  main.swift
//  1774 - 우주신과의 교감
//
//  Created by Ick on 2020/09/25.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var parent = Array(0...n)
    var lines: Int = 0
    var result: Double = 0
    var edges: [[Double]] = [[0,0]]
    var distanceData: [(Int,Int,Double)] = []
    
    func find(_ index: Int) -> Int {
        if parent[index] == index {
            return index
        } else {
            parent[index] = find(parent[index])
            return parent[index]
        }
    }
    
    func union(_ a: Int, _ b: Int){
        let p1 = find(a)
        let p2 = find(b)
        if p1 < p2 {
            parent[p2] = p1
        } else {
            parent[p1] = p2
        }
    }
    
    for _ in 0..<n{
        let data = readLine()!.split(separator: " ").map({Double(String($0))!})
        edges.append(data)
    }
    // 미리 연결된 것들을 미리 처리한다.
    for _ in 0..<m{
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        lines += 1
        union(data[0],data[1])
    }
    
    // 점들간의 거리를 구한다
    for i in 1..<edges.count{
        for j in i+1..<edges.count{
            let distance = sqrt(pow(edges[i][0] - edges[j][0], 2) + pow(edges[i][1] - edges[j][1], 2))
            distanceData.append((i,j,distance))
        }
    }
    // 정렬
    distanceData.sort { (a, b) -> Bool in
        return a.2 < b.2
    }
    
    // 크루스칼 알고리즘 수행
    for i in 0..<distanceData.count{
        if lines == n-1{
            break
        }
        if find(distanceData[i].0) != find(distanceData[i].1){
            result += distanceData[i].2
            lines += 1
            union(distanceData[i].0, distanceData[i].1)
        }
    }
    print(String(format: "%.2f", result))
}

solution()
