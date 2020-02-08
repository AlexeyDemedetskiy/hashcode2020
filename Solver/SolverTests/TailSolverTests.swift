//
//  TailSolverTests.swift
//  SolverTests
//
//  Created by amoskvin on 2/8/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import XCTest
@testable import Solver

class TailSolverTests: XCTestCase {
    func testTrivialExample() {
        let problem = Problem(
            maximumNumberOfSlices: 17,
            numberOfPizzeTypes: 4,
            pizzas: [
                Pizza(numberOfSlices: 2),
                Pizza(numberOfSlices: 5),
                Pizza(numberOfSlices: 6),
                Pizza(numberOfSlices: 8)
        ])
        
        let correctSolution = Solution(
            indices: [0, 2, 3]
        )
        
        let findedSolution = TailSolver().solve(problem: problem)
        
        XCTAssertEqual(findedSolution.toString(), correctSolution.toString())
    }
}
