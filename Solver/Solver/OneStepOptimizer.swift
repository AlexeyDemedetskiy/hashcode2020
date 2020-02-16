
func optimizeInOneStep(solution: Solution, for problem: Problem) throws -> Solution? {
       let score = try Scorer.score(for: problem, with: solution)
       
       let lack = problem.maximumNumberOfSlices - score
       
       guard lack > 0 else { return nil }
       
       let allIndices = Set(problem.pizzas.indices)
       let usedIndices = Set(solution.indices)
       
       let unusedIndices = allIndices.subtracting(usedIndices)
       
       var bestFix = nil as (fix: UInt64, remove: PizzaIndex, add: PizzaIndex)?
       /// TODO: Replace all to all to an ordered array flow.
       for unused in unusedIndices {
           for used in usedIndices {
               let diff =
                   Int(problem.pizzas[unused].numberOfSlices) -
                   Int(problem.pizzas[used].numberOfSlices)
               
               guard diff > 0 else { continue }
               if diff > lack { continue }
               
               guard let currentFix = bestFix?.fix else {
                   bestFix = (fix: UInt64(diff), remove: used, add: unused)
                   continue
               }
               
               if diff == lack { break }
               
               if diff > currentFix {
                   bestFix = (fix: UInt64(diff), remove: used, add: unused)
               }
           }
       }
       
       guard let fix = bestFix else {
           return nil
       }
       
       var indices = solution.indices
       indices.removeAll { $0 == fix.remove }
       indices.append(fix.add)
       
       indices.sort()
       
        return Solution(indices: indices, name: #function, parent: solution)
   }

struct OptimizingSolver: Solver {
    let solver: Solver
    
    func solve(problem: Problem) throws -> Solution {
        let originalSolution = try solver.solve(problem: problem)
        guard let optimizedSolution = try optimizeInOneStep(solution: originalSolution, for: problem) else {
            return originalSolution
        }
        
        return optimizedSolution
    }
    
    var name: String { "Optimizing(\(solver.name))" }
}
