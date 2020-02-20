public struct LibraryIndex: Hashable {
    let value: Int
}

public class SolutionTag: ExpressibleByStringLiteral {
    private let ownName: String
    private let parent: SolutionTag?
    
    init(name: String, parent: SolutionTag? = nil) {
        self.ownName = name
        self.parent = parent
    }
    
    public var name: String {
        guard let parentName = parent?.name else {
            return ownName
        }
        
        return "\(ownName)->\(parentName)"
    }
    
    public required init(stringLiteral value: String) {
        ownName = value
        parent = nil
    }
}
public struct Solution {
    var submissions: [Submission]
    public let tag: SolutionTag
}

public struct Submission {
    let library: LibraryIndex
    let books: [BookIndex]
}

extension Solution {
    public var asString: String {
        var result = ""
        
        result.append("\(submissions.count)\n")
        for submission in submissions {
            result.append("\(submission.library.value) \(submission.books.count)\n")
            let bookIndexes = submission.books.map { String($0.value) }
            result.append(bookIndexes.joined(separator: " "))
            result.append("\n")
        }
        
        return result
    }
}
