import SwiftUI

struct AddLectureDialog: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var title = ""
    @State private var professor = ""
    @State private var dayIndex = 0
    @State private var start: Date = Date()
    @State private var end: Date = Date()

    let onSave: (Lecture) -> Void
    let days = ["월", "화", "수", "목", "금"]

    var body: some View {
        VStack(spacing: 16) {
            Text("강의 추가")
                .font(.headline)

            TextField("과목명", text: $title)
                .textFieldStyle(.roundedBorder)

            TextField("교수명", text: $professor)
                .textFieldStyle(.roundedBorder)

            Picker("요일", selection: $dayIndex) {
                ForEach(0..<days.count, id: \.self) {
                    Text(days[$0])
                }
            }
            .pickerStyle(.segmented)

            HStack {
                DatePicker("시작시간", selection: $start, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("~")
                DatePicker("종료시간", selection: $end, displayedComponents: .hourAndMinute)
                    .labelsHidden()
            }

            Button("저장") {
                print("📝 저장 버튼 클릭됨")
                let purpleColors = ["#9568d5", "#886dd7", "#a87ef4", "#b189d8", "#8e7bf9"]
                let randomColor = purpleColors.randomElement() ?? "#a87ef4"

                let new = Lecture(
                    title: title,
                    professor: professor,
                    dayIndex: dayIndex,
                    timeRange: "\(formattedTime(start)) ~ \(formattedTime(end))",
                    colorHex: randomColor
                )
                onSave(new)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(hex: "#A28CF5"))
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .background(colorScheme == .dark ? Color.black : .white)
        .cornerRadius(16)
        .shadow(radius: 10)
        .frame(width: 300)
    }

    private func formattedTime(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: time)
    }
}
