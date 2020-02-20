public struct FastParallelOptimizedSolver: Solver {
    public init() {}
    
    public func solve(problem: Problem) throws -> Solution {
        var submissions = [Submission]()
        
        let sorted = problem.libraries.sorted { (l1, l2) -> Bool in
            if l1.signup == l2.signup {
                var sum1 = 0
                for i in 0...problem.days / l1.booksPerDay {
                    if i >= l1.books.count { break }
                    sum1 += problem.books[i].score
                }
                
                var sum2 = 0
                for i in 0...problem.days / l2.booksPerDay {
                    if i >= l2.books.count { break }
                    sum2 += problem.books[i].score
                }
                return sum1 > sum2
            }
            return l1.signup < l2.signup
        }
        
        sorted.forEach { library in
            let sortedBooks = library.books.sorted { (book1, book2) -> Bool in
                return book1.value > book2.value
            }
            submissions.append(Submission(library: library.index, books: sortedBooks))
        }


        return Solution(submissions: submissions, tag: "FastParallelOptimizedSolver" )
    }
}
