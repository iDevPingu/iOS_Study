//
//  main.swift
//  2583 - 영역 구하기
//
//  Created by Ick on 2020/11/11.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let m = firstLine[0]
    let n = firstLine[1]
    let k = firstLine[2]
    
    // m*n 크기의 종이를 나타낼 2차원 배열
    var paper: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    
    // 사각형 들의 꼭지점을 저장할 배열
    var rectPoints: [[Int]] = []
    for _ in 0..<k {
        rectPoints.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    // 사각형들의 꼭지점들로 paper에 사각형들을 적용
    for i in 0..<rectPoints.count {
        let leftPoint = (rectPoints[i][0],rectPoints[i][1])
        let rightPoint = (rectPoints[i][2],rectPoints[i][3])
        
        for j in leftPoint.0..<rightPoint.0 {
            for k in leftPoint.1..<rightPoint.1{
                paper[k][j] = 1
            }
        }
    }
    
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    var result: [Int] = []
    var count: Int = 0
    
    // dfs
    func dfs(_ x: Int, _ y: Int) {
        for i in 0..<dx.count {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx > n-1 || ny > m-1 {
                continue
            } else {
                if paper[ny][nx] == 0 {
                    paper[ny][nx] = 1
                    count += 1
                    dfs(nx,ny)
                }
            }
        }
    }
    
    // paper 배열의 0,0 부터 탐색
    for i in 0..<m {
        for j in 0..<n {
            if paper[i][j] == 0 {
                paper[i][j] = 1
                count += 1
                dfs(j,i)
                result.append(count)
                count = 0
            }
        }
    }
    
    result.sort()
    print(result.count)
    var resultString: String = ""
    for i in result {
        resultString += "\(i) "
    }
    print(resultString)
}
solution()

