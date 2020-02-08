typealias Problem = Never

protocol Solver {
    func solve(problem: Problem) -> Solution
}
