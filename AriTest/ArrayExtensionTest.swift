//
//  ArrayExtensionTest.swift
//  Ari
//
//  Created by Hiraku Ohno on 2016/07/26.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import XCTest

class ArrayExtensionTest: XCTestCase {

    func testCallLowerBound() {
        let array: [Int] = [1, 2, 3, 4, 5, 6, 9, 13, 19]
        let a = try! array.lowerBound(3)
        XCTAssertEqual(a, 2)

        let b = try! array.lowerBound(7)
        XCTAssertEqual(b, 6)

        let c = try! array.lowerBound(11)
        XCTAssertEqual(c, 7)

        let d = try! array.lowerBound(13)
        XCTAssertEqual(d, 7)

        let e = try! array.lowerBound(19)
        XCTAssertEqual(e, 8)

        do {
            let f = try array.lowerBound(20)
        } catch let e as ArrayExtensionError {
            XCTAssertEqual(e, ArrayExtensionError.InvalidTarget)
        } catch {
            
        }


    }

    func testBinarySearch() {
        let array = [1, 2, 3, 4, 5]
        XCTAssertTrue(try array.binarySearch(1) == 0)
        XCTAssertTrue(try array.binarySearch(2) == 1)
        XCTAssertTrue(try array.binarySearch(3) == 2)
        XCTAssertTrue(try array.binarySearch(4) == 3)
        XCTAssertTrue(try array.binarySearch(5) == 4)

        var caught = false
        do {
            try array.binarySearch(0.1)
        } catch ArrayExtensionError.Generics {
            caught = true
        } catch {
            
        }
        XCTAssertTrue(caught)
    }

    func testBinarySearchWithNotIncludedValue() {
        let array: [Int] = [1, 2, 3, 5, 6, 9, 10, 11, 14, 19]
        let a = try! array.binarySearch(4)
        let b = try! array.binarySearch(7)
        let c = try! array.binarySearch(8)
        print(index)
    }

    func testLowerBoundTime() {
        let array = (1 ... 10000000).map{ $0 * 273 } as [UInt64]
        let target = UInt64(3939391)

        let x = try! array.lowerBound(target)
        for y in array {
            if target <= y {
                XCTAssert(array[x] == y)
                break
            }
        }

        let starta = NSDate()
        let count = 10000
        (0 ... count).forEach { i in
            let a = try! array.lowerBound(target)
            let value = array[a]
        }
        let enda = NSDate()

        let startb = NSDate()
        (0 ... count).forEach { i in
            for b in array {
                if target <= b {
                    break
                }
            }
        }
        let endb = NSDate()

        let diff1 = enda.timeIntervalSince1970 - starta.timeIntervalSince1970
        let diff2 = endb.timeIntervalSince1970 - startb.timeIntervalSince1970

        print(diff1)
        print(diff2)

        XCTAssert(diff1 < diff2)
    }
}