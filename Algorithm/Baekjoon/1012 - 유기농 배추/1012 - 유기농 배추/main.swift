//
//  main.swift
//  1012 - 유기농 배추
//
//  Created by Ick on 2020/09/05.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() {
    let t = Int(readLine()!)!
    
    
    var result = [Int]()
    let dx = [0,0,-1,1] // 상하좌우
    let dy = [-1,1,0,0] // 상하좌우
    
    for _ in 0..<t{
        let secondLine = readLine()!.split(separator: " ").map({Int($0)!})
        let m = secondLine[0]
        let n = secondLine[1]
        let k = secondLine[2]
        // 배추밭을 표현하는 테이블 생성
        var bachuTable = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        // 방문 여부 저장하는 테이블 생성
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        
        // 배추 심긴 정보 테이블에 적용
        for _ in 0..<k{
            let temp = readLine()!.split(separator: " ").map({Int($0)!})
            bachuTable[temp[1]][temp[0]] = 1
        }
        // 그룹의 갯수를 셀 변수
        var count = 0
        for i in 0..<n{
            for j in 0..<m{
                // 만약 배추가 심겨져 있고 방문하지 않은 노드라면
                if bachuTable[i][j] == 1 && !visited[i][j]{
                    var stack:[[Int]] = [[i,j]]
                    // dfs실행
                    while stack.count != 0{
                        
                        guard let now = stack.popLast() else { fatalError() }
                        if !visited[now[0]][now[1]] {
                            visited[now[0]][now[1]] = true
                            for d in 0..<dx.count{
                                let nowx = now[1] - dx[d]
                                let nowy = now[0] - dy[d]
                                
                                if nowx < 0 || nowx > m-1 || nowy < 0 || nowy > n-1{
                                    continue
                                } else {
                                    if bachuTable[nowy][nowx] == 1{
                                        stack.append([nowy,nowx])
                                    }
                                }
                            }
                        }
                    }
                    count += 1
                }
            }
        }
        result.append(count)
    }
    
    for i in result{
        print(i)
    }

}
solution()
