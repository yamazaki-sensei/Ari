//
//  P66.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/10/26.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import Cocoa

class P66: Base {

    class func main() {
        P66().main()
    }

    let n = 900
    let m = 800
    let M = 1000
    var dp: [[Int]]
    init() {
        dp = [[Int]](repeatElement([Int](repeatElement(0, count: 1001)), count: 1001))
    }

    func main() {
        dp[0][0] = 1
        (1 ... m).forEach { i in
            (0 ... n).forEach { j in
                if 0 <= j - i {
                    dp[i][j] = (dp[i - 1][j] + dp[i][j - i]) % M
                } else {
                    dp[i][j] = dp[i - 1][j]
                }

            }
        }

        print("\(dp[m][n])")
    }
}
