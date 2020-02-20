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
    let index: BookIndex
    let score: Int
}

struct Library {
    let index: LibraryIndex
    let signup: Int
    let booksPerDay: Int
    let books: [BookIndex] // Indexes
}

func parse(_ input: String) throws -> Problem {
    var lines = input.components(separatedBy: .newlines)
    var generalInfo = lines.removeFirst().components(separatedBy: .whitespaces)
    
    let numberOfBooks = Int(generalInfo.removeFirst())!
    let numberOfLibraries = Int(generalInfo.removeFirst())!
    let numberOfDays = Int(generalInfo.removeFirst())!
    
    let books = lines.removeFirst().components(separatedBy: .whitespaces)
    let booksScores = books.map { Int($0)! }
    let booksModels = booksScores.enumerated().map { it in
        Book(index: BookIndex(value: it.offset), score: it.element)
    }
    
    precondition(booksModels.count == numberOfBooks)
    
    var libraryModels = [] as [Library]
    for idx in 0..<numberOfLibraries {
        var libraryInfo = lines.removeFirst().components(separatedBy: .whitespaces)
        let numberOfBooks = Int(libraryInfo.removeFirst())!
        let signup = Int(libraryInfo.removeFirst())!
        let booksPerDay = Int(libraryInfo.removeFirst())!
        
        let booksInLibrary = lines.removeFirst().components(separatedBy: .whitespaces)
        let booksIndexes = booksInLibrary.map { BookIndex(value: Int($0)!)}
        
        precondition(booksIndexes.count == numberOfBooks)
        
        libraryModels.append(Library(
            index: LibraryIndex(value: idx),
            signup: signup,
            booksPerDay: booksPerDay,
            books: booksIndexes))
    }
    
    precondition(libraryModels.count == numberOfLibraries)
    
    
    let result = Problem(books: booksModels, libraries: libraryModels, days: numberOfDays)
    return result
}
