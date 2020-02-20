import Foundation

struct BookIndex {
    let value: Int
}

struct Problem {
    let books: [Book]
    let libraries: [Library]
    let days: Int
}

struct Book {
    let score: Int
}

struct Library {
    let signup: Int
    let booksPerDay: Int
    let books: [BookIndex] // Indexes
}

func parse(_ input: String) throws -> Problem {
    let lines = input.components(separatedBy: .newlines)
    let defs = lines[0].components(separatedBy: .whitespaces)
        
    throw NSError()
}
