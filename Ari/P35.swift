//
//  P35.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/16.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

/*
 Input :
 n
 a
 k
 */


class P35:Base {

    let n: Int
    let a: [Int]
    let k: Int

    init(a: [Int], k: Int) {
        self.n = a.count
        self.a = a
        self.k = k

    }

    func main() {
        solve()
    }

    func solve() {
        let result = dfs(0, sum: 0)
        print(result)
    }

    func dfs(i: Int, sum: Int) -> Bool {
        guard i != n else {
            return sum == k
        }

        if dfs(i + 1, sum: sum) {
            return true
        }

        if dfs((i + 1), sum: sum + a[i]) {
            return true
        }

        return false

    }
}