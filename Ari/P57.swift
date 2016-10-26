//
//  P57.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/23.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

class P57: Base {

    let n: Int
    let m: Int

    let s: [Character]
    let t: [Character]

    var dp: [[Int]] = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 1001), count: 1001)

    fileprivate init(s: String, t: String) {
        self.s = Array(s.characters)
        self.t = Array(t.characters)

        self.n = self.s.count
        self.m = self.t.count
    }

    static func main() {
        P57(s: "abcd", t: "becd").main()
    }

    func main() {
        (0 ..< n).forEach { (i) in
            (0 ..< m).forEach({ (j) in
                if s[i] == t[j] {
                    dp[i + 1][j + 1] = dp[i][j] + 1
                } else {
                    dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j])
                }
            })
        }
        print(dp[n][m])
    }
}
