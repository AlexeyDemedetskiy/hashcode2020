protocol Solver {
    var name: String { get }
    func solve(problem: Problem) -> Solution
}

extension Solver {
    var name: String {
        String(describing: Self.self)
    }
}
