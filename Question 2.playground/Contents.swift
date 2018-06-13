import UIKit

/*
 Question 2 -- decodeString(s): Given an encoded string, return its corresponding decoded string.
 
 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is repeated exactly k times. Note: k is guaranteed to be a positive integer.
 
 For s = "4[ab]", the output should be decodeString(s) = "abababab"
 For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"
 */


func splitNumbersAndLetters(s: String) -> (Int?, String) {
    var number = ""
    var letters = ""
    
    for character in s {
        switch character {
        case _ where Int(String(character)) != nil:
            number += String(character)
        default:
            letters += String(character)
        }
    }
    
    if number.isEmpty {
        return (nil, letters)
    } else {
        return (Int(number)!, letters)
    }
}

func turnInstructionArrayIntoString(a: inout [String], s: String) -> String {
    guard a.count > 1 else { return a[0] }
    
    let split = splitNumbersAndLetters(s: a.removeFirst())
    
    if let number = split.0 {
        return s + split.1 + String(repeating: turnInstructionArrayIntoString(a: &a, s: s), count: number)
    } else {
        return s + split.1 + turnInstructionArrayIntoString(a: &a, s: s)
    }
}

func decodeString(s: String) -> String {
    guard !s.isEmpty else { return "" }
    
    let bracketCharacterSet = CharacterSet(charactersIn: "[]")
    var instructionArray = s.components(separatedBy: bracketCharacterSet).filter(){ $0 != "" }
    
    return turnInstructionArrayIntoString(a: &instructionArray, s: "")
}

var s = "4[ab]"
decodeString(s: s)

var s2 = "2[b3[a]]"
decodeString(s: s2)

