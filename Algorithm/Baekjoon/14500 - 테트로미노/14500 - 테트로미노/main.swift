//
//  main.swift
//  14500 - 테트로미노
//
//  Created by Ick on 2021/03/08.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var paper: [[Int]] = []
    for _ in 0..<n {
        paper.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var maxSum: Int = 0
    func dfs(_ now: [Int],_ sum: Int,_ count: Int) {
        if count == 4 {
            maxSum = max(maxSum, sum)
            return
        }
        for i in 0..<4 {
            let next: [Int] = [now[0] + dy[i], now[1] + dx[i]]
            if next[0] < 0 || next[1] < 0 || next[0] >= n || next[1] >= m {
                continue
            } else {
                if !visited[next[0]][next[1]] {
                    visited[next[0]][next[1]] = true
                    dfs(next, sum + paper[next[0]][next[1]], count + 1)
                    visited[next[0]][next[1]] = false
                }
            }
        }
    }
    
    func edgeCase(_ x: Int, _ y: Int) {
        var sum: Int = 0
        // ㅜ
        if y + 1 < n && x + 2 < m {
            sum += paper[y][x]
            sum += paper[y][x+1]
            sum += paper[y][x+2]
            sum += paper[y+1][x+1]
            maxSum = max(maxSum, sum)
            sum = 0
        }
        // ㅗ
        if y - 1 > -1 && x + 2 < m {
            sum += paper[y][x]
            sum += paper[y-1][x+1]
            sum += paper[y][x+1]
            sum += paper[y][x+2]
            maxSum = max(maxSum, sum)
            sum = 0
        }
        // ㅏ
        if y + 2 < n && x + 1 < m {
            sum += paper[y][x]
            sum += paper[y+1][x]
            sum += paper[y+2][x]
            sum += paper[y+1][x+1]
            maxSum = max(maxSum, sum)
            sum = 0
        }
        // ㅓ
        if y + 2 < n && x - 1 > -1 {
            sum += paper[y][x]
            sum += paper[y+1][x]
            sum += paper[y+2][x]
            sum += paper[y+1][x-1]
            maxSum = max(maxSum, sum)
            sum = 0
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            visited[i][j] = true
            dfs([i,j], paper[i][j], 1)
            visited[i][j] = false
            
            // ㅗ 모양들 처리 ㅗ, ㅜ, ㅏ, ㅓ
            edgeCase(j, i)
        }
    }
    print(maxSum)
}

solution()
