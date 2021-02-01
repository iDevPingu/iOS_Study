//
//  main.swift
//  14502 - 연구소
//
//  Created by Ick on 2020/11/10.
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
func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var map: [[Int]] = []
    var safeArea: [[Int]] = []
    var virusArea: [[Int]] = []
    
    for _ in 0..<n{
        map.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    // 안전영역의 좌표를 구한다.
    // 바이러스 좌표 구한다.
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if map[i][j] == 0 {
                safeArea.append([i,j])
            } else if map[i][j] == 2 {
                virusArea.append([i,j])
            }
        }
    }
    
    var result: Int = 0

    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    
    
    // 3개의 벽을 만들고 바이러스를 퍼뜨리는 함수
    func makeWall(map: [[Int]]){
        var map = map
        
        let queue = Queue(virusArea)
        while !queue.isEmpty {
            guard let now = queue.pop() else { fatalError() }
            
            for i in 0..<dx.count {
                let nextX = now[1] + dx[i]
                let nextY = now[0] + dy[i]
                
                if nextX < 0 || nextY < 0 || nextX > m-1 || nextY > n-1 {
                    continue
                } else {
                    if map[nextY][nextX] == 0 {
                        map[nextY][nextX] = 2
                        queue.push([nextY, nextX])
                    }
                }
            }
        }
        var temp = 0
        for i in 0..<n {
            for j in map[i] {
                if j == 0 {
                    temp += 1
                }
            }
        }
        if result < temp {
            result = temp
        }
    }
    
    // 빈 벽 3개를 구하는 것
    func findThreeWalls() {
        for i in 0..<safeArea.count {
            for j in i+1..<safeArea.count {
                for k in j+1..<safeArea.count {
                    var map = map
                    let point1 = safeArea[i]
                    let point2 = safeArea[j]
                    let point3 = safeArea[k]
                    
                    map[point1[0]][point1[1]] = 1
                    map[point2[0]][point2[1]] = 1
                    map[point3[0]][point3[1]] = 1
                    
                    makeWall(map: map)
                }
            }
        }
    }
    
    findThreeWalls()

    print(result)
}

solution()
