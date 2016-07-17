//
//  P63.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/30.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

private let MAX_K = 100_000
class P63: Base {

    var dp: [Int] = Array<Int>(count: MAX_K, repeatedValue: -1)
    var a: [Int]
    var m: [Int]
    var K: Int

    static func main() {
        P63(a: [3, 5, 8], m: [3, 2, 2], K: 17).main()
    }

    private init(a: [Int], m: [Int], K: Int) {
        self.a = a
        self.m = m
        self.K = K
    }

    func main() {
        dp[0] = 0

        (0 ..< a.count).forEach { i in
            (0 ... K).forEach({ j in
                if 0 <= dp[j] {
                    dp[j] = m[i]
                } else if j < a[i] || dp[j - a[i]] <= 0 {
                    dp[j] = -1
                } else {
                    dp[j] = dp[j - a[i]] - 1
                }
            })
        }

        if 0 <= dp[K] { print("Yes") }
        else { print("NO") }
    }
}