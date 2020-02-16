typealias PizzaIndex = Int

class Solution {
    internal init(indices: [PizzaIndex], name: String, parent: Solution? = nil) {
        self.indices = indices
        self.name = name
        self.parent = parent
    }
    
    let indices: [PizzaIndex]
    let name: String
    let parent: Solution?
    
    var fullName: String {
        guard let parent = parent else { return name }
        return "\(name)|>\(parent.name)"
    }
    
    func toString() -> String {
        var string = ""
        string.append(String(indices.count))
        string.append("\n")
        string.append(indices.map(String.init).joined(separator: " "))
        
        return string
    }
}
