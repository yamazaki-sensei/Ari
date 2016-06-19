//
//  P47.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/20.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

class P47: Base {

    static func main() {
        P47(text: "ACDBCB").main()
    }

    let N: Int
    let S: [Character]

    init(text: String) {
        S = Array(text.characters)
        N = S.count
    }

    func main() {

        var a = 0, b = N - 1

        var ans = ""
//MARK: 辞書順比較
        while a <= b {
            var left = false
            for i in (0 ... b - a) {
                if S[a + i] < S[b - i] {
                    left = true
                    break
                } else if(S[b - i] < S[a + i]) {
                    left = false
                    break
                }
            }

            if left {
                ans += String(S[a])
                a += 1
            } else {
                ans += String(S[b])
                b -= 1
            }
        }

        print(ans)
    }
}