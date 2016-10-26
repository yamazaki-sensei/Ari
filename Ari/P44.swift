//
//  P44.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/19.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

private let MAX_N = 100000

class P44: Base {
    let N: Int
    let S: [Int], T:[Int]
    var itv: [(Int, Int)]

    fileprivate init(S: [Int], T: [Int]) {
        self.S = S
        self.T = T
        self.N = S.count

        itv = Array<(Int, Int)>(repeating: (0, 0), count: N)
    }

    static func main() {
        P44(S: [1, 2, 4, 6, 8], T: [3, 5, 7, 9, 10]).main()
    }

    func main() {
        (0 ..< N).forEach { (i) in
            itv[i].0 = T[i]
            itv[i].1 = S[i]
        }

        itv = itv.sorted(by: { (obj1, obj2) -> Bool in
            obj1.0 <= obj2.0
        })

        var ans = 0, t = 0
        (0 ..< N).forEach { (i) in
            if t < itv[i].1 {
                ans += 1
                t = itv[i].0
            }
        }

        print(ans)
    }
}
