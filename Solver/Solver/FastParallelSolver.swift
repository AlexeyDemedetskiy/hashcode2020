public struct FastParallelSolver: Solver {
    public init() {}
    
    public func solve(problem: Problem) throws -> Solution {
        var submissions = [Submission]()
        
        let sorted = problem.libraries.sorted { (l1, l2) -> Bool in
            return l1.signup < l2.signup
        }
        
        sorted.forEach { library in
            let sortedBooks = library.books.sorted { (book1, book2) -> Bool in
                return book1.value > book2.value
            }
            submissions.append(Submission(library: library.index, books: sortedBooks))
        }


        return Solution(submissions: submissions, tag: "FastParallelSolver" )
    }
}
