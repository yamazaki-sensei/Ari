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
    private init(n: Int) {
        used = Array<Bool>(count: n, repeatedValue: false)
        perm = Array<Int>(count: n, repeatedValue: -1)
        self.n = n
    }

    func main() {
        permutation1(0, n: n)
    }

    func permutation1(pos: Int, n: Int) {
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
