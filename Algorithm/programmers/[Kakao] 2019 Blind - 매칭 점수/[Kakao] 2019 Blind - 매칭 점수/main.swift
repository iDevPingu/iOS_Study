//
//  main.swift
//  [Kakao] 2019 Blind - 매칭 점수
//
//  Created by Ick on 2021/04/22.
//

import Foundation

class LinkScore {
    var url: String
    var index: Float
    var searchScore: Float
    var linkScore: Float = 0
    var linkURL: [String]
    var matchingScore: Float = 0
    init(url: String, index: Float, searchScore: Float, linkURL: [String]) {
        self.url = url
        self.index = index
        self.searchScore = searchScore
        self.linkURL = linkURL
    }
}

func solution(_ word:String, _ pages:[String]) -> Int {
    var pageInfos: [[String]] = []
    var linkScores: [LinkScore] = []
    var scoreMap: [String: Int] = [:]
    for page in pages {
        let pageSplit = page.split(separator: "\n").map({String($0)})
        pageInfos.append(pageSplit)
    }
    print(pageInfos)
    for index in 0..<pageInfos.count {
        var url: String = ""
        var searchScore: Int = 0
        var linkURL: [String] = []
        for i in 0..<pageInfos[index].count {
            let html = pageInfos[index][i]
            if html.hasPrefix("  <meta ") {
                let temp = html.split(separator: "\"").map({String($0)})
                for code in temp {
                    if code.hasPrefix("https") {
                        url = code
                    }
                }
            } else if html.hasPrefix("<a href") {
                let temp = html.split(separator: "\"").map({String($0)})
                for code in temp {
                    if code.hasPrefix("https") {
                        let linkScore = scoreMap[code, default: 0]
                        scoreMap[code] = linkScore + 1
                        linkURL.append(code)
                    }
                }
            } else if !html.hasPrefix("  ") && !html.hasPrefix("<") {
                let word = word.lowercased()
                let temp = html.split(separator: " ").map({String($0)})
                for code in temp {
                    if code.lowercased() == word {
                        searchScore += 1
                    }
                }
            }
        }
        linkScores.append(LinkScore(url: url, index: Float(index), searchScore: Float(searchScore), linkURL: linkURL))
    }

    for i in 0..<linkScores.count {
        let linkScore: Float = Float(linkScores[i].searchScore) / Float(linkScores[i].linkURL.count)
        for url in linkScores[i].linkURL {
            for j in 0..<linkScores.count {
                if linkScores[j].url == url {
                    linkScores[j].linkScore += linkScore
                    break
                }
            }
        }
    }
    var maxScore: Float = 0
    for i in 0..<linkScores.count {
        let matchingScore = linkScores[i].searchScore + linkScores[i].linkScore
        linkScores[i].matchingScore = matchingScore
        print(matchingScore)
        maxScore = max(maxScore, matchingScore)
    }
    
    for i in 0..<linkScores.count {
        if linkScores[i].matchingScore == maxScore {
            return i
        }
    }
    
    return 0
}

//print(solution("blind",
//               ["<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://a.com\"/>\n</head>  \n<body>\nBlind Lorem Blind ipsum dolor Blind test sit amet, consectetur adipiscing elit. \n<a href=\"https://b.com\"> Link to b </a>\n</body>\n</html>",
//                "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://b.com\"/>\n</head>  \n<body>\nSuspendisse potenti. Vivamus venenatis tellus non turpis bibendum, \n<a href=\"https://a.com\"> Link to a </a>\nblind sed congue urna varius. Suspendisse feugiat nisl ligula, quis malesuada felis hendrerit ut.\n<a href=\"https://c.com\"> Link to c </a>\n</body>\n</html>",
//                "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://c.com\"/>\n</head>  \n<body>\nUt condimentum urna at felis sodales rutrum. Sed dapibus cursus diam, non interdum nulla tempor nec. Phasellus rutrum enim at orci consectetu blind\n<a href=\"https://a.com\"> Link to a </a>\n</body>\n</html>"]))

print(solution("Muzi", ["<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://careers.kakao.com/interview/list\"/>\n</head>  \n<body>\n<a href=\"https://programmers.co.kr/learn/courses/4673\"></a>#!MuziMuzi!)jayg07con&&\n\n</body>\n</html>",
                        "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://www.kakaocorp.com\"/>\n</head>  \n<body>\ncon%\tmuzI92apeach&2<a href=\"https://hashcode.co.kr/tos\"></a>\n\n\t^\n</body>\n</html>"]))
