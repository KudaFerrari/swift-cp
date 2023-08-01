let limits = readLine()!.split(separator: " ").map { Int($0)! }
let rows = limits[0]
let cols = limits[1]

var board = [[Bool]]()

for _ in 0 ..< rows { 
    let line = readLine()!
    var tempRow = Array(repeating: false, count: cols)
    for (i, c) in line.enumerated() {
        if c == "#" {
            tempRow[i] = true
        }
    }
    board.append(tempRow)
}

func isTaK(row: Int, col: Int) -> Bool { 
    let brow = row + 8
    let bcol = col + 8
    guard row >= 0, brow <= board.count - 1,
          col >= 0, bcol <= board[0].count - 1
    else { return false }

    for r in row ... row + 2 { // tl corner
        for c in col ... col + 2 {
            if board[r][c] == false { return false }
        }
        if board[row][col+3] { return false } // tl adj col
    } 

    // tl adj row
    for _ in col ... col + 3 {
        if board[row+3][col] { return false } 
    }

    // br corner
    for r in brow-2 ... brow { 
        for c in bcol-2 ... bcol {
            if board[r][c] == false { return false }
        }
    }

    // br adj row
    for c in bcol-3 ... bcol {
        if board[brow-3][c] { return false }
    } 

    // br adj col
    for r in brow-2 ... brow {
        if board[r][bcol-3] { return false }
    }
    return true
}

func foo(a: Int) {

}

for r in 0 ... rows - 1 {
    for c in 0 ... cols - 1 {
        if isTaK(row: r, col: c) {
            print(r+1, c+1)
        }
    }
}


