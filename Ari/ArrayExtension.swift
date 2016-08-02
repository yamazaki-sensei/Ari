//
//  ArrayExtension.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/07/22.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import Foundation

enum ArrayExtensionError: ErrorType {
    case Generics
    case InvalidTarget
}

protocol Target: Equatable, Comparable {
}

extension Int: Target {}
extension Float: Target {}
extension Double: Target {}
extension UInt64: Target {}

extension Array where Element: Target {

    func lowerBound<T: Target>(value: T) throws -> Int {
        guard value is Array.Generator.Element else { throw ArrayExtensionError.Generics }
        let index = try! binarySearch(value)

        if self.count <= index {
            throw ArrayExtensionError.InvalidTarget
        }

        let found = self[index] as! T

        if value <= found {
            return index
        }

        if found <= value && index < self.count - 1 {
            return index + 1
        }

        throw ArrayExtensionError.InvalidTarget
    }

    func binarySearch<T: Target>(value: T) throws -> Int {
        guard value is Array.Generator.Element else { throw ArrayExtensionError.Generics }
        var lo = 0
        var hi = self.count
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