//
//  SlidingWindow.swift
//  Experiment
//
//  Created by Abdullah on 25/06/2024.
//

import Foundation
func runSlidingWindow() {
//    let ans = maximumSumOfSubArraysWithTheSubArray(arr: [ 1, 4, 2, 10, 2, 3, 1, 0, 20 ], k: 4)
//    print(ans)
    
    let ans = getSubarrayBeauty2([1,-1,-3,-2,3], 3, 2)
    print(ans)
}
//Sliding window technique
// User case => To find the maximum sum of all subarrays of size K:
//arr = [ 1, 4, 2, 10, 2, 3, 1, 0, 20 ] k = 4;
// output: 24
func maximumSumOfSubArrays(arr: [Int], k: Int) -> Int {
    var currentSum = 0
    var maxSum = 0
    var endIndex = k - 1
    var startIndex = 0
    while endIndex < arr.count {
        
        currentSum = arr[startIndex...endIndex].reduce(0,+)
        if currentSum > maxSum {
            maxSum = currentSum
        }
        endIndex = endIndex + 1
        startIndex = startIndex + 1
    }
    return maxSum
}

// Return the maxsum with the subarray
func maximumSumOfSubArraysWithTheSubArray(arr: [Int], k: Int) -> (Int, [Int]){
    var currentSum = 0
    var maxSum = 0
    var endIndex = k - 1
    var startIndex = 0
    while endIndex < arr.count {
        
        currentSum = arr[startIndex...endIndex].reduce(0,+)
        if currentSum > maxSum {
            maxSum = currentSum
        }
        endIndex = endIndex + 1
        startIndex = startIndex + 1
    }
    return (maxSum, Array(arr[startIndex-1...endIndex-1]))
}


/**
 You are given an integer array nums consisting of n elements, and an integer k.

 Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

 Example 1:

 Input: nums = [1,12,-5,-6,50,3], k = 4
 Output: 12.75000
 Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
 Example 2:

 Input: nums = [5], k = 1
 Output: 5.00000

 Constraints:

 n == nums.length
 1 <= k <= n <= 105
 -104 <= nums[i] <= 104
 */
func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    var endIndex = k - 1
    var startIndex = 0
    var maxAverage: Double = Double(nums[startIndex...endIndex].reduce(0,+))/Double(k)
    startIndex = startIndex + 1
    endIndex = endIndex + 1
    while (endIndex < nums.count) {
        var tempMaxAverage = Double(nums[startIndex...endIndex].reduce(0,+))/Double(k)
        
        if tempMaxAverage > maxAverage {
            maxAverage = tempMaxAverage
        }
        startIndex = startIndex + 1
        endIndex = endIndex + 1
    }
    maxAverage = Double(String(format: "%.5f", maxAverage))!
    return maxAverage
    
}

/**
 Given a string s, find the length of the longest
 substring
  without repeating characters.

  

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
  

 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */
func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.isEmpty || s.count == 0 {
        return 0
    }
    if s.count == 1{
        return 1
    }
    
    
    var maxLength = 0
    var i = 0
    var j = 0
    let n = s.count // Assuming 's' is the string to process
    var visitedDict = s.reduce(into: [Character: Bool]()){$0[$1] = false}
    let sArray = Array(s)
    
    
    while i < n {
        if visitedDict[sArray[i]]! {
            while (visitedDict[sArray[i]]!) {
                visitedDict[sArray[j]] = false
                j = j + 1
            }
        }
        visitedDict[sArray[i]] = true
        maxLength = max(maxLength, i - j + 1)
        i = i + 1
    }
    return maxLength
}

/**
 209. Minimum Size Subarray Sum
 Solved
 Medium
 Topics
 Companies
 Given an array of positive integers nums and a positive integer target, return the minimal length of a
 subarray
  whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

  

 Example 1:

 Input: target = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.
 Example 2:

 Input: target = 4, nums = [1,4,4]
 Output: 1
 Example 3:

 Input: target = 11, nums = [1,1,1,1,1,1,1,1]
 Output: 0
 */
func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var l = 0
    var r = 0
    var numsLength = nums.count
    var maxLength = numsLength + 1
    var sum = 0
    while (l < numsLength) {

        if (r < numsLength && sum < target) {
            sum = sum + nums[r]
            r = r + 1
        }
        else {
            sum = sum - nums[l]
            l = l + 1
        }

        if (sum >= target) {
            maxLength = min(maxLength, (r-1) - l + 1)
        }
        
    }
    return maxLength == numsLength + 1 ? 0 : maxLength
}

//let target = 7
//let nums = [2, 3, 1, 2, 4, 3]
//print(minSubArrayLenWithSubArray(target, nums))  // Output: 2

func minSubArrayLenWithSubArray(_ target: Int, _ nums: [Int]) -> (Int, [Int]) {
    var l = 0
    var r = 0
    let numsLength = nums.count
    var maxLength = numsLength + 1
    var sum = 0
    var minSubArray: [Int] = []
    while (l < numsLength) {

        if (r < numsLength && sum < target) {
            sum = sum + nums[r]
            r = r + 1
        }
        else {
            sum = sum - nums[l]
            l = l + 1
        }

        if (sum >= target) {
            maxLength = min(maxLength, (r-1) - l + 1)
            minSubArray = Array(nums[l...r-1])
        }
        
    }
    maxLength = maxLength == numsLength + 1 ? 0 : maxLength
    
    return (maxLength,minSubArray)
}


/**
 The problem differs from the problem of finding the longest subsequence with k distinct characters. Unlike subsequences, substrings are required to occupy consecutive positions within the original string.

  For example, consider string abcbdbdbbdcdabd.

 For k = 2, o/p is ‘bdbdbbd’
 For k = 3, o/p is ‘bcbdbdbbdcd’
 For k = 5, o/p is ‘abcbdbdbbdcdabd’
 THis is solved using sliding windown technique
 
 // Test cases
 let s = "abcbdbdbbdcdabd"
 print(longestSubstringWithKDistinctCharacters(s: s, k: 2)) // Output: "bdbdbbd"
 print(longestSubstringWithKDistinctCharacters(s: s, k: 3)) // Output: "bcbdbdbbdcd"
 print(longestSubstringWithKDistinctCharacters(s: s, k: 5)) // Output: "abcbdbdbbdcdabd"
 
 
 Input: Str = “aabbcc”, k = 1
 Output: 2
 Explanation: Max substring can be any one from {“aa” , “bb” , “cc”}.

 Input: Str = “aabbcc”, k = 2
 Output: 4
 Explanation: Max substring can be any one from {“aabb” , “bbcc”}.

 Input: Str = “aabbcc”, k = 3
 Output: 6
 Explanation:
 There are substrings with exactly 3 unique characters
 {“aabbcc” , “abbcc” , “aabbc” , “abbc” }
 Max is “aabbcc” with length 6.

 Input: Str = “aaabbb”, k = 3
 Output: Not enough unique characters
 Explanation: There are only two unique characters, thus show error message.
 
 */

func longestSubstringWithKDistinctCharacters(s: String, k: Int) -> String {
    let n = s.count
    if n == 0 || k == 0 {
        return ""
    }
    
    var left = 0
    var right = 0
    var maxLength = 0
    var maxSubstring = ""
    var charFrequency: [Character: Int] = [:]
    let chars = Array(s)
    
    if (k > Set(s).count) {
        return s
    }
    while right < n {
        let rightChar = chars[right]
        charFrequency[rightChar, default: 0] += 1
        right += 1
        
        while charFrequency.count > k {
            let leftChar = chars[left]
            charFrequency[leftChar, default: 0] -= 1
            if charFrequency[leftChar] == 0 {
                charFrequency.removeValue(forKey: leftChar)
            }
            left += 1
        }
        
        if charFrequency.count == k {
            let currentLength = right - left
            if currentLength > maxLength {
                maxLength = currentLength
                maxSubstring = String(chars[left..<right])
            }
        }
    }
    
    return maxSubstring
}

//ababbc
func longestSubstring(_ s: String, _ k: Int) -> Int {
        var r = 0
        var l = 0
    var total = s.count
    var charArray = Array(s)
    var charFreq: [Character: Int] = [:]
    var subArray = ""
    while r < total {
        let rChar = charArray[r]
        charFreq[charArray[r], default:0] += 1
        r+=1
        
        if charFreq[rChar]! >= k {
            //charFreq[rChar]! = charFreq[rChar]! - 1
            
            subArray = subArray + String(charArray[l..<r])
            l=r
            //l =
        }
        
       
        
    }
    for (key,v) in charFreq {
        if v < k {
            return 0
        }
    }
    return subArray.count
}


func getSubarrayBeauty(_ nums: [Int], _ k: Int, _ x: Int) -> [Int] {
    var result = [Int]()
    var deque = [Int]()
    
    for i in 0..<nums.count {
        // Add new element (if it's negative) to the deque
        if nums[i] < 0 {
            deque.append(nums[i])
            deque = deque.sorted()
//            var left = 0
//            var right = deque.count
//            // Binary search to insert while keeping the deque sorted
//            while left < right {
//                let mid = (left + right) / 2
//                if deque[mid] < nums[i] {
//                    left = mid + 1
//                } else {
//                    right = mid
//                }
//            }
//            deque.insert(nums[i], at: left)
        }
        
        // Remove the element that is out of the window from the deque
        if i >= k && nums[i - k] < 0 {
            if let index = deque.firstIndex(of: nums[i - k]) {
                deque.remove(at: index)
            }
        }
        
        // Once the window size is at least `k`
        if i >= k - 1 {
            // Check if there are enough negative numbers
            if deque.count >= x {
                result.append(deque[x - 1])
            } else {
                result.append(0)
            }
        }
    }
    
    return result
}

func getSubarrayBeauty2(_ nums: [Int], _ k: Int, _ x: Int) -> [Int] {
    var result = [Int]()
    
    var sortedArr = nums[0..<k].sorted()
    if sortedArr[x-1] < 0 {
        result.append(sortedArr[x-1])
    }
    else {
        result.append(0)
    }
    
    for i in k..<nums.count {
        if let index = sortedArr.firstIndex(of: nums[abs(k-i)]) {
            sortedArr.remove(at: index)
        }
        
        //if sortedArr.count > 1 {
            var insertIndex = 0
            var end = sortedArr.count
            while insertIndex < end {
                var mid = (insertIndex + end) / 2
                if sortedArr[mid] < nums[i] {
                    insertIndex  = insertIndex + 1
                }
                else {
                    end = mid
                }
            }
            sortedArr.insert(nums[i], at: insertIndex)
        //}
        
        if sortedArr[x-1] < 0 {
            result.append(sortedArr[x-1])
        }
        else {
            result.append(0)
        }
    }
    return result
}
