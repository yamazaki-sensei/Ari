//
//  P61.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/30.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

private let MAX_N = 100
private let MAX_V = 100
class P61: Base {
    typealias Prop = (w: Int64, v: Int64)

    let n: Int
    let items: [Prop]
    let W: Int64

    var dp: [[Int64]] = Array<Array<Int64>>(repeating: Array<Int64>(repeating: Int64.max / 2, count: MAX_N * MAX_V + 1), count: MAX_N + 1)

    fileprivate init(items: [Prop], W: Int64) {
        self.n = items.count
        self.items = items
        self.W = W
    }

    static func main() {
        P61(items: [(w: 2, v: 3), (w:1, v: 2), (w: 3, v: 4), (w: 2, v: 2)], W: 5).main()
    }

    func main() {
        dp[0][0] = 0

        (0 ..< n).forEach { i in
            (0 ... MAX_N * MAX_V).forEach({ j in
                let lj = Int64(j)
                if lj < items[i].v {
                    dp[i + 1][j] = dp[i][j]
                } else {
                    dp[i + 1][j] = min(dp[i][j], dp[i][j - Int(items[i].v)] + items[i].w)
                }
            })
        }

        var res = 0
        (0 ... MAX_N * MAX_V).forEach { (i) in
            print(dp[n][i])
            if dp[n][i] <= W {
                res = i
            }
        }

        print(res)
    }

}
