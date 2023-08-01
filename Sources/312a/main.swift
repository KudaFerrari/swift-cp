let set = Set.init(arrayLiteral: "ACE", "BDF", "CEG", "DFA", "EGB", "FAC", "GBD")

let input = readLine()!
if set.contains(input) {
    print("Yes")
} else { 
    print("No")
}

