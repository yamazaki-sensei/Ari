//
//  P71.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/10/26.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import Cocoa

class P71: Base {

    var sz = 0
    var heap = [Int](repeating: 0, count: 1000)

    class func main() {
        P71().main()
    }

    func main() {
        push(x: 3)
        push(x: 1)
        push(x: 4)
        push(x: 9)
        push(x: 7)
        push(x: 8)
        push(x: 4)

        print(heap)
    }

    func push(x: Int) {
        sz += 1
        var i = sz

        while 0 < i {

            let p = (i - 1) / 2
            if heap[p] <= x {
                break
            }

            heap[i] = heap[p]
            i = p
        }
        heap[i] = x
    }

    func pop() -> Int {
        let ret = heap[0]

        let x = heap[sz - 1]
        sz -= 1

        var i = 0
        while i * 2 + 1 < sz {
            var a = i * 2 + 1, b = i * 2 + 2
            if b < sz && heap[b] < heap[a] {
                a = b
            }

            if x <= heap[a] {
                break
            }

            heap[i] = heap[a]
            i = a
        }

        heap[i] = x
        return ret
    }
}
