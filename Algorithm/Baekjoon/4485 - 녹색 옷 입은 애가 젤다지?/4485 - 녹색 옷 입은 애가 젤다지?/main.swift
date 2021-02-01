//
//  main.swift
//  4485 - 녹색 옷 입은 애가 젤다지?
//
//  Created by Ick on 2020/11/11.
//

import Foundation
public struct Heap<T> {
  var nodes: [T] = []
  let comparer: (T,T) -> Bool

  var isEmpty: Bool {
      return nodes.isEmpty
  }

  init(comparer: @escaping (T,T) -> Bool) {
      self.comparer = comparer
  }

  func peek() -> T? {
      return nodes.first
  }

  mutating func insert(_ element: T) {
      var index = nodes.count

      nodes.append(element)

      while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
          nodes.swapAt(index, (index-1)/2)
          index = (index-1)/2
      }
  }

  mutating func delete() -> T? {
      guard !nodes.isEmpty else {
          return nil
      }

      if nodes.count == 1 {
          return nodes.removeFirst()
      }

      let result = nodes.first
      nodes.swapAt(0, nodes.count-1)
      _ = nodes.popLast()

      var index = 0

      while index < nodes.count {
          let left = index * 2 + 1
          let right = left + 1

          if right < nodes.count {
              if comparer(nodes[left], nodes[right]),
                  !comparer(nodes[right], nodes[index]) {
                  nodes.swapAt(right, index)
                  index = right
              } else if !comparer(nodes[left], nodes[index]){
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else if left < nodes.count {
              if !comparer(nodes[left], nodes[index]) {
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else {
              break
          }
      }

      return result
  }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: >)
    }
}

// Heap By 라이노님 https://gist.github.com/JCSooHwanCho/a3f070c2160bb8c0047a5ddbb831f78e
struct EdgeData : Comparable {
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
    var cost: Int
    var node: [Int]
}

func solution() {
    let inf = 77777777
    var count: Int = 1
    while true {
        let n = Int(String(readLine()!))!
        if n == 0 {
            break
        }
        var cave: [[Int]] = []
        
        // 동굴 지도 입력받는다.
        for _ in 0..<n {
            cave.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
        }
        var result: [[Int]] = [[Int]](repeating: [Int](repeating: inf, count: n), count: n)
        
        var graph: [[Int] : [(Int,Int,Int)]] = [:]
        let dx: [Int] = [0,0,-1,1]
        let dy: [Int] = [-1,1,0,0]
        
        // 동굴 지도를 그래프화 한다.
        for i in 0..<n {
            for j in 0..<n {
                
                for k in 0..<4{
                    let nx = j - dx[k]
                    let ny = i - dy[k]
                    if nx < 0 || ny < 0 || nx > n-1 || ny > n-1 {
                        continue
                    } else {
                        if graph.keys.contains([i,j]) {
                            graph[[i,j]]!.append((ny,nx,cave[ny][nx]))
                        } else {
                            graph[[i,j]] = [(ny,nx,cave[ny][nx])]
                        }
                    }
                }
            }
        }
        
        var pq: Heap = Heap<EdgeData>()
        pq.insert(EdgeData(cost: cave[0][0], node: [0,0]))
        while !pq.isEmpty {
            let now = pq.delete()!
            if result[now.node[0]][now.node[1]] < now.cost {
                continue
            }
            for next in graph[now.node]! {
                if now.cost + next.2 < result[next.0][next.1] {
                    result[next.0][next.1] = now.cost + next.2
                    pq.insert(EdgeData(cost: now.cost + next.2, node: [next.0, next.1]))
                }
            }
        }
        print("Problem \(count): \(result[n-1][n-1])")
        count += 1
    }
    
}

solution()
