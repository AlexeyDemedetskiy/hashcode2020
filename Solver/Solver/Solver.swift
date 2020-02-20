public protocol Solver {
    func solve(problem: Problem) throws -> Solution
}

extension Solver {
    public var name: String {
        String(describing: Self.self)
    }
}
