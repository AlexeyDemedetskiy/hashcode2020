//
//  Reader.swift
//  Runner
//
//  Created by vanokhin on 08.02.2020.
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
