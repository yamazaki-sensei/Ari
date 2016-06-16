//
//  P37.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/06/16.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

class P38: Base {

    let INF = 100000000
    typealias P = (Int, Int)

    let maze: [[Character]]
    let N: Int
    let M: Int

    var start: P!
    var goal: P!

    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]

    var d: [[Int]]!


    init(input: [String]) {
        maze = input.map {Array($0.characters)}
        N = input[0].characters.count - 1
        M = input.count
    }

    func main() {
        let result = bfs()
        print(result)
    }

    func bfs() -> Int {

        var queue: [P] = []

        for x in 0 ..< M {
            for y in 0 ..< N {
                if maze[x][y] == "S" {
                    start = P(x, y)
                }
                if maze[x][y] == "G" {
                    goal = P(x, y)
                }
            }
        }

        d = Array(count: M, repeatedValue: Array(count: N, repeatedValue: INF))

        queue.append(start)
        d[start.0][start.1] = 0

        while 0 < queue.count {
            let p = queue.removeLast()
            if p == goal { break }

            for i in 0 ..< dx.count {
                let nx = p.0 + dx[i]
                let ny = p.1 + dy[i]

                if 0 <= nx && nx < N && 0 <= ny && ny < M && maze[nx][ny] != "#" && d[nx][ny] == INF {
                    queue.append(P(nx, ny))
                    d[nx][ny] = d[p.0][p.1] + 1

                }
            }
        }
        return d[goal.0][goal.1]
    }
}