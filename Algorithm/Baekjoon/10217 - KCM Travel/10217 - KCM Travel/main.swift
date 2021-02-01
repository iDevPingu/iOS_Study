//
//  main.swift
//  10217 - KCM Travel
//
//  Created by Ick on 2020/09/14.
//  Copyright © 2020 ick. All rights reserved.
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

struct EdgeData: Comparable{
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.time < rhs.time
    }
    var node: Int
    var cost: Int
    var time: Int
}
func solution(){
    let inf = 7777777777
    var answer: [Int] = []
    let t = Int(readLine()!)!
    for _ in 0..<t{
        let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
        let n = firstLine[0], m = firstLine[1], k = firstLine[2]

        // 도착공항, 비용, 소요시간
        var graph: [[(Int,Int,Int)]] = [[(Int,Int,Int)]](repeating: [(Int,Int,Int)](), count: n)
        // 비용, 소요시간
        var result: [(Int,Int)] = [(Int,Int)](repeating: (0,inf), count: n)
        result[0] = (0,0)
        for _ in 0..<k{
            // 출발공항, 도착공항, 비용, 소요시간
            let data = readLine()!.split(separator: " ").map({Int($0)!})
            graph[data[0]-1].append((data[1]-1,data[2],data[3]))

        }

        var pq: Heap<EdgeData> = Heap<EdgeData>()
        pq.insert(EdgeData(node: 0, cost: 0, time: 0))

        while(!pq.isEmpty){
            let now = pq.delete()!
            let nowPosition = now.node
            let nowCost = now.cost
            let nowTime = now.time

            // 현재 걸리는 시간이 원래 시간보다 크다면 고려할 필요가 없다.
//            if nowTime > result[nowPosition].1 {
//                continue
//            }
//            // 만약 주어진 돈 보다 현재 필요한 금액이 더 큰 경우 패스한다.
//            if nowCost + result[nowPosition].0 > m{
//                continue
//            }

            for next in graph[nowPosition]{
                // 만약 어떤 지점을 거쳐 목적 지점을 가는 길이 현재 경로보다 더 빠를 때
                if result[next.0].1 > nowTime + next.2{
                    if nowCost + next.1 > m {
                        continue
                    }
                    // 비용 추가
                    result[next.0].0 = nowCost + next.1

                    // 시간 추가
                    result[next.0].1 = nowTime + next.2

                    pq.insert(EdgeData(node: next.0, cost: result[next.0].0, time: result[next.0].1))
                }
            }
        }
        if result[n-1] == (0,inf){
            answer.append(-1)
        } else {
            answer.append(result[n-1].1)
        }
    }
    for i in answer{
        if i == -1 {
            print("Poor KCM")
        } else {
            print(i)
        }
    }

}

solution()

//1
//5 15 7
//1 2 2 3
//2 5 20 1
//2 4 5 2
//2 3 4 6
//3 4 1 2
//4 5 3 1
//1 5 15 1
