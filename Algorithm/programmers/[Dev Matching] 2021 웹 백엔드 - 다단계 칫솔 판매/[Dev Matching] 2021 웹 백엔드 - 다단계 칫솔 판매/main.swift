//
//  main.swift
//  [Dev Matching] 2021 웹 백엔드 - 다단계 칫솔 판매
//
//  Created by Ick on 2021/04/27.
//

import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var personMap: [String: String] = [:]
    var personWallet: [String: Int] = [:]
    personWallet["-"] = 0
    for i in 0..<enroll.count {
        personMap[enroll[i]] = referral[i]
        personWallet[enroll[i]] = 0
    }
    var result: [Int] = []
    for i in 0..<seller.count {
        // 칫솔은 하나에 백원
        var earnMoney = amount[i] * 100
        var nowPerson = seller[i]
        personWallet[nowPerson]! += Int(earnMoney / 10 * 9)
        earnMoney /= 10
        while let nextPerson = personMap[nowPerson] {
            let giveMoney = earnMoney / 10
            personWallet[nextPerson]! += (earnMoney - giveMoney)
            earnMoney = giveMoney
            nowPerson = nextPerson
        }
    }
    
    for i in 0..<enroll.count {
        result.append(personWallet[enroll[i]]!)
    }
    
    return result
}
print(solution(["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"], ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"], ["young", "john", "tod", "emily", "mary"], [12, 4, 2, 5, 10]))
