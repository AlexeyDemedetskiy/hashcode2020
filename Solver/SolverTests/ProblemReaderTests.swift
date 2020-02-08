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
        17 4
        2 5 6 8
        """
        let sut = try parse(input)
        XCTAssertEqual(sut.maximumNumberOfSlices, 17)
        XCTAssertEqual(sut.numberOfPizzeTypes, 4)
        XCTAssertEqual(sut.pizzas[0].numberOfSlices, 2)
        XCTAssertEqual(sut.pizzas[1].numberOfSlices, 5)
        XCTAssertEqual(sut.pizzas[2].numberOfSlices, 6)
        XCTAssertEqual(sut.pizzas[3].numberOfSlices, 8)
        XCTAssertEqual(sut.pizzas.count, 4)
    }
    
    func testBig() throws {
        self.measure {
            let bundle = Bundle(for: type(of: self))
            guard let path = bundle.path(forResource: "e_also_big", ofType: "in") else { XCTFail(); return }
            let input = try! String(contentsOfFile: path, encoding: .utf8)
            let sut = try! parse(input)
            XCTAssertEqual(sut.maximumNumberOfSlices, 505000000)
            XCTAssertEqual(sut.numberOfPizzeTypes, 10000)
            XCTAssertEqual(sut.pizzas.count, 10000)
        }        
    }
}
