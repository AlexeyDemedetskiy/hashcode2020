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
        print("Problem: \(name) with \(solver.name)")
        let problem = try parse(problem)
        let solution = try solver.solve(problem: problem)
        let score = try Scorer.score(for: problem, with: solution)
        
        try writer.write(
            solution: solution.toString(),
            solverName: solution.fullName,
            score: score,
            problemName: name)
    }
    
    func run() throws {
        for (problem, name) in try reader.read() {
            try run(problem: problem, name: name, solver: GreedyComposer())
            try run(problem: problem, name: name, solver: TailSolverCompose())
        }
    }
}

let runner = Runner()

do {
    try runner.run()
} catch {
    print(error)
}

