typealias PizzaIndex = UInt32

struct Solution {
    let indices: [PizzaIndex]
    
    func toString() -> String {
        var string = ""
        string.append(String(indices.count))
        string.append("\n")
        string.append(indices.map(String.init).joined(separator: " "))
        
        return string
    }
}
