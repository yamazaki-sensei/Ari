//
//  P62.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/30.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

private let MAX_N = 100
private let MAX_K = 100_000

class P62: Base {

    let n: Int
    let a: [Int]
    let m: [Int]
    let K: Int

    init(a: [Int], m: [Int], K: Int) {
        n = a.count
        self.a = a
        self.m = m
        self.K = K
    }

    var dp: [[Bool]] = Array<[Bool]>(count: MAX_N + 1, repeatedValue: Array<Bool>(count: MAX_K + 1, repeatedValue: false))

    static func main() {
        P62(a: [3, 5, 8], m: [3, 2, 2], K: 17).main()
    }

    func main() {
        dp[0][0] = true
        (0 ..< n).forEach { (i) in
            (0 ... K).forEach({ (j) in
                var k = 0
                while k <= m[i] && k * a[i] <= j {
                    dp[i + 1][j] = dp[i + 1][j] || dp[i][j - k * a[i]]
                    k += 1
                }
            })
        }

        print(dp[n][K])
    }
}