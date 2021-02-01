//
//  main.swift
//  2206 - 벽 부수고 이동하기
//
//  Created by Ick on 2020/09/09.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

class Queue<T>{
    var enqueue: [T]
    var dequeue: [T] = []
    
    var isEmpty: Bool{
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int{
        return enqueue.count + dequeue.count
    }
    
    init(_ queue:[T]){
        self.enqueue = queue
    }
    
    func push(_ n: T){
        enqueue.append(n)
    }
    
    func pop() -> T?{
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
}

func solution() -> Int{
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let n = firstLine[0]
    let m = firstLine[1]

    var mapTable: [[Int]] = []
    for _ in 0..<n{
        let temp = readLine()!.map({Int(String($0))!})
        mapTable.append(temp)
    }

    let dx = [0,0,-1,1] // 상하좌우
    let dy = [-1,1,0,0]

    let queue: Queue = Queue([[Int]]())
    // y좌표, x좌표, 벽뿌여부
    queue.push([0,0,0])
    
    // 벽안뚫고 방문, 벽뚫고 방문
    var visited: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [0,0], count: m), count: n)
    visited[0][0] = [1,1]
    while(queue.count != 0){
        guard let now = queue.pop() else { fatalError() }
        for i in 0..<dx.count{
            let nextX = now[1] + dx[i]
            let nextY = now[0] + dy[i]
            if nextX < 0 || nextX > m-1 || nextY < 0 || nextY > n-1{
                continue
            } else {
                // 벽이 없고 아직 벽을 부순적 없을 때
                if mapTable[nextY][nextX] == 0 && now[2] == 0 && visited[nextY][nextX][0] == 0{
                    visited[nextY][nextX][0] = visited[now[0]][now[1]][0] + 1
                    queue.push([nextY,nextX,0])
                    // 벽이있고 아직 벽을 부순적이 없을 때
                } else if mapTable[nextY][nextX] == 1 && now[2] == 0 && visited[nextY][nextX][1] == 0{
                    visited[nextY][nextX][1] = visited[now[0]][now[1]][0] + 1
                    queue.push([nextY,nextX,1])
                    // 벽이 없고 벽을 부순적이 있을 때
                } else if mapTable[nextY][nextX] == 0 && now[2] == 1 && visited[nextY][nextX][1] == 0{
                    visited[nextY][nextX][1] = visited[now[0]][now[1]][1] + 1
                    queue.push([nextY,nextX,1])
                }
            }
        }
    }
    
    if visited[n-1][m-1][0] == 0 && visited[n-1][m-1][1] == 0{
        return -1
    } else if visited[n-1][m-1][0] == 0{
        return visited[n-1][m-1][1]
    } else if visited[n-1][m-1][1] == 0{
        return visited[n-1][m-1][0]
    } else {
        let a = visited[n-1][m-1][0]
        let b = visited[n-1][m-1][1]
        if a < b{
            return a
        } else {
            return b
        }
    }
    
}

print(solution())
//func solution() -> Int{
//    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
//    let n = firstLine[0]
//    let m = firstLine[1]
//
//    var mapTable: [[Int]] = []
//    for _ in 0..<n{
//        let temp = readLine()!.map({Int(String($0))!})
//        mapTable.append(temp)
//    }
//
//    let dx = [0,0,-1,1] // 상하좌우
//    let dy = [-1,1,0,0]
//
//    let queue: Queue = Queue([[Int]]())
//    // y좌표, x좌표, 벽뚫여부
//    queue.push([0,0,0])
//
//    // y좌표, x좌표, 거리, 벽뚫여부, 방문여부
//    var mapData: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [0,0,0,0,0], count: m), count: n)
//    mapData[0][0] = [0,0,1,0,0]
//
//    while (queue.count != 0){
//        guard let now = queue.pop() else { fatalError() }
//        if now[0] == n-1 && now[1] == m-1 {
//            return mapData[now[0]][now[1]][2]
//        }
//        for i in 0..<dx.count{
//            let newX = now[1] + dx[i]
//            let newY = now[0] + dy[i]
//
//            if (newX < 0 || newX > m-1 || newY < 0 || newY > n-1){
//                continue
//            } else {
//                // 벽이 없을 때
//                if mapTable[newY][newX] == 0{
//                    // 방문 안했을 때
//                    if mapData[newY][newX][4] == 0{
//                        mapData[newY][newX] = [now[0],now[1],mapData[now[0]][now[1]][2]+1,now[2],1]
//                        queue.push([newY,newX,now[2]])
//                    } else {
//                        // 방문은 했지만 현재 벽을 부수고 온 경우이고 방문한 곳은 벽을 부수고 온적이 없을 때
//                        if mapData[newY][newX][3] == 0 && now[2] == 1{
//                            mapData[newY][newX] = [now[0],now[1],mapData[now[0]][now[1]][2]+1,1,1]
//                            queue.push([newY,newX,1])
//                        }
//
//                    }
//                    // 벽이 있을때
//                } else if mapTable[newY][newX] == 1 {
//                    // 방문 안했을 때
//                    if mapData[newY][newX][4] == 0{
//                        //벽을 부술 수 있을 때
//                        if now[2] == 0{
//                            mapData[newY][newX] = [now[0],now[1],mapData[now[0]][now[1]][2] + 1,1,1]
//                            queue.push([newY,newX,1])
//                        }
//                    } else {
//                        // 방문한적이 있지만 벽뚫고 온것은 아닐때
//                        if now[2] == 1{
//                            if mapData[newY][newX][3] == 0{
//                                mapData[newY][newX] = [now[0],now[1],mapData[now[0]][now[1]][2] + 1,1,1]
//                                queue.push([newY,newX,1])
//                            }
//                        }
//                    }
//
//                }
//            }
//        }
//    }
//
//    return -1
//}
//
//print(solution())

//func solution() -> Int{
//    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
//    let n = firstLine[0]
//    let m = firstLine[1]
//
//    var mapTable: [[Int]] = []
//    for _ in 0..<n{
//        let temp = readLine()!.map({Int(String($0))!})
//        mapTable.append(temp)
//    }
//
//    let dcol = [-1,1,0,0]
//    let drow = [0,0,-1,1] // 상하좌우
//
//    // (행, 렬, 벽뚫여부, 지금까지거리
//    var mapData: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [0,0,0], count: m), count: n)
//    var visited: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
//    mapData[0][0] = [0,0,1]
//    visited[0][0] = 1
//    let queue: Queue = Queue([[0,0,0]])
//
//    while (queue.count != 0){
//        guard let now = queue.pop() else { return -1 }
//        if (now[0] == n-1 && now[1] == m-1){
//            return mapData[now[0]][now[1]][2]
//        }
//        for i in 0..<dcol.count{
//            let nextCol = now[0] + dcol[i]
//            let nextRow = now[1] + drow[i]
//            let nowMapData = mapData[now[0]][now[1]]
//            if (nextCol >= 0 && nextCol < n && nextRow >= 0 && nextRow < m){
//                // 벽이 없는 공간일 때
//                if mapTable[nextCol][nextRow] == 0 && visited[nextCol][nextRow] < 2{
//                    visited[nextCol][nextRow] = visited[nextCol][nextRow] + 1
//                    mapData[nextCol][nextRow] = [now[0],now[1],nowMapData[2]+1]
//                    queue.push([nextCol,nextRow,now[2]])
//                }
//                // 벽이 있는 공간일 때
//                else {
//                    // 벽을 뚫을 수 있는 기회가 있을 때
//                    if now[2] == 0 && visited[nextCol][nextRow] < 2{
//                        visited[nextCol][nextRow] = visited[nextCol][nextRow] + 1
//                        mapData[nextCol][nextRow] = [now[0],now[1],nowMapData[2]+1]
//                        queue.push([nextCol,nextRow,1])
//                    }
//                }
//            }
//        }
//    }
//
//    return -1
//}

