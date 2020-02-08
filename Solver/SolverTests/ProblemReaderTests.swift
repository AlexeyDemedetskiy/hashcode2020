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
    func testEmpty() throws {
        let sut = try Solver.read(file: "a_example", bundle: Bundle(for: type(of: self)))
        XCTAssertEqual(sut.maximumNumberOfSlices, 0)
        XCTAssertEqual(sut.numberOfPizzeTypes, 0)
        XCTAssertEqual(sut.pizzas.count, 0)
    }
}
