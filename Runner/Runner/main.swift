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
    
    func run(problem: String, name: String, solver: Solver) {
        let start = CFAbsoluteTimeGetCurrent()
        do {
            print("Problem: \(name) with \(solver.name). ", terminator: "")
            let problem = try parse(problem)
            let solution = try solver.solve(problem: problem)
            let score = try Scorer.score(for: problem, with: solution)
            
            try writer.write(
                solution: solution.toString(),
                solverName: solution.fullName,
                score: score,
                problemName: name)
        }
        catch {
            print(error)
        }
        
        print("Time: ", CFAbsoluteTimeGetCurrent() - start)
    }
    
    func run() throws {
        for (problem, name) in try reader.read() {
            run(problem: problem, name: name, solver: OptimizingSolver(solver: TailSolverCompose()))
            run(problem: problem, name: name, solver: GreedyComposer())
            run(problem: problem, name: name, solver: TailSolverCompose())
        }
    }
}

let runner = Runner()
try runner.run()
