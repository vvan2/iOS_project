import Foundation

struct Lecture: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var professor: String
    var dayIndex: Int
    var timeRange: String
}
