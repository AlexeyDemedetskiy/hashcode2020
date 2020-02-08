import XCTest
@testable import Solver

class SolutionTests: XCTestCase {
    func testTrivail() {
        let solution = Solution(indices: [
            0, 2, 3
        ])
        
        let result =
        """
        3
        0 2 3
        """
        
        XCTAssertEqual(solution.toString(), result)
    }
    
    func testEmptySolution() {
        let solution = Solution(indices: [
            
        ])
        
        let result =
        """
        0

        """
        
        XCTAssertEqual(solution.toString(), result)
    }
    
    func testPerformanceExample() {
        self.measure {
            let range = ClosedRange<PizzaIndex>(uncheckedBounds: (0, 100000 - 1))
            XCTAssertEqual(range.count, 100000)
            
            let solution = Solution(indices: Array(range))
            let _ = solution.toString()
            
        }
    }

}
