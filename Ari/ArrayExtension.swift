//
//  ArrayExtension.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/07/22.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import Foundation

enum ArrayExtensionError: Error {
    case generics
    case invalidTarget
}

protocol Target: Equatable, Comparable {
}

extension Int: Target {}
extension Float: Target {}
extension Double: Target {}
extension UInt64: Target {}

extension Array where Element: Target {

    /* value <= array[x] となる 最小のxを返す */
    func lowerBound<T: Target>(_ value: T) throws -> Int {
        guard value is Array.Iterator.Element else { throw ArrayExtensionError.generics }
        guard let last = self.last , value <= last as! T else { throw ArrayExtensionError.invalidTarget }

        let index = try! binarySearch(value)

        if self.count <= index {
            throw ArrayExtensionError.invalidTarget
        }

        let found = self[index] as! T

        if value <= found {
            return index
        }

        if found <= value && index < self.count - 1 {
            return index + 1
        }

        throw ArrayExtensionError.invalidTarget
    }

    func binarySearch<T: Target>(_ value: T) throws -> Int {
        guard value is Array.Iterator.Element else { throw ArrayExtensionError.generics }
        var lo = 0
        var hi = self.count - 1
        while lo < hi {
            let mid = lo + (hi - lo) / 2
            if (self[mid] as! T) < value {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return lo
    }
}
