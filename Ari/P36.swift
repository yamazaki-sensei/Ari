//
//  P36.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/16.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

private let input =
    ["W........WW.\n",
     ".WWW.....WWW\n",
     "....WW...WW.\n",
     ".........WW.\n",
     "............\n",
     "..W......W..\n",
     ".W.W.....WW.\n",
     "W.W.W.....W.\n",
     ".W.W......W.\n",
     "..W.......W.\n"]

final class P36: Base {

    static func main() {
        P36(input: input).main()
    }

    var field: [[Character]]
    let M: Int
    let N: Int

    init(input: [String]) {
        self.field = input.map {Array($0.characters)}
        self.M = input[0].characters.count
        self.N = input.count
    }

    func main() {
        var res = 0

        for i in 0 ..< N {
            for j in 0 ..< M {
                if field[i][j] == "W" {
                    dfs(i, y: j)
                    res += 1
                }
            }
        }

        print(res)
    }

    func dfs(x: Int, y: Int) {
        field[x][y] = "."

        for dx in -1 ... 1 {
            for dy in -1 ... 1 {
                let nx = x + dx
                let ny = y + dy
                if 0 <= nx && nx < N && 0 <= ny && ny < M && field[nx][ny] == "W" {
                    self.dfs(nx, y: ny)
                }
            }
        }
    }
}
