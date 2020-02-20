import XCTest
@testable import Solver

class SolutionTests: XCTestCase {

    func testTrivail() {
        let solution = Solution(submissions: [
            Submission(
                library: LibraryIndex(value: 1),
                books: [5, 2, 3].map(BookIndex.init)
            ),
            Submission(
                library: LibraryIndex(value: 0),
                books: [0, 1, 2, 3, 4].map(BookIndex.init))
        ], tag: "TrivialSolution")
        
        let result =
        """
        2
        1 3
        5 2 3
        0 5
        0 1 2 3 4

        """
        
        XCTAssertEqual(solution.asString, result)
    }
    
    func testTrivail1() throws {
        let solver = GreedySolver()
        let input = """
        6 2 7
        1 2 3 6 5 4
        5 2 2
        0 1 2 3 4
        4 3 1
        0 2 3 5
        """
        let sut = try parse(input)
        let solution = try solver.solve(problem: sut)
    }

    func testFastParallelSolver() throws {
        let solver = FastParallelSolver()
        let input = """
        6 2 7
        1 2 3 6 5 4
        5 2 2
        0 1 2 3 4
        4 3 1
        0 2 3 5
        """
        let sut = try parse(input)
        let solution = try solver.solve(problem: sut)
    }
}
