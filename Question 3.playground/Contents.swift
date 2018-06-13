import UIKit

/*
 Question 3 -- changePossibilities(amount,amount): Your quirky boss collects rare, old coins. They found out you're a programmer and asked you to solve something they've been wondering for a long time.
 
 Write a function that, given an amount of money and an array of coin denominations, computes the number of ways to make the amount of money with coins of the available denominations.
 
 Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations:
 
 1¢, 1¢, 1¢, 1¢
 1¢, 1¢, 2¢
 1¢, 3¢
 2¢, 2¢
 */

func changePossibilities(amount: Int, denominations: [Int], index: Int, memo: inout [String : Int]) -> Int {
    if amount == 0 { return 1 }
    if index >= denominations.count { return 0 }
    
    let key = "\(amount)-\(index)"
    
    if memo[key] != nil {
        return memo[key]!
    }
    
    var moneyUsed = 0
    var ways = 0
    
    while moneyUsed <= amount {
        let remaining = amount - moneyUsed
        ways += changePossibilities(amount: remaining, denominations: denominations, index: index + 1, memo: &memo)
        moneyUsed += denominations[index]
    }
    
    memo[key] = ways
    return ways
}

func changePossibilities(amount: Int, denominations: [Int]) -> Int {
    var memo = [String : Int]()
    return changePossibilities(amount: amount, denominations: denominations, index: 0, memo: &memo)
}

changePossibilities(amount: 4, denominations: [1,2,3])
