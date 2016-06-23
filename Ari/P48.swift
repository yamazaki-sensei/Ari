//
//  P48.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/20.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

class P48: Base {

    var X: [Int]
    let R: Int
    let N: Int
    static func main() {
        P48(R: 10, X: [1, 7, 15, 20, 30, 50]).main()
    }

    private init(R: Int, X: [Int]) {
        self.R = R
        self.X = X
        self.N = X.count
    }

    func main() {
        X.sortInPlace()

        var i = 0, ans = 0

        while i < N {
            let s = X[i]
            i += 1

            while i < N && X[i] <= s + R {
                i += 1
            }

            let p = X[i - 1]
            while i < N && X[i] <= p + R {
                i += 1
            }

            ans += 1
        }
        print(ans)
    }
}