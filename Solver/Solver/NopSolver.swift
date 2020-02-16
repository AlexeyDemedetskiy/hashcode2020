struct NopSolver: Solver {
    func solve(problem: Problem) -> Solution {
        return Solution(indices: [], name: name)
    }
}
