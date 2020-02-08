import XCTest
@testable import Solver

class HeadSolverTests: XCTestCase {

    func testTrivialExample() {
        let problem = Problem(
            maximumNumberOfSlices: 17,
            pizzas: [
                Pizza(numberOfSlices: 2),
                Pizza(numberOfSlices: 5),
                Pizza(numberOfSlices: 6),
                Pizza(numberOfSlices: 8)
        ])
        
        let correctSolution = Solution(
            indices: [0, 2, 3]
        )
        
        let findedSolution = HeadSolver().solve(problem: problem)
        
        XCTAssertEqual(findedSolution.toString(), correctSolution.toString())
    }

    func testPerformanceExample() {
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
//    func testDemo() {
//        let b = Bundle(for: type(of: self))
//        let path = b.path(forResource: "d_quite_big", ofType: "in")
//    }

}
