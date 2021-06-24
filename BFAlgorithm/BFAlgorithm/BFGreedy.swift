//
//  BFGreedy.swift
//  BFAlgorithm
//
//  Created by blackstone jericho on 2021/6/17.
//

import UIKit

class BFGreedy: NSObject {
    
    /*
     122. Best Time to Buy and Sell Stock II
     */
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        
        var result = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i-1] {
                result += prices[i] - prices[i - 1]
            }
        }
        
        return result
    }
    
    /*
     392. Is Subsequence
     */
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s == t {
            return true
        }
        
        guard s.count < t.count else {
            return false
        }
        
        let sList = Array(s)
        let tList = Array(t)

        var i = 0
        var j = 0
        
        while i < sList.count && j < tList.count {
            if sList[i] == tList[j] {
                i += 1
            }
            j += 1
        }
        
        return i == sList.count
    }
    
    /*
     455. Assign Cookies
     */
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        if s.count == 0 || g.count == 0 {
            return 0
        }
        
        
        let children:[Int] = g.sorted()
        let cookies:[Int] = s.sorted()
        
        if children.first! > cookies.last! {
            return 0
        }
        
        var ci = 0
        var gi = 0
        
        while ci < children.count  && gi < cookies.count  {
            if children[ci] <= cookies[gi] {
                ci += 1
            }
            gi += 1
        }
        
        return ci
    }
    
    /*
     605. Can Place Flowers
     */
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        if n == 0 {
            return true
        }
        if n > flowerbed.count / 2 + 1 {
            return false
        }
        
        if flowerbed.count == 1 && n == 1 && flowerbed.first == 0 {
            return true
        }
        
        var flower = flowerbed
        
        var current = n
        
        for i in 0..<flower.count {
            if  flower[i] == 0 {
                if i == 0  && flower[i+1] == 0{
                  current = current-1
                  flower[i] = 1
                } else if i == flower.count - 1 && flower[i-1] == 0{
                    current = current - 1
                    flower[i] = 1
                } else if  i > 0 && i < flower.count - 1 && flower[i-1] == 0 && flower[i+1] == 0  {
                    current = current - 1
                    flower[i] = 1
                }
            }
            if current == 0 {
                return true
            }
        }
        
        return current == 0
    }
}
