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
        let array: [Int] = [1, 2, 3, 4, 5]
        let a = try! array.lowerBound(3)
        XCTAssert(a == 0)
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
}