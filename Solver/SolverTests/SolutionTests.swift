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
        ])
        
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

}
