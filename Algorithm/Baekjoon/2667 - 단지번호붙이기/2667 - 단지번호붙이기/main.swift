////
////  main.swift
////  2667 - 단지번호붙이기
////
////  Created by Ick on 2020/09/05.
////  Copyright © 2020 ick. All rights reserved.
////
//

func solution() {
    guard let n = readLine().map({Int($0)!}) else {return}
    
    var map = [[Character]](repeating: [Character](), count: n)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var count = 0
    var result = [Int]()
    var nextRow = [-1, 0, 1, 0]
    var nextCol = [0, 1, 0, -1]
    
    for i in 0..<n {
        let inputs = readLine()!
        for s in inputs {
            map[i].append(s)
        }
    }
    
    func dfs(row currentRow: Int, col currentCol: Int) {
        if visited[currentRow][currentCol] {
            return
        }
        
        visited[currentRow][currentCol] = true
        
        if map[currentRow][currentCol] == "1" {
            count += 1
            for i in 0..<4 {
                let nextR = currentRow + nextRow[i]
                let nextC = currentCol + nextCol[i]
                if nextR >= 0 && nextR < n && nextC >= 0 && nextC < n {
                    dfs(row: nextR, col: nextC)
                }
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] && map[i][j] == "1" {
                count = 0
                dfs(row: i, col: j)
                result.append(count)
            }
        }
    }
    
    print(result.count)
    for i in result.sorted(by: <) {
        print(i)
    }

}

solution()


//import Foundation
//
//func solution() {
//    let n = Int(readLine()!)!
//    var houseTable: [[Int]] = []
//
//    for _ in 0..<n{
//        houseTable.append(readLine()!.map{Int(String($0))!})
//    }
//
//    var graph = [[Int]:[[Int]]]()
//
//    for i in 0..<n{
//        for j in 0..<n{
//            graph[[i,j]] = []
//        }
//    }
//
//    for i in 0..<n{
//        for j in 0..<n{
//            if houseTable[i][j] == 1 {
//                if i == 0{
//                    if j == 0{
//                        if houseTable[i+1][j] == 1 {
//                            graph[[i,j]]?.append([i+1,j])
//                        }
//                        if houseTable[i][j+1] == 1 {
//                            graph[[i,j]]?.append([i,j+1])
//                        }
//                    } else if j == n-1 {
//                        if houseTable[i][j-1] == 1{
//                            graph[[i,j]]?.append([i,j-1])
//                        }
//                        if houseTable[i+1][j] == 1{
//                            graph[[i,j]]?.append([i+1,j])
//                        }
//                    }
//                        else {
//                        if houseTable[i+1][j] == 1 {
//                            graph[[i,j]]?.append([i+1,j])
//                        }
//                        if houseTable[i][j-1] == 1{
//                            graph[[i,j]]?.append([i,j-1])
//                        }
//                        if houseTable[i][j+1] == 1{
//                            graph[[i,j]]?.append([i,j+1])
//                        }
//                    }
//                } else if i == n-1 {
//                    if j == n-1 {
//                        if houseTable[i-1][j] == 1{
//                            graph[[i,j]]?.append([i-1,j])
//                        }
//                        if houseTable[i][j-1] == 1{
//                            graph[[i,j]]?.append([i,j-1])
//                        }
//                    } else if j == 0{
//                        if houseTable[i-1][j] == 1{
//                            graph[[i,j]]?.append([i-1,j])
//                        }
//                        if houseTable[i][j+1] == 1{
//                            graph[[i,j]]?.append([i,j+1])
//                        }
//                    } else {
//                        if houseTable[i-1][j] == 1{
//                            graph[[i,j]]?.append([i-1,j])
//                        }
//                        if houseTable[i][j-1] == 1{
//                            graph[[i,j]]?.append([i,j-1])
//                        }
//                        if houseTable[i][j+1] == 1{
//                            graph[[i,j]]?.append([i,j+1])
//                        }
//                    }
//                } else {
//                    if j == n-1{
//                        if houseTable[i+1][j] == 1{
//                            graph[[i,j]]?.append([i+1,j])
//                        }
//                        if houseTable[i-1][j] == 1{
//                            graph[[i,j]]?.append([i-1,j])
//                        }
//                        if houseTable[i][j-1] == 1{
//                            graph[[i,j]]?.append([i,j-1])
//                        }
//                    } else if j == 0 {
//                        if houseTable[i-1][j] == 1{
//                            graph[[i,j]]?.append([i-1,j])
//                        }
//                        if houseTable[i+1][j] == 1{
//                            graph[[i,j]]?.append([i+1,j])
//                        }
//                        if houseTable[i][j+1] == 1{
//                            graph[[i,j]]?.append([i,j+1])
//                        }
//                    } else {
//                        if houseTable[i-1][j] == 1{
//                            graph[[i,j]]?.append([i-1,j])
//                        }
//                        if houseTable[i+1][j] == 1{
//                            graph[[i,j]]?.append([i+1,j])
//                        }
//                        if houseTable[i][j+1] == 1{
//                            graph[[i,j]]?.append([i,j+1])
//                        }
//                        if houseTable[i][j-1] == 1{
//                            graph[[i,j]]?.append([i,j-1])
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    var result = [[[Int]]]()
//
//    for i in 0..<n{
//        for j in 0..<n{
//            var s = 0
//            if houseTable[i][j] == 1{
//                for tempresult in result {
//                    if tempresult.contains([i,j]){
//                        s += 1
//                        break
//                    }
//                }
//                if s == 0 {
//                    var visited = [[Int]]()
//                    var stack: [[Int]] = [[i,j]]
//                    while stack.count != 0{
//                        guard let temp = stack.popLast() else { fatalError() }
//                        if !visited.contains(temp){
//                            visited.append(temp)
//                            guard let temp2 = graph[temp] else { fatalError() }
//                            stack += temp2
//                        }
//                    }
//                    result.append(visited)
//                }
//            }
//        }
//    }
//
//    result.sort { (a, b) -> Bool in
//        a.count<b.count
//    }
//    print(result.count)
//    for i in result{
//        print(i.count)
//    }
//
//}
//
//solution()
