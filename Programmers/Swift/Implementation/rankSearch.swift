// 순위 검색 / 72412

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var infoDict = [String: [Int]]()
    var result = [Int]()
    
    func comb(_ index: Int, _ spec: [String]) {
        let score = Int(spec[4])!
        let key = "\(spec[0])\(spec[1])\(spec[2])\(spec[3])"
        var spec = spec
        
        if index == spec.count - 1 {
            if infoDict[key] != nil {
                infoDict[key]?.append(score)
            } else {
                infoDict[key] = [score]
            }
        } else {
            comb(index + 1, spec)
            spec[index] = "-"
            comb(index + 1, spec)
        }
    }
    
    for s in info {
        let spec = s.split(separator: " ").map { String($0) }
        comb(0, spec)
    }
    
    for (key, value) in infoDict {
        infoDict[key] = value.sorted()
    }
    
    for q in query {
        let cond = q.split(separator: " ").map { String($0) }.filter { $0 != "and" }
        let key = "\(cond[0])\(cond[1])\(cond[2])\(cond[3])"
        let target = Int(cond[4])!
        
        if let scores = infoDict[key] {
            var start = 0
            var end = scores.count - 1
            
            while start <= end {
                let mid = (start + end) / 2
                if scores[mid] < target {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
            result.append(scores.count - start)
        } else {
            result.append(0)
        }
    }

    return result
}

print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
