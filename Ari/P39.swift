//
//  P39.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/17.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import Cocoa

final class P39:Base {

    static func main() {
        P39(n: 10).main()

    }

    var used: [Bool]
    var perm: [Int]
    let n: Int
    fileprivate init(n: Int) {
        used = Array<Bool>(repeating: false, count: n)
        perm = Array<Int>(repeating: -1, count: n)
        self.n = n
    }

    func main() {
        permutation1(0, n: n)
    }

    func permutation1(_ pos: Int, n: Int) {
        guard pos != n else {
            return
        }

        for i in 0 ..< n {
            if !used[i] {
                perm[pos] = i
                used[i] = true
                permutation1(pos + 1, n: n)
                used[i] = false
            }
        }
    }
}
