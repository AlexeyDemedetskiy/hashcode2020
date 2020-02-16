//
//  TailSolver.swift
//  Solver
//
//  Created by amoskvin on 2/8/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import Foundation

struct TailSolver: Solver {
    
    let offset: Int
    
    var name: String {
        "TailSolver(\(offset))"
    }
    
    init(offset: Int = 0) {
        self.offset = offset
    }
    
    func solve(problem: Problem) throws -> Solution {
        var isSolving = true;
        var index = problem.pizzas.count - 1 - offset;
        var accumulator: UInt64 = 0;
        var results: [PizzaIndex] = []
        
        while (isSolving) {
            if (index == -1) { isSolving = false; break }
            let slices = problem.pizzas[index].numberOfSlices
            
            let nextValue = accumulator + slices
            if (problem.maximumNumberOfSlices < nextValue) {
                index -= 1;
                continue
            }
            
            results.append(PizzaIndex(index))
            
            accumulator = nextValue
            
            index -= 1;
        }
        return Solution(indices: results.reversed(), name: name)
    }
}
