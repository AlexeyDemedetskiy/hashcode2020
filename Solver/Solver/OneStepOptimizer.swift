
func optimizeInOneStep(solution: Solution, for problem: Problem) throws -> Solution? {
    
    let score = try Scorer.score(for: problem, with: solution)
    let originalLack = problem.maximumNumberOfSlices - score
    var lack = originalLack
    
    guard lack > 0 else { return nil }
    
    let allIndices = Set(problem.pizzas.indices)
    let usedIndices = Set(solution.indices)
    let unusedIndices = allIndices.subtracting(usedIndices)
    
    var bestFix = nil as (remove: PizzaIndex, add: [PizzaIndex])?
    for used in usedIndices.sorted().reversed() {
        let targetLack = originalLack + problem.pizzas[used].numberOfSlices
        let newProblem = Problem(maximumNumberOfSlices: targetLack, pizzas: unusedIndices.sorted().map{ problem.pizzas[$0]})
        let newSolution = try TailSolver().solve(problem: newProblem)
        let newScore = try Scorer.score(for: newProblem, with: newSolution)
        let newLack = newProblem.maximumNumberOfSlices - newScore
        
        if (newLack < lack) {
            bestFix = (remove: used, add: newSolution.indices)
            lack = newLack
        }
        if (lack == 0) {
            break
        }
    }
    
    guard let fix = bestFix else {
        return nil
    }
    
    var indices = solution.indices
    indices.removeAll { $0 == fix.remove }
    indices.append(contentsOf: fix.add)
    
    indices.sort()
    
    let improved = Solution(indices: indices, name: #function, parent: solution)
    let improvedScore = try Scorer.score(for: problem, with: improved)
    return improved
}

struct OptimizingSolver: Solver {
    let solver: Solver
    
    func solve(problem: Problem) throws -> Solution {
        let originalSolution = try solver.solve(problem: problem)
        guard let optimizedSolution = try optimizeInOneStep(solution: originalSolution, for: problem) else {
            return originalSolution
        }
        guard try Scorer.score(for: problem, with: optimizedSolution) > Scorer.score(for: problem, with: originalSolution) else {
            fatalError()
        }
        
        return optimizedSolution
    }
    
    var name: String { "Optimizing(\(solver.name))" }
}
