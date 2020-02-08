//
//  main.swift
//  Runner
//
//  Created by Alexey Demedetskii on 2/8/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import Foundation

struct Reader {
    let problemFolder: String = ProcessInfo.processInfo.environment["PROBLEMS_PATH"]!
    
    func read() throws -> [String] {
        let documentsUrl =  URL(fileURLWithPath: problemFolder, isDirectory: true)
        let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil)
        let urls = try directoryContents
            .filter { $0.pathExtension == "in" }
            .map { try String(contentsOf: $0, encoding: .utf8) }
        return urls
    }
}

struct Writer {
    let solutionFolder = ProcessInfo.processInfo.environment["SOLUTIONS_PATH"]!
    
}

class Runner {
    let reader = Reader()
    // let parser
    
    func run() throws {
        let problems = try reader.read()

        //solve
        //write
    }
}

let runner = Runner()

do {
    try runner.run()
} catch {
    print(error)
}

