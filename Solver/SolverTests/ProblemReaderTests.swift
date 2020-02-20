//
//  ProblemReaderTests.swift
//  SolverTests
//
//  Created by amoskvin on 2/8/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import XCTest
@testable import Solver;

class ProblemReaderTests: XCTestCase {
    func testSimple() throws {
        let input = """
        6 2 7
        1 2 3 6 5 4
        5 2 2
        0 1 2 3 4
        4 3 1
        0 2 3 5
        """
        let sut = try parse(input)
        
        XCTAssertEqual(6, sut.books.count)
        XCTAssertEqual(2, sut.libraries.count)
        XCTAssertEqual(7, sut.days)
    }
}
