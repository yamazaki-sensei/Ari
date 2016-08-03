//
//  P65.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/08/03.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//


class P65: Base {

    static func main() {
        P65(a: [4, 2, 3, 1, 5]).main()
    }

    let INF = 1000001
    let a: [Int]
    init(a: [Int]) {
        self.a = a
    }

    func main() {
        var dp = Array<Int>(count: a.count, repeatedValue: INF)
        (0 ..< a.count).forEach { i in
            let target = try! dp.lowerBound(a[i])
            dp[target] = a[i]
        }

        print(try! dp.lowerBound(INF))
    }
}