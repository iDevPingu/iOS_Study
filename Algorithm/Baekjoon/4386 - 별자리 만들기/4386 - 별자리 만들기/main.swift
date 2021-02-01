//
//  main.swift
//  4386 - 별자리 만들기
//
//  Created by Ick on 2020/09/25.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    var stars: [[Double]] = [[Double]]()
    var parent = Array(0..<n)
    var distanceData: [(Int,Int,Double)] = []
    var lines: Int = 0
    var result: Double = 0
    
    func find(_ index : Int) -> Int{
        if parent[index] == index {
            return index
        } else {
            parent[index] = find(parent[index])
            return parent[index]
        }
    }
    
    func union(_ a: Int, _ b : Int){
        let p1 = find(a)
        let p2 = find(b)
        if p1 < p2 {
            parent[p2] = p1
        } else {
            parent[p1] = p2
        }
    }
    
    for _ in 0..<n {
        let starData = readLine()!.split(separator: " ").map({Double(String($0))!})
        stars.append(starData)
    }
    
    // 별 사이의 거리를 직접 구해준다.
    for i in 0..<stars.count{
        for j in i+1..<stars.count{
            let distance = sqrt(pow((stars[i][0] - stars[j][0]), 2) + pow((stars[i][1] - stars[j][1]),2))
            distanceData.append((i,j,distance))
        }
    }
    
    // 별 사이의 거리를 기준으로 오름차순 정렬한다.
    distanceData.sort { (a, b) -> Bool in
        return a.2 < b.2
    }
    
    // 크루스칼 알고리즘 수행
    for index in 0..<distanceData.count{
        if lines == n - 1{
            break
        }
        if find(distanceData[index].0) != find(distanceData[index].1){
            result += distanceData[index].2
            lines += 1
            union(distanceData[index].0, distanceData[index].1)
        }
    }
    
    print(round(result * 100) / 100)
    
}

solution()
