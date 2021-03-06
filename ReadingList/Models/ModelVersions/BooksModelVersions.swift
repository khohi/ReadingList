import Foundation
import CoreData
import ReadingList_Foundation

enum BooksModelVersion: String, CaseIterable {
    case version5 = "books_5"
    case version6 = "books_6"
    case version7 = "books_7"
    case version8 = "books_8"
    case version9 = "books_9"
    case version10 = "books_10"
    case version11 = "books_11"
    case version12 = "books_12"
    case version13 = "books_13"
}

extension BooksModelVersion: ModelVersion {
    var modelName: String { return rawValue }
    static var modelBundle: Bundle { return Bundle(for: Book.self) }
    static var modelDirectoryName: String { return "books.momd" }
}
