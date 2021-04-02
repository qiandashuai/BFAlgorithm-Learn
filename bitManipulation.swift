// Missing Number 268

// Given an array nums containing n distinct number in the range [0,n], return the only number in the range that is missing from the array.

// follow up: could you implement a sloution using only O(1) extra space complexity and O(n) runtime complexity

class Solution {
    func missingNumber(_ numberarray:[Int]) -> Int {
        let length = numberarray.count
        var mutableArray:[Int] = Array(0...length);
            for number in numberarray {
                for (index,i) in mutableArray.enumerated() {
                    if number == i {
                        mutableArray.remove(at: index)
                    }
                }
            }
        return mutableArray[0];
    }
    // 上述写法已经超出时间限制了，所以应该需要找别的办法，再除了为运算之外还有别的好办法吗？有没有办法只便利一次呢？
    // 先加，求总合 再减，这样时间复杂度就只有 O(n) 了
    func missingNumber2(_ numberarray:[Int]) -> Int {
        let length = numberarray.count
        var totalSum = (length * (length + 1)) / 2
        
            for number in numberarray {
                totalSum -= number
            }
        return totalSum;
    }
    
    // 当然，异或运算
    
    func missingNumber3(_ nums:[Int]) -> Int {
        var miss = nums.count
        for i in 0..<miss {
            miss ^= i ^ nums[i]
        }

        return miss;
    }
    

}


// Dexode XORed Array 1720

/*
 there is a hidden integer array arr that consists of n non-negative integers
 it was encoded into another integer array encode of length n - 1, such that encode[i] = arra[i] XOR arr[i + 1]. for example if arr = [1,0,2,1]  that encoded = [1,2,3]
 you are given the encoded array, you are also given an integer first, that is the first element of arr, ie arr[0]
 return the origin array arr, i can be proved the answer exists and is unique.
 */

class Solution1720 {
    func decode(_ encoded: [Int], _ first: Int) -> [Int] {
        var result:[Int] = []
        result.append(first)
        for (i,item) in encoded.enumerated() {
            print("current index is \(i)-- current item is \(item)")
            let appendResult = result[i] ^ encoded[i]
            result.append(appendResult)
        }
        return result
    }
}


