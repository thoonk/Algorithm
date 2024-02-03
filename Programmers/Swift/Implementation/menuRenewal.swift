// 메뉴 리뉴얼 / 72411

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var courseDict = [String: Int]()
    var result = [String]()
    
    func comb(_ index: Int, _ depth: Int, _ count: Int, _ order: [Character], _ temp: String) {
        if depth == count {
            courseDict[temp] = (courseDict[temp] ?? 0) + 1
        }
        
        for i in index..<order.count {
            comb(i + 1, depth + 1, count, order, temp + String(order[i]))
        }
    }
    
    for count in course {
        for order in orders where order.count >= count {
            comb(0, 0, count, Array(order).sorted(by: <), "")
        }
    }
        
    for count in course {
        let sortedCourse = courseDict.filter { $0.key.count == count && $0.value > 1 }
            .sorted { $0.value > $1.value }
        if sortedCourse.isEmpty == true { continue }
        
        let maxCount = sortedCourse.first!.value
        result.append(contentsOf: sortedCourse.filter { $0.value == maxCount }.map { $0.key })
    }
    
    return result.sorted(by: <)
}

print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])) // ["AC", "ACDE", "BCFG", "CDE"]
