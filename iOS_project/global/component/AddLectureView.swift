import SwiftUI

struct AddLectureDialog: View {
    @Binding var isPresented: Bool
    let onAdd: (Lecture) -> Void

    // 기존 상태들 그대로 유지
    @State private var title = ""
    @State private var professor = ""
    @State private var selectedDay = 0
    @State private var selectedTime = "09:00"

    let days = ["월", "화", "수", "목", "금"]
    let times = ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]
    let colors = ["#ff6b6b", "#4ecdc4", "#45b7d1", "#96ceb4", "#feca57", "#ff9ff3", "#54a0ff"]

    var body: some View {
        VStack(spacing: 24) {
            Text("새 강의 추가")
                .font(.title)
                .bold()

            TextField("강의명", text: $title)
            TextField("교수명", text: $professor)

            HStack {
                Picker("요일", selection: $selectedDay) {
                    ForEach(0..<days.count, id: \.self) { i in
                        Text(days[i])
                    }
                }
                Picker("시간", selection: $selectedTime) {
                    ForEach(times, id: \.self) { time in
                        Text(time)
                    }
                }
            }

            HStack {
                Button("취소") {
                    isPresented = false
                }

                Button("추가") {
                    let lecture = Lecture(
                        title: title,
                        professor: professor,
                        dayIndex: selectedDay,
                        timeRange: selectedTime,
                        colorHex: colors.randomElement() ?? "#667eea"
                    )
                    onAdd(lecture)
                    isPresented = false
                }
                .disabled(title.isEmpty || professor.isEmpty)
            }
        }
        .padding()
    }
}
