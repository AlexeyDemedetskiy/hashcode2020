struct Scorer {
    struct SolutionOverflow: Error {}
    
    static func score(for problem: Problem, with solution: Solution) throws -> UInt64 {
        var score = 0 as UInt64
        for pizzaIdx in solution.indices {
            score += problem.pizzas[pizzaIdx].numberOfSlices
        }
        
        guard score <= problem.maximumNumberOfSlices else {
            throw SolutionOverflow()
        }
        
        return score
    }
}
