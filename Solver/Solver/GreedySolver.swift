//struct GreedySolver: Solver {
//    let denied: Set<PizzaIndex>
//    
//    init(denied: Set<PizzaIndex> = []) {
//        self.denied = denied
//    }
//    
//    var name: String { "GrredySolver(\(denied))" }
//    
//    func solve(problem: Problem) throws -> Solution {
//        var solution = [] as [PizzaIndex]
//        var score = 0 as UInt64
//        for index in problem.pizzas.indices.reversed() {
//            if (denied.contains(index)) {
//                continue
//            }
//            
//            let pizza = problem.pizzas[index]
//            guard (score + pizza.numberOfSlices)<=problem.maximumNumberOfSlices else {
//                continue
//            }
//            
//            solution.append(index)
//            score += pizza.numberOfSlices
//            
//            if score == problem.maximumNumberOfSlices {
//                break
//            }
//        }
//        
//        return Solution(indices: solution, name: name)
//    }
//}
//
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
