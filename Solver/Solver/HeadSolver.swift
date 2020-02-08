struct HeadSolver: Solver {
    func solve(problem: Problem) -> Solution {
        var sum = 0 as UInt
        var indices = [UInt32]()
        
        for (idx, pizza) in problem.pizzas.enumerated() {
            sum += pizza.numberOfSlices
            if sum < problem.maximumNumberOfSlices {
                indices.append(UInt32(idx))
            } else {
                break
            }
        }
        
        return Solution(indices: indices)
    }
}
