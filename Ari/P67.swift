//
//  P67.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/10/26.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import Cocoa

// このページあとでもう一度見る

class P67: Base {

    let n: Int
    let m: Int
    let a: [Int]
    let M: Int

    init(n: Int, m: Int, a: [Int], M: Int) {
        self.n = n
        self.m = m
        self.a = a
        self.M = M
    }

    class func main() {
        P67(n: 3, m: 3, a: [1, 2, 3], M: 10000).main()
    }

    func main() {
        var dp = [[Int]](repeatElement([Int](repeatElement(0, count: 1001)), count: 1001))

        (0 ... n).forEach { i in
            dp[i][0] = 1
        }

        (0 ..< n).forEach { i in
            (1 ... m).forEach { j in
                if 0 <= j - 1 - a[i] {
                    let x = dp[i + 1][j - 1] + dp[i][j] - dp[i][j - 1 - a[i]]
                    dp[i + 1][j] = (x + M) % M
                } else {
                    dp[i + 1][j] = (dp[i + 1][j - 1] + dp[i][j]) % M
                }
            }
        }
        print("\(dp[n][m])")
    }
}
