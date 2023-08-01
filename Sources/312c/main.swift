import Foundation
/*

3 4
   90     110 120 
80    100     120 10000

x = 90
seller = 1 (90)
buyer = 3 (100, 120, 10000)

x = 110
seller = 2 (110, 90)
buyer = 2 (120, 10000)

seller >= buyer
*/

let limits = readLine()!.split(separator: " ").map { Int($0)! }
let nsell = limits[0]
let nbuy = limits[1]

let psell = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: < )
let pbuy = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: < )


var uniquePricesSet = Set<Int>()
for p in psell { 
    uniquePricesSet.insert(p)
}
for p in pbuy { 
    uniquePricesSet.insert(p)
}

let unique = uniquePricesSet.sorted()

var S = Array(repeating: 0, count: unique.count)
var i = 0
var si = 0
// S
while si < psell.count {
    while unique[i] < psell[si] {
        print(unique[i], "<", psell[si])
        i += 1
        S[i] = S[i-1]
    }
    if unique[i] == psell[si] {
        print(unique[i], "==", psell[si])
        S[i] += 1
        si += 1
        print("S[\(i)] = ", S[i])
    } 
}
i += 1
while i < unique.count {
    print("i:", i, "<", unique.count)
    S[i] = S[i-1]
    print("S[\(i)] = ", S[i])
    i += 1
}

// 
var B = Array(repeating: 0, count: unique.count)
i = unique.count-1
var bi = pbuy.count-1
while bi >= 0 { 
    while unique[i] > pbuy[bi] {
        i -= 1
        B[i] = B[i+1]
    }
    if unique[i] == pbuy[bi] {
        B[i] += 1
        bi -= 1
    }
}
while i >= 0 {
    B[i] = B[i+1]
    i -= 1
}

i = -1 
while i+1 < unique.count, B[i+1] > S[i+1] {
    i += 1
}
print("i:", i);
print(min(unique[i]+1, unique[i+1]))

func printarr(_ arr: [Int]) -> String {
    var result = ""
    for a in arr {
        result += String(format: "%5d", a)
    }
    return result
}
print("unique:", printarr(unique))
print("S     :", printarr(S))
print("B     :", printarr(B))





