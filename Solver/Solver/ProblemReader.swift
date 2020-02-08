//
//  ProblemReader.swift
//  Solver
//
//  Created by amoskvin on 2/8/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import Foundation

struct Problem {
    let maximumNumberOfSlices: UInt
    let numberOfPizzeTypes: UInt
    let pizzas: [Pizza]
}

struct Pizza {
    let numberOfSlices: UInt
}

func parse(input: String) throws -> Problem {
    let lines = input.components(separatedBy: .newlines)
//    let  lines[0].components(separatedBy: .whitespaces)
    
    return Problem(maximumNumberOfSlices: 0, numberOfPizzeTypes: 0, pizzas: []);
}
