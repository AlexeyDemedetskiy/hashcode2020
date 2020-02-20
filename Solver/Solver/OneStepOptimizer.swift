
//func optimizeInOneStep(solution: Solution, for problem: Problem) throws -> Solution? {
//    
//    let score = try Scorer.score(for: problem, with: solution)
//    let lack = problem.maximumNumberOfSlices - score
//    
//    guard lack > 0 else { return nil }
//    
//    let usedIndices = Set(solution.indices)
//    
//    var bestFix = nil as (lack: UInt64, remove: PizzaIndex, add: [PizzaIndex])?
//    for used in usedIndices.sorted().reversed() {
//        let targetLack = lack + problem.pizzas[used].numberOfSlices
//        
//        let newProblem = Problem(
//            maximumNumberOfSlices: targetLack,
//            pizzas: problem.pizzas
//        )
//        
//        let newSolution = try GreedySolver(denied: usedIndices).solve(problem: newProblem)
//        let newScore = try Scorer.score(for: newProblem, with: newSolution)
//        
//        let newLack = newProblem.maximumNumberOfSlices - newScore
//        
//        guard newLack < lack else { continue }
//        
//        guard let fix = bestFix else {
//            bestFix = (lack: newLack, remove: used, add: newSolution.indices)
//            continue
//        }
//        
//        guard newLack < fix.lack else { continue }
//        
//        bestFix = (lack: newLack, remove: used, add: newSolution.indices)
//        
//        if (newLack == 0) {
//            break
//        }
//    }
//    
//    guard let fix = bestFix else {
//        return nil
//    }
//    
//    var indices = solution.indices
//    indices.removeAll { $0 == fix.remove }
//    indices.append(contentsOf: fix.add)
//    
//    indices.sort()
//    
//    let improved = Solution(indices: indices, name: "Optimized", parent: solution)
//    return improved
//}
//
//struct OptimizingSolver: Solver {
//    let solver: Solver
//    
//    func solve(problem: Problem) throws -> Solution {
//        let originalSolution = try solver.solve(problem: problem)
//        guard let optimizedSolution = try optimizeInOneStep(solution: originalSolution, for: problem) else {
//            return originalSolution
//        }
//        guard try Scorer.score(for: problem, with: optimizedSolution) > Scorer.score(for: problem, with: originalSolution) else {
//            fatalError()
//        }
//        
//        return optimizedSolution
//    }
//}
