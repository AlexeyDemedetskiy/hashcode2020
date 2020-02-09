//
//  TailSolver.swift
//  Solver
//
//  Created by amoskvin on 2/8/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import Foundation

struct SkipedReviewerSolver: Solver {
    func solve(problem: Problem) throws -> Solution {
        let res = try solve(problem: problem, deep: 1)
        return Solution(indices: res.indices)
    }
    
    func solve(problem: Problem, deep: Int) throws -> Solution {
        let res = try TailSolver().solve(problem: problem)
        let skippedElements = problem.pizzas.enumerated().filter { (index, _) in
            res.indices.contains(index)
        }
        
        var bestRes = res
        
        for skippedElement in skippedElements {
            var newPizzas = Array(problem.pizzas)
            newPizzas.remove(at: skippedElement.offset)
            
            let newProblem = Problem.init(
                maximumNumberOfSlices: problem.maximumNumberOfSlices,
                pizzas: newPizzas
            )
            
            var newRes: Solution
            if deep > 0 {
                newRes = try solve(problem: newProblem, deep: deep - 1)
            } else {
                newRes = try TailSolver().solve(problem: newProblem)
            }
            
            if (newRes.indices.reduce(0, +) > bestRes.indices.reduce(0, +)) {
                bestRes = newRes
            }
        }
        
        return Solution(indices: bestRes.indices)
    }
}
