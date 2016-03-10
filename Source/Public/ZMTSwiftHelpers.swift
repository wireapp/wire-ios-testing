// Wire
// Copyright (C) 2016 Wire Swiss GmbH
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.


import Foundation
import XCTest


public func AssertOptionalNil<T>(@autoclosure condition: () -> T?, _ message: String = "", file: String = __FILE__, line: UInt = __LINE__) {
    if let value = condition() {
        XCTFail("\(value) is not nil: \(message)", file: file, line: line)
    }
}

public func AssertOptionalEqual<T : Equatable>(@autoclosure expression1: () -> T?, @autoclosure expression2: () -> T, _ message: String = "", file: String = __FILE__, line: UInt = __LINE__) {
    if let v = expression1() {
        XCTAssertEqual(v, expression2(), message, file: file, line: line)
    } else {
        XCTFail("Value is nil. \(message)", file: file, line: line)
    }
}

public func AssertOptionalNotNil<T>(@autoclosure expression: () -> T?, _ message: String = "", file: String = __FILE__, line: UInt = __LINE__, block: T -> () = {_ in}) {
    if let v = expression() {
        block(v)
    } else {
        XCTFail("Value is nil. \(message)", file: file, line: line)
    }
}

public func AssertDictionaryHasOptionalValue<T: NSObject>(@autoclosure dictionary: () -> [String: T?], @autoclosure key: () -> String, @autoclosure expected: () -> T, _ message: String = "", file: String = __FILE__, line: UInt = __LINE__) {
    if let v = dictionary()[key()] {
        AssertOptionalEqual(v, expression2: expected(), message, file: file, line: line)
    } else {
        XCTFail("No value for \(key()). \(message)", file: file, line: line)
    }
}


public func AssertDictionaryHasOptionalNilValue<T: NSObject>(@autoclosure dictionary: () -> [String: T?], @autoclosure key: () -> String, _ message: String = "", file: String = __FILE__, line: UInt = __LINE__) {
    if let v = dictionary()[key()] {
        AssertOptionalNil(v, message , file: file, line: line)
    } else {
        XCTFail("No value for \(key()). \(message)", file: file, line: line)
    }
}

