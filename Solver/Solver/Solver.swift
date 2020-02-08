protocol Solver {
    var name: String { get }
    func solve(problem: Problem) throws -> Solution
}

extension Solver {
    var name: String {
        String(describing: Self.self)
    }
}
