struct LibraryIndex {
    let value: Int
}

struct Solution {
    let submissions: [Submission]
}

struct Submission {
    let library: LibraryIndex
    let books: [BookIndex]
}
