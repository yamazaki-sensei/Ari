//
//  P53.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/23.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

class P53: Base {

    typealias Prop = (w: Int, v: Int)

    let n: Int
    let items: [Prop]
    let W: Int

    var dp: [[Int]] = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: 200), count: 200)

    fileprivate init(items: [Prop], W: Int) {
        self.n = items.count
        self.items = items
        self.W = W
    }

    static func main() {
        P53(items: [(2, 3), (1, 2), (3, 4), (2, 2)], W: 5).main()
    }

    func main() {
        print(rec(0, j: W))
    }

    func rec(_ i: Int, j: Int) -> Int {
        if 0 <= dp[i][j] {
            return dp[i][j]
        }

        var res: Int

        if i == n {
            res = 0
        } else if j < items[i].w {
            res = rec(i + 1, j: j)
        } else {
            res = max(rec(i + 1, j: j), rec(i + 1, j: j - items[i].w) + items[i].v)
        }

        dp[i][j] = res
        return res
    }
}
