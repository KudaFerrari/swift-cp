import XCTest
import lc25

final class LC25Test: XCTestCase {
    func createList( _ numbers: [Int]) -> ListNode? { 

        var head: ListNode? = nil
        var last: ListNode? = nil

        for n in numbers {
            let node = ListNode(n)
            if head == nil {
                head = node
            } else {
                last!.next = node
            }
            last = node
        }

        return head
    }
    
    func traverse(_ node: ListNode?) {
        var curr = node
        var result = [Int]()
        while curr != nil {
            result.append(curr!.val)
            curr = curr!.next
        }
        print(result)
    }
    
    func testReverse(){
        let testCases = [
            [1],
            [1, 2],
            [1, 2, 3],
            [1, 2, 3, 4],
            [1, 2, 3, 4, 5],
        ]
        let solution = Solution()
        for tc in testCases {
            let list = createList(tc)
            let (rFirst, _) = solution.reversed(list!)
            traverse(rFirst)
        }
    }
    
    func testGroupList(){
        let testCases = [
            [1],
            [1, 2],
            [1, 2, 3],
            [1, 2, 3, 4],
            [1, 2, 3, 4, 5],
        ]
        let solution = Solution()
        for groupSize in 1 ... 5 {
            for tc in testCases {
                let list = createList(tc)
                print("groupList(\(tc), \(groupSize))")
                let results = solution.groupList(list, groupSize)
                for item in results {
                    print(item.0?.val, item.1?.val)
                }
            }
        }
    }

    func test() {
        let testCases: [([Int], Int)] = [
            ([1, 2, 3, 4, 5], 2),
            ([1, 2, 3, 4, 5, 6], 2),
        ]

        for tc in testCases {
            let head = createList(tc.0)
            let solution = Solution()
            let result = solution.reverseKGroup(head, tc.1)
            traverse(result)
        }
    }
}
