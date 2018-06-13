import UIKit

/*
 Question 1 -- sortByStrings(s,t): Sort the letters in the string s by the order they occur in the string t. You can assume t will not have repetitive characters. For s = "weather" and t = "therapyw", the output should be sortByString(s, t) = "theeraw". For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg".
 */

func sortByStrings(s: String, t: String) -> String {
    
    var frequencyDict = [Character : Int]()
    
    for letter in s {
        if frequencyDict[letter] != nil {
            frequencyDict[letter] = frequencyDict[letter]! + 1
        }  else {
            frequencyDict[letter] = 1
        }
    }
    
    var sortedString = ""
    
    for letter in t {
        if frequencyDict[letter] != nil {
            sortedString += String(repeating: letter, count: frequencyDict[letter]!)
        }
    }
    
    return sortedString
}

let s1 = "weather"
let t1 = "therapyw"

sortByStrings(s: s1, t: t1)

let s2 = "good"
let t2 = "odg"

sortByStrings(s: s2, t: t2)
