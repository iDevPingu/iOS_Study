//
//  main.swift
//  [Kakao] 2018 Blind - 뉴스 클러스터링
//
//  Created by Ick on 2021/05/04.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = str1.lowercased().map({String($0)})
    let str2 = str2.lowercased().map({String($0)})
    
    var str1Map: [String: Int] = [:]
    var str2Map: [String: Int] = [:]
    
    for i in 0..<str1.count-1 {
        let first = Character(str1[i])
        let second = Character(str1[i+1])
        if let firstAscii = first.asciiValue,
           let secondAscii = second.asciiValue {
            if firstAscii >= 97 && firstAscii <= 122 && secondAscii >= 97 && secondAscii <= 122 {
                let temp = String(first) + String(second)
                let count = str1Map[temp, default: 0]
                str1Map[temp] = count + 1
            }
        }
    }
    
    for i in 0..<str2.count-1 {
        let first = Character(str2[i])
        let second = Character(str2[i+1])
        if let firstAscii = first.asciiValue,
           let secondAscii = second.asciiValue {
            if firstAscii >= 97 && firstAscii <= 122 && secondAscii >= 97 && secondAscii <= 122 {
                let temp = String(first) + String(second)
                let count = str2Map[temp, default: 0]
                str2Map[temp] = count + 1
            }
        }
    }
    
    if str1Map.isEmpty && str2Map.isEmpty {
        return 65536
    }
    
    var interSection: Int = 0
    var union: Int = 0
    
    // 교집합 찾기
    for key in str1Map.keys {
        if let value = str2Map[key] {
            let minValue = min(str1Map[key]!, value)
            interSection += minValue
            str1Map[key]! -= minValue
            str2Map[key]! -= minValue
        }
    }
    // 합집합 계산
    for key in str1Map.keys {
        union += str1Map[key]!
    }
    for key in str2Map.keys {
        union += str2Map[key]!
    }
    union += interSection
    
    return Int((Float(interSection) / Float(union)) * 65536)
}

print(solution("FRANCE", "french"))
print(solution("handshake", "shake hands"))
print(solution("aa1+aa2", "AAAA12"))
print(solution("E=M*C^2", "e=m*c^2"))
