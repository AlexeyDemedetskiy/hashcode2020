//
//  main.swift
//  Runner
//
//  Created by Alexey Demedetskii on 2/8/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import Foundation
@testable import Solver

class Runner {
    let reader = Reader()
    let writer = Writer()
    // let parser
    
    func run(problem: String, name: String, solver: Solver) throws {
        let problem = try parse(problem)
        let solution = solver.solve(problem: problem)
        let score = try Scorer.score(for: problem, with: solution)
        try writer.write(solution: solution.toString(), solverName: solver.name, score: score, problemName: name)
    }
    
    func run() throws {
        for (problem, name) in try reader.read() {
            try run(problem: problem, name: name, solver: HeadSolver())
            try run(problem: problem, name: name, solver: TailSolver())
            try run(problem: problem, name: name, solver: SkipedReviewerSolver())
        }
    }
}

let runner = Runner()

do {
    try runner.run()
} catch {
    print(error)
}

