struct Scorer {
    struct SolutionOverflow: Error {}
    
    static func score(for problem: Problem, with solution: Solution) throws -> Int {
        var startDay = 0
        var startTimes = [] as [Int]
        for submission in solution.submissions {
            startDay += problem.libraries[submission.library.value].signup
            startTimes.append(startDay)
        }
        
        let durations = startTimes.map { problem.days - $0 }.filter { $0 > 0 }
        
        var processedBooks = [] as Set<BookIndex>
        var score = 0
        for (submission, duration) in zip(solution.submissions, durations) {
            let maxBooks = problem.libraries[submission.library.value].booksPerDay * duration
            
            let books = submission.books[0..<min(maxBooks, submission.books.count)]
            
            for book in books {
                if processedBooks.contains(book) { continue }
                processedBooks.insert(book)
                
                score += problem.books[book.value].score
            }
        }
        
        return score
    }
}
