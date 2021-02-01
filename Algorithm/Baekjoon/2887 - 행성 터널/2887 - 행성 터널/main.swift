//
//  main.swift
//  2887 - 행성 터널
//
//  Created by Ick on 2020/09/26.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    var parent = Array(0..<n)
    var planets: [[Int]] = []
    var distanceData: [(Int,Int,Int)] = []
    var lines: Int = 0
    var result: Int = 0
    
    func find(_ index: Int) -> Int{
        if parent[index] == index{
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
    
    for i in 0..<n{
        var data = readLine()!.split(separator: " ").map({Int(String($0))!})
        data.append(i)
        planets.append(data)
    }
    
    // x값 기준 정렬
    planets.sort { (a, b) -> Bool in
        return a[0] < b[0]
    }
    
    for i in 0..<planets.count-1{
        // 행성번호1, 행성번호2, 가중치
        distanceData.append((planets[i][3],planets[i+1][3],abs(planets[i][0]-planets[i+1][0])))
    }
    
    // y값 기준 정렬
    planets.sort { (a, b) -> Bool in
        return a[1] < b[1]
    }
    
    for i in 0..<planets.count-1{
        // 행성번호1, 행성번호2, 가중치
        distanceData.append((planets[i][3],planets[i+1][3],abs(planets[i][1]-planets[i+1][1])))
    }
    
    // z값 기준 정렬
    planets.sort { (a, b) -> Bool in
        return a[2] < b[2]
    }
    
    for i in 0..<planets.count-1{
        // 행성번호1, 행성번호2, 가중치
        distanceData.append((planets[i][3],planets[i+1][3],abs(planets[i][2]-planets[i+1][2])))
    }
    
    // 추가된 가중치들을 기준으로 정렬
    distanceData.sort { (a, b) -> Bool in
        return a.2 < b.2
    }
    
    // 크루스칼 알고리즘 진행
    for i in 0..<distanceData.count{
        if lines == n-1 {
            break
        }
        if find(distanceData[i].0) != find(distanceData[i].1) {
            lines += 1
            result += distanceData[i].2
            union(distanceData[i].0, distanceData[i].1)
        }
    }
    print(result)
    
}

solution()
