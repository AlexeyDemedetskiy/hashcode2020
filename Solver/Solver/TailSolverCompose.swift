//
//  TailSolverCompose.swift
//  Solver
//
//  Created by vanokhin on 08.02.2020.
//  Copyright © 2020 Genesis. All rights reserved.
//

import Foundation

struct TailSolverCompose: Solver {
    func solve(problem: Problem) throws -> Solution {
        var bestSolution = try TailSolver().solve(problem: problem)
        var bestScore = try Scorer.score(for: problem, with: bestSolution)
        guard bestScore < problem.maximumNumberOfSlices else {
            return bestSolution
        }
        
        for offset in 1 ..< problem.pizzas.count {
            let solution = try TailSolver(offset: offset).solve(problem: problem)
            let score = try Scorer.score(for: problem, with: solution)
            
            if score > bestScore {
                bestSolution = solution
                bestScore = score
            }
            
            guard bestScore < problem.maximumNumberOfSlices else {
                break
            }
            
            guard solution.indices.count < problem.pizzas.count - offset else {
                break
            }
        }
        
        return bestSolution.wrap(solver: self)
    }
}
