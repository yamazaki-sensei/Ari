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
        let array: [Target] = [1, 2, 3, 4, 5]
        let _ = try! array.lowerBound(1)
    }
}
