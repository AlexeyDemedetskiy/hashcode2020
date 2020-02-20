public struct MetricsSolver: Solver {
    public init() {}
    
    public func solve(problem: Problem) -> Solution {
        var submissions = [Submission]()
        let sorted = problem.libraries.sorted { (l1, l2) -> Bool in
            // XCODE CERASHES WHEN I TRY TO USE REDUCE <3 VLAD ANOKHIN
            var sum1 = 0;
            for book in l1.books {
                sum1 += book.value
            }
            
            var sum2 = 0;
            for book in l2.books {
                sum2 += book.value
            }
            
            let metrics1 = sum1 / l1.booksPerDay
            let metrics2 = sum2 / l2.booksPerDay
            return metrics1 < metrics2
        }
        
        sorted.forEach { library in
            let sortedBooks = library.books.sorted { (book1, book2) -> Bool in
                return book1.value > book2.value
            }
            submissions.append(Submission(library: library.index, books: sortedBooks))
        }
        
        
        return Solution(submissions: submissions, tag: "MetricsSolver")
    }
}
