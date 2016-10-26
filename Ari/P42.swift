//
//  P42.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/18.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

final class P42: Base {
    let V = [1, 5, 10, 50, 100, 500]
    let C = [3, 2, 1, 3, 0, 2]
    var A = 620

    static func main() {
        P42().main()
    }

    func main() {
        var ans = 0
        for i in (0 ... 5).reversed() {
            let t = min(A / V[i], C[i])
            A -= t * V[i]
            ans += t
        }

        print(ans)
    }
}
