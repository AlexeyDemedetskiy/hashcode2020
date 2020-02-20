struct OptimusSolver: Solver {
    func solve(problem: Problem) throws -> Solution {
        var daysLeft = problem.days
        var processedBooks = [] as Set<BookIndex>
        
        var libraryScores = [:] as [LibraryIndex: (score: Int, books: ArraySlice<BookIndex>)]
        
        func score(_ libraryIndex: LibraryIndex) {
            let library = problem.libraries[libraryIndex.value]
            let usefullDays = daysLeft - library.signup
            guard usefullDays > 0 else { return }
            
            let booksToProcess = Set(library.books).subtracting(processedBooks).sorted {
                problem.books[$0.value].score > problem.books[$1.value].score
            }
            
            let maxProcessedBooks = min(usefullDays * library.booksPerDay, booksToProcess.count)
            let usefullBooks = booksToProcess[0..<maxProcessedBooks]
            
            if usefullBooks.isEmpty {
                return
            }
            
            let bookScores = usefullBooks.map { problem.books[$0.value].score }
            let score =  bookScores.reduce(0, +)
            
            libraryScores[libraryIndex] = (score, usefullBooks)
        }
        
        var solution = Solution(submissions: [], tag: "Optimus")
        var leftLibraries = Set(problem.libraries.map { $0.index })
        
        while(true) {
            libraryScores = [:]
            
            for library in leftLibraries {
                score(library)
            }
            
            if libraryScores.isEmpty { break }
            
            let topLibrary = libraryScores.keys.max {
                libraryScores[$0]!.score < libraryScores[$1]!.score
            }!
            
            let topLibraryBooks = Array(libraryScores[topLibrary]!.books)
            
            solution.submissions.append(
                Submission(
                    library: topLibrary,
                    books: topLibraryBooks
                )
            )
            
            daysLeft -= problem.libraries[topLibrary.value].signup
            processedBooks.formUnion(topLibraryBooks)
            leftLibraries.remove(topLibrary)
            
            guard daysLeft > 0 else { break }
        }
        
        return solution
    }
}
