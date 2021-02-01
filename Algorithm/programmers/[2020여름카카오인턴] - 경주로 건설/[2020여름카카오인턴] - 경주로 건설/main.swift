//
//  main.swift
//  [2020여름카카오인턴] - 경주로 건설
//
//  Created by Ick on 2020/09/08.
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



//func solution(_ board:[[Int]]) -> Int {
//    var result: Int = 0
//
////    let dx = [0,0,-1,1] // 상하좌우
////    let dy = [-1,1,0,0] // 상하좌우
//
//    let dxy = [(-1,0),(1,0),(0,-1),(0,1)] // 상하좌우
//
//    let 세로: Int = board.count
//
//    var visited: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 세로), count: 세로)
//    visited[0][0] = 1
//    // 거리비용, 꺾음비용
//    var distance: [[(Int,Int)]] = [[(Int,Int)]](repeating: [(Int, Int)](repeating: (0,0), count: 세로), count: 세로)
//
//    var cost: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 세로), count: 세로)
//    var direction: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: 세로), count: 세로)
//
//    let start = (0,0)
//
//    let queue: Queue = Queue([start])
//
//    while queue.count != 0{
//        guard let now = queue.pop() else { fatalError() }
//
//        for i in 0..<dxy.count{
//            let nextX = now.1 + dxy[i].1
//            let nextY = now.0 + dxy[i].0
//
//            if nextX < 0 || nextX > 세로 - 1 || nextY < 0 || nextY > 세로 - 1{
//                continue
//            } else {
//                // 만약 벽이라면
//                if board[nextY][nextX] == 1{
//                    continue
//                }
//                // 벽이 아니고 방문한 적이 없다면
//                if visited[nextY][nextX] == 0{
//                    // 방문 표시하고
//                    visited[nextY][nextX] = 1
//                    // 거리 1 올리고
//                    // 만약 방향이 -1 이라면 즉 처음 출발상태
//                    if direction[now.0][now.1] == -1 {
//                        distance[nextY][nextX].0 = distance[now.0][now.1].0 + 1
//                        direction[nextY][nextX] = i
//                        // 만약 전에 사용한 방향이 현재 방향과 다르다면
//                    } else if i != direction[now.0][now.1] {
//                        // 현재 방향 초기화하고
//                        distance[nextY][nextX].0 = distance[now.0][now.1].0 + 1
//                        // 방향변환횟수 + 1
//                        distance[nextY][nextX].1 = distance[now.0][now.1].1 + 1
//                        direction[nextY][nextX] = i
//                    } else if i == direction[now.0][now.1]{
//                        distance[nextY][nextX].0 = distance[now.0][now.1].0 + 1
//                        distance[nextY][nextX].1 = distance[now.0][now.1].1
//                        direction[nextY][nextX] = i
//                    }
//                    queue.push((nextY,nextX))
//                    // 방문한적이 있을 때
//                } else {
//                    // 지금까지 거리와 방향변환 계산해서 더 작으면 그걸로 ㄱㄱ
//                    var newCost = distance[now.0][now.1].0
//                    let nowCost = distance[nextY][nextX].0 + (5 * distance[nextY][nextX].1)
//                    // 방향이 달라졌다면
//                    if direction[now.0][now.1] != i{
//                        newCost += ((distance[now.0][now.1].1 + 1) * 5)
//                        // 새로운 값이 더 작다면 데이터 수정후 큐에 지금 위치 삽입
//                        // 새로운 값이 더 크면 뭐 할 것도 없음
//                        if newCost < nowCost{
//                            distance[nextY][nextX].0 = distance[now.0][now.1].0 + 1
//                            distance[nextY][nextX].1 = distance[now.0][now.1].1 + 1
//                            direction[nextY][nextX] = i
//                            queue.push((nextY,nextX))
//                        }
//                        // 방향이 안달라졌다면
//                    } else if direction[now.0][now.1] == i {
//                        newCost += (distance[now.0][now.1].1 * 5)
//                        // 새로운 값이 더 작다면
//                        if newCost < nowCost{
//                            distance[nextY][nextX].0 = distance[now.0][now.1].0 + 1
//                            distance[nextY][nextX].1 = distance[now.0][now.1].1
//                            direction[nextY][nextX] = i
//                            queue.push((nextY,nextX))
//                        }
//                    }
//                }
//            }
//        }
//
//    }
//
//    print(distance)
//    result = (distance[세로-1][세로-1].0 * 100) + (distance[세로-1][세로-1].1 * 500)
//
//
//    return result
//}
func solution(_ board:[[Int]]) -> Int {
  
    let dxy = [(-1,0),(1,0),(0,-1),(0,1)] // 상하좌우
    
    let 세로: Int = board.count
    
    var visited: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 세로), count: 세로)
    visited[0][0] = 1

    var cost: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 세로), count: 세로)
    
    // 시작점, 방향
    let start = (0,0,-1,0)
    
    let queue: Queue = Queue([start])
    
    while queue.count != 0{
        guard let now = queue.pop() else { fatalError() }
        
        if now.0 == 세로-1 && now.1 == 세로-1 {
            if now.3 < cost[now.0][now.1]{
                cost[now.0][now.1] = now.3
                continue
            }
        }
        for i in 0..<dxy.count{
            let nextX = now.1 + dxy[i].1
            let nextY = now.0 + dxy[i].0
            
            if nextX < 0 || nextX > 세로 - 1 || nextY < 0 || nextY > 세로 - 1 || board[nextY][nextX] == 1{
                continue
            }
                // 만약 벽이라면
                
                // 벽이 아니고 방문한 적이 없다면
            if visited[nextY][nextX] == 0{
                // 방문 표시하고
                visited[nextY][nextX] = 1
                if now.2 == -1 || now.2 == i {
                    let newCost = now.3 + 100
                    cost[nextY][nextX] = newCost
                    queue.push((nextY,nextX,i,newCost))
                } else if now.2 != i{
                    let newCost = now.3 + 600
                    cost[nextY][nextX] = newCost
                    queue.push((nextY,nextX,i,newCost))
                }
            } else {
                if now.2 == i {
                    let newCost = now.3 + 100
                    if newCost <= cost[nextY][nextX]{
                        cost[nextY][nextX] = newCost
                        queue.push((nextY,nextX,i,newCost))
                    }
                } else {
                    let newCost = now.3 + 600
                    if newCost <= cost[nextY][nextX]{
                        cost[nextY][nextX] = newCost
                        queue.push((nextY,nextX,i,newCost))
                    }
                }
            }
                
            
        }
        
    }
    
    
    

    return cost[세로-1][세로-1]
}
print(solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]))
