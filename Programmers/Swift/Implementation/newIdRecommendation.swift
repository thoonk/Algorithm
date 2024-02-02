// 신규 아이디 추천 / 72410
import Foundation

func solution(_ new_id:String) -> String {
    var validatedId = new_id
        .lowercased()
        .filter {
            $0.isLetter || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "."
        }
    
    while validatedId.contains("..") {
    validatedId = validatedId.replacingOccurrences(of: "..", with: ".")
    }
    
    if validatedId.hasPrefix(".") { validatedId.removeFirst() }
    if validatedId.isEmpty { validatedId.append("a") }
    if validatedId.count >= 16 { validatedId = String(validatedId.prefix(15)) }
    if validatedId.hasSuffix(".") { validatedId.removeLast() }
    while validatedId.count <= 2 { validatedId.append(String(validatedId.last!)) }
    
    return validatedId
}

solution("...!@BaT#*..y.abcdefghijklm") //"bat.y.abcdefghi"

