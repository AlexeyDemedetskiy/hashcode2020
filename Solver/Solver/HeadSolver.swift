struct HeadSolver: Solver {
    func solve(problem: Problem) -> Solution {
        var sum = 0 as UInt64
        var indices = [Int]()
        
        for (idx, pizza) in problem.pizzas.enumerated() {
            sum += pizza.numberOfSlices
            if sum < problem.maximumNumberOfSlices {
                indices.append(idx)
            } else {
                break
            }
        }
        
        return Solution(indices: indices, solverWrapper: .init(solver: self))
    }
}
