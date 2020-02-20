struct LibraryIndex {
    let value: Int
}

struct Solution {
    let submissions: [Submission]
}

struct Submission {
    let library: LibraryIndex
    let books: [BookIndex]
}

extension Solution {
    var asString: String {
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
