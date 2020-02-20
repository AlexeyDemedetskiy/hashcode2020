struct GreedySolver: Solver {
    
//    var name: String { "GrredySolver(\(denied))" }
    
    func solve(problem: Problem) throws -> Solution {
        var submissions = [Submission]()
        let sorted = problem.libraries.sorted { (l1, l2) -> Bool in
            return l1.books.count > l2.books.count
        }
        
        sorted.forEach { library in
            let sortedBooks = library.books.sorted { (book1, book2) -> Bool in
                return book1.value > book2.value
            }
            submissions.append(Submission(library: library.index, books: sortedBooks))
        }
    
        
        return Solution(submissions: submissions)
    }
}

//struct GreedyComposer: Solver {
//    func solve(problem: Problem) throws -> Solution {
//        var solution = try GreedySolver().solve(problem: problem)
//        while let improved = try improve(solution: solution, for: problem) {
//            solution = improved
//        }
//
//        return solution
//    }
//
//    func improve(solution: Solution, for problem: Problem) throws -> Solution? {
//        var solution = solution
//        var score = try Scorer.score(for: problem, with: solution)
//
//        guard score < problem.maximumNumberOfSlices else {
//            // Better solution cannot be found
//            return nil
//        }
//
//        var wasImproved = false
//        for index in solution.indices.reversed() {
//            let improved = try GreedySolver(denied: [index]).solve(problem: problem)
//            let improvedScore = try Scorer.score(for: problem, with: improved)
//
//            guard improvedScore > score else { continue }
//
//            wasImproved = true
//            solution = improved
//            score = improvedScore
//        }
//
//        guard wasImproved else { return nil }
//        return solution
//    }
//}
