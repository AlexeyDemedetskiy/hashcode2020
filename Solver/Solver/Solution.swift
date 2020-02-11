typealias PizzaIndex = Int

class Solution {
    class SolverWrapper {
        let wrapper: SolverWrapper?
        let solver: Solver
        
        var name: String {
            [solver.name, wrapper?.name].compactMap{ $0 }.joined(separator: "_")
        }
        
        init(wrapper: SolverWrapper? = nil, solver: Solver) {
            self.wrapper = wrapper
            self.solver = solver
        }
    }
    
    let indices: [PizzaIndex]
    let solverWrapper: SolverWrapper
    
    var name: String {
        solverWrapper.name
    }
    
    init(indices: [PizzaIndex], solverWrapper: SolverWrapper) {
        self.indices = indices
        self.solverWrapper = solverWrapper
    }
    
    func wrap(solver: Solver) -> Solution {
        return Solution(indices: indices,
                        solverWrapper: SolverWrapper(wrapper: solverWrapper,
                                                     solver: solver))
    }
    
    func wrap(solution: Solution) -> Solution {
        return Solution(indices: solution.indices,
                        solverWrapper: SolverWrapper(wrapper: solution.solverWrapper,
                                                     solver: solution.solverWrapper.solver))
    }
    
    func toString() -> String {
        var string = ""
        string.append(String(indices.count))
        string.append("\n")
        string.append(indices.map(String.init).joined(separator: " "))
        
        return string
    }
}
