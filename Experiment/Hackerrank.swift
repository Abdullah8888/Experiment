//
//  Hackerrank.swift
//  Experiment
//
//  Created by Abdullah on 05/12/2021.
//

import Foundation
class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?
    init(data: Int) {
        self.data = data
    }
}

class SinglyLinkedList {
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?
    var ll: SinglyLinkedListNode?
    var isEmpty: Bool {
        return head == nil
    }
    var first: Bool {
        return head == nil
    }
    var last: Bool {
        return head == nil
    }
    func insertNodeAtPosition(llist: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
        
        if position == 0 {
            llist?.data = data
            
        }
        else {
            
        }
        return llist
    }
    
    func append(data: Int) {
        let newNode = SinglyLinkedListNode(data: data)
//
//        if let tailNode = tail {
//            newNode.next = tailNode
//        }
//        else {
//            head = newNode
//        }
//        tail = newNode
//        if let df = ll {
//            df.next = newNode
//        }
//        else {
            ll = newNode
        //}
    }
    
    func remove() {
        
    }
    
}

extension SinglyLinkedList: CustomStringConvertible {
  // 2
  public var description: String {
    // 3
    var text = "["
    var node = head
    // 4
    while node != nil {
      text += "\(node!.data)"
      node = node!.next
      if node != nil { text += ", " }
    }
    // 5
    return text + "]"
  }
}

func nextMultipleOfFive(x: Int) -> Int {
    return x + ((2-(x % 2)) % 2)
}

func nextMultipleOfFivee(x: Int) -> Int {
    return ((x / 5) + 1) * 5
}


/*
 * Complete the 'repeatedString' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts following parameters:
 *  1. STRING s
 *  2. LONG_INTEGER n
 */

func repeatedString(s: String, n: Int) -> Int {
    // Write your code here
    if s == "a" {
        return n
    }
    var r = 0
    let len = s.count
    for i in 0..<len {
        let index = s.index(s.startIndex, offsetBy: i)
        if s[index] == "a" {
            r+=1
        }
    }
    r*=(n/len)
    for i in 0..<(n%len) {
        let index = s.index(s.startIndex, offsetBy: i)
        if s[index] == "a" {
            r+=1
        }
    }
    return r
}

func asdf() {

    var aa = "fcrxzwscanmligyxyvym"
    var bb = "jxwtrhvujlmrpdoqbisbwhmgpmeoke"
    var a: Character = "a"
    var aa1 = Set(aa)
    var bb2 = Set(bb)
    var df = aa1.intersection(bb2)
    print(df)
    var arr = Array(repeating: 0, count: 26)
    
    for (_, el) in aa.enumerated() {
        arr[Int(el.asciiValue! - a.asciiValue!)] += 1
    }
    
    for rl in df {
        let range1 = aa.range(of: String(rl), options: .literal)
        let range2 = bb.range(of: String(rl), options: .literal)
        aa = aa.replacingCharacters(in: range1!, with: "")
        bb = bb.replacingCharacters(in: range2!, with: "")
    }
}


func makeAnagram(a: String, b: String) -> Int {
    // Write your code here
    let aChar: Character = "a"
    var arr = Array(repeating: 0, count: 26)
    
    for el in a {
        arr[Int(el.asciiValue! - aChar.asciiValue!)] += 1
    }
    for el in b {
        arr[Int(el.asciiValue! - aChar.asciiValue!)] -= 1
    }
    return arr.reduce(0){$0 + abs($1)}
}

func alternatingCharacters(s: String) -> Int {
    // Write your code here
    if !s.contains("A") || !s.contains("B") {
        return s.count - 1
    }
    var countDeletions = 0
    let arr = Array(s)
    for (index, el) in arr.enumerated() {
        if index > 0 {
            if el == arr[index-1] {
                countDeletions += 1
            }
        }
    }
    return countDeletions
}

/*
 * Complete the 'isValid' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */
func isValid1(s: String) -> String {
    // Write your code here
    
    let charFreq2 = s.reduce(into: [Character: Int]()) {
        curr, next in
        curr[next, default:1] = curr[next] != nil ? curr[next, default:1] + 1 : 1
    }
    
    let sArr = Array(s)
    let charFreq = sArr.reduce(into: [Character: Int]()) {
        curr, next in
        curr[next] = curr[next] != nil ? curr[next]! + 1 : 1
    }
    let dd = Array(charFreq.keys)
    var set = Set<Int>()
    for dd in charFreq.values {
        let fg = dd + 1
        set.insert(dd)
    }
    var frqs = Array(charFreq.values).sorted()
    frqs[frqs.count-1] = frqs.max()! - 1
    let ds = Set(frqs)
    return ds.count == 1 ? "YES" : "NO"
}

func isValid2(s: String) -> String {
    // Write your code here
    let sArr = Array(s)
    let charFreq = sArr.reduce(into: [Character: Int]()) {
        curr, next in
        curr[next, default:1] = curr[next] != nil ? curr[next, default:1] + 1 : 1
        
    }

    let frqs = charFreq.values
    if Set(frqs).count == 1 {
        return "YES"
    }
    var frqss = frqs.sorted()
    if frqss[0] < frqss[1] {
        let num = frqss[0] - 1
        if num == 0 {
            let firstEl = frqss.remove(at: 0)
            if Set(frqss).count == 1 {
                return "YES"
            }
            else {
                frqss.insert(firstEl, at: 0)
            }
        }
    }
    
    frqss[frqss.count-1] = frqss.max()! - 1
    return Set(frqss).count == 1 ? "YES" : "NO"
}
