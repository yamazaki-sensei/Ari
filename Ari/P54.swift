//
//  P54.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/23.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

class P54: Base {

    typealias Prop = (w: Int, v: Int)

    let n: Int
    let items: [Prop]
    let W: Int

    var dp: [[Int]] = Array<Array<Int>>(count: 200, repeatedValue: Array<Int>(count: 200, repeatedValue: 0))

    init(items: [Prop], W: Int) {
        self.n = items.count
        self.items = items
        self.W = W
    }

    static func main() {
        P54(items: [(2, 3), (1, 2), (3, 4), (2, 2)], W: 5).main()
    }

    func main() {
        print(rec(0, j: W))
    }

    func rec(i: Int, j: Int) -> Int {
        (0 ... n - 1).reverse().forEach { i in
            (0 ... W).forEach({ j in
                if j < self.items[i].w {
                    dp[i][j] = dp[i + 1][j]
                } else {
                    dp[i][j] = max(dp[i + 1][j], dp[i + 1][j - items[i].w] + items[i].v)
                }
            })
        }

        return dp[0][W]
    }
}