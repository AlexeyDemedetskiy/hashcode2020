//
//  Writer.swift
//  Runner
//
//  Created by vanokhin on 08.02.2020.
//  Copyright © 2020 Genesis. All rights reserved.
//

import Foundation

struct Writer {
    let solutionFolder = ProcessInfo.processInfo.environment["SOLUTIONS_PATH"]!
    
    func write(solution: String, solverName: String, score: UInt64, problemName: String) throws {
        let name = "\(problemName)_\(score)_\(solverName).out"
        let documentsUrl =  URL(fileURLWithPath: solutionFolder, isDirectory: true)
        let file = documentsUrl.appendingPathComponent(name)
        try solution.write(to: file, atomically: true, encoding: .utf8)
    }
}
