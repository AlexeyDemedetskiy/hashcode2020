struct NopSolver: Solver {
    func solve(problem: Problem) -> Solution {
        return Solution(indices: [], solverWrapper: .init(solver: self))
    }
}
