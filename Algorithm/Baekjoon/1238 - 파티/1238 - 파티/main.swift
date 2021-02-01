//
//  main.swift
//  1238 - 파티
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
    var node: Int
}


func solution() {
    let inf = 777777
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    // 학생 수
    let n = firstLine[0]
    // 간선의 수
    let m = firstLine[1]
    // 목적지
    let x = firstLine[2]
    
    var graph: [[(Int,Int)]] = [[(Int,Int)]](repeating: [(Int, Int)](), count: n+1)
    
    // [[(2,4),(3,2),(4,7)], [(1,1),(3,5)], [(1,2),(4,4)], [(2,3)]
    
    for _ in 0..<m {
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        graph[data[0]].append((data[1],data[2]))
    }
    var result = Array(repeating: 0, count: n+1)
    
    // 오고 가는 것을 계산하기 위해 1~N 까지 x로의 최단경로 모두 구한다.
    
    for i in 1...n {
        var d = Array(repeating: inf, count: n+1)
        var pq: Heap = Heap<EdgeData>()
        pq.insert(EdgeData(cost: 0, node: i))
        d[i] = 0
        
        while !pq.isEmpty {
            let now = pq.delete()!
            if d[now.node] < now.cost {
                continue
            }
            for next in graph[now.node] {
                if now.cost + next.1 < d[next.0] {
                    d[next.0] = now.cost + next.1
                    pq.insert(EdgeData(cost: now.cost + next.1, node: next.0))
                }
            }
        }
        
        if i == x {
            for j in 1...n{
                result[j] += d[j]
            }
        } else {
            result[i] += d[x]
        }
    }
    
    print(result.max()!)
    
}

solution()
