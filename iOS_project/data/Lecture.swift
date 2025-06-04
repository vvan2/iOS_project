import Foundation

struct Lecture: Identifiable {
    let id = UUID()
    let title: String
    let professor: String
    let dayIndex: Int
    let timeRange: String
    let colorHex: String // 강의 색상
}
