//
//  main.swift
//  [Kakao] 2019 Blind - 후보키
//
//  Created by Ick on 2021/04/19.
//

import Foundation

func solution(_ relation:[[String]]) -> Int {
    
    var combinations: [[Int]] = []
    var stack: [Int] = []
    var visited = [Bool](repeating: false, count: relation[0].count)
    func dfs(_ count: Int, _ index: Int) {
        if stack.count == count {
            combinations.append(stack)
        }
        for i in index..<relation[0].count {
            if !visited[i] {
                visited[i] = true
                stack.append(i)
                dfs(count, i+1)
                visited[i] = false
                stack.removeLast()
            }
        }
    }
    
    for i in 1...relation[0].count {
        dfs(i, 0)
    }
    
    var results: [[Int]] = []
    
    for combination in combinations {
        var set: Set<[String]> = []
        for i in 0..<relation.count {
            let nowRelation = relation[i]
            var attributes: [String] = []
            for j in 0..<combination.count {
                attributes.append(nowRelation[combination[j]])
            }
            if set.contains(attributes) {
                break
            } else {
                set.insert(attributes)
            }
        }
        var isOkay: Bool = true
        
        if set.count == relation.count {
            for result in results {
                var count = 0
                for i in 0..<result.count {
                    if combination.contains(result[i]) {
                        count += 1
                    }
                }
                if count == result.count {
                    isOkay = false
                }
            }

            if isOkay {
                results.append(combination)
            }
        }
    }
    return results.count
}

print(solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]))
print(solution([["a","aa"],["aa","a"],["a","a"]]))
print(solution([["a","1","aaa","c","ng"],["b","1","bbb","c","g"],["c","1","aaa","d","ng"],["d","2","bbb","d","ng"]]))
