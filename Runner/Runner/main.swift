//
//  main.swift
//  Runner
//
//  Created by Alexey Demedetskii on 2/8/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import Foundation


class Runner {
    let reader = Reader()
    let witer = Writer()
    // let parser
    
    func run() throws {
        let problems = try reader.read()

        //solve
        
        
    }
}

let runner = Runner()

do {
    try runner.run()
} catch {
    print(error)
}

