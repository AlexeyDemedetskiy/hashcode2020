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
    let numberOfSlices: UInt64
}


func parse(_ input: String) throws -> Problem {
    let lines = input.components(separatedBy: .newlines)
    let defs = lines[0].components(separatedBy: .whitespaces)
    let pizzas = lines[1].components(separatedBy: .whitespaces)

    
    return Problem(maximumNumberOfSlices: UInt(defs[0])!,
                   numberOfPizzeTypes: UInt(defs[1])!,
                   pizzas: pizzas.map({ e in return Pizza(numberOfSlices: UInt64(e)!) }))
}
