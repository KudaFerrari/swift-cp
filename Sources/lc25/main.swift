public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public typealias ListGroup = (ListNode?, ListNode?)
public class Solution {
    
    public init(){ }

    public func reversed(_ head: ListNode) -> (ListNode, ListNode) {
        if head.next != nil && head.next!.next == nil {
            var temp = head.next!
            head.next = nil
            temp.next = head
            return (temp, head)
        }
        if head.next == nil { return (head, head) }
        var (rfirst, rlast) = reversed(head.next!)
        rlast.next = head
        head.next = nil
        return (rfirst, head)
    }

    public func groupList(_ head: ListNode?, _ k: Int) -> [ListGroup] {
        var result = [ListGroup]()
        var curr = head
        var last = head
        while curr != nil {
            var currGroup: ListGroup = (curr, nil)
            var count = 0
            while count < k {
                last = curr
                curr = curr?.next
                count += 1
            }
            currGroup.1 = last
            result.append(currGroup)
        }
        
        return result
    }

    public func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { return nil }

        var groups = groupList(head, k)
        for i in 0 ..< groups.count {
            if groups[i].0 != nil && groups[i].1 != nil {
                groups[i].1!.next = nil
                groups[i] = reversed(groups[i].0!)
            }
            if i > 0 {
                groups[i-1].1!.next = groups[i].0
            }
        }
        return groups[0].0
    }
}

