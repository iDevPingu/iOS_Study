//
//  main.swift
//  1987 - 알파벳
//
//  Created by Ick on 2021/01/08.
//

import Foundation

//func solution() {
//    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
//    let r = firstLine[0]
//    let c = firstLine[1]
//
//    var result = 0
//
//    var board: [[String]] = []
//
//    for _ in 0..<r {
//        board.append(readLine()!.map({String($0)}))
//    }
//
//    let dx = [-1,1,0,0]
//    let dy = [0,0,-1,1]
//
//    var visited = [[[String]]](repeating: [[String]](repeating: [String](), count: c), count: r)
//    var count = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
//
//    var stack: [[Int]] = [[0,0]]
//    visited[0][0] = [board[0][0]]
//    count[0][0] = 1
//
//    while !stack.isEmpty {
//        let now = stack.popLast()!
//
//        for i in 0..<4 {
//            let newX = now[1] + dx[i]
//            let newY = now[0] + dy[i]
//            if newX > c-1 || newY > r-1 || newX < 0 || newY < 0 {
//                continue
//            } else {
//                if visited[now[0]][now[1]].contains(board[newY][newX]) {
//                    continue
//                } else {
//                    visited[newY][newX] = visited[now[0]][now[1]]
//                    visited[newY][newX].append(board[newY][newX])
//                    count[newY][newX] = count[now[0]][now[1]] + 1
//                    stack.append([newX,newY])
//                }
//            }
//        }
//    }
//    for i in 0..<count.count {
//        if result < count[i].max()! {
//            result = count[i].max()!
//        }
//    }
//    print(result)
//}

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let r = firstLine[0]
    let c = firstLine[1]
    
    var board: [[String]] = []
    
    for _ in 0..<r {
        board.append(readLine()!.map({String($0)}))
    }
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    var count: [Int] = [Int](repeating: 0, count: 26)
    var visited: [Bool] = [Bool](repeating: false, count: 26)
    
    var stack: [[Int]] = [[0,0]]
    count[Int(UnicodeScalar(board[0][0])!.value) - 65] = 1
    
    func dfs(_ x: Int, _ y: Int) {
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx > c-1 || ny > r-1 {
                continue
            } else {
                if !visited[Int(UnicodeScalar(board[ny][nx])!.value - 65)] {
                    visited[Int(UnicodeScalar(board[ny][nx])!.value - 65)] = true
                    if count[Int(UnicodeScalar(board[ny][nx])!.value - 65)] < count[Int(UnicodeScalar(board[y][x])!.value - 65)] + 1 {
                        count[Int(UnicodeScalar(board[ny][nx])!.value - 65)] = count[Int(UnicodeScalar(board[y][x])!.value - 65)] + 1
                        dfs(nx,ny)
                    }
                    visited[Int(UnicodeScalar(board[ny][nx])!.value - 65)] = false
                }
            }
        }
    }
    
    for i in 0..<r {
        for j in 0..<c {
            if !visited[Int(UnicodeScalar(board[i][j])!.value) - 65] {
                visited[Int(UnicodeScalar(board[i][j])!.value) - 65] = true
                count[Int(UnicodeScalar(board[i][j])!.value) - 65] += 1
                dfs(j,i)
            }
            visited[Int(UnicodeScalar(board[i][j])!.value) - 65] = false
        }
    }
    
    print(count)

}
solution()
