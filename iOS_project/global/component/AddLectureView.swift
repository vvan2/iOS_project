import SwiftUI

struct AddLectureDialog: View {
    let onAdd: (Lecture) -> Void
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
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color(hex: "#667eea"), Color(hex: "#764ba2")],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            VStack(spacing: 16) {
                TextField("강의명", text: $title)
                    .textFieldStyle(GlassTextFieldStyle())
                
                TextField("교수님", text: $professor)
                    .textFieldStyle(GlassTextFieldStyle())
                
                HStack {
                    Picker("요일", selection: $selectedDay) {
                        ForEach(0..<days.count, id: \.self) { index in
                            Text(days[index]).tag(index)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(maxWidth: .infinity)
                    
                    Picker("시간", selection: $selectedTime) {
                        ForEach(times, id: \.self) { time in
                            Text(time).tag(time)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(maxWidth: .infinity)
                }
                .frame(height: 120)
            }
            
            HStack(spacing: 16) {
                Button("취소") {
                    // 취소 로직은 부모에서 처리
                }
                .buttonStyle(SecondaryGlassButtonStyle())
                
                Button("추가") {
                    let newLecture = Lecture(
                        title: title,
                        professor: professor,
                        dayIndex: selectedDay,
                        timeRange: selectedTime,
                        colorHex: colors.randomElement() ?? "#667eea"
                    )
                    onAdd(newLecture)
                }

                .buttonStyle(PrimaryGlassButtonStyle())
                .disabled(title.isEmpty || professor.isEmpty)
            }
        }
        .padding(32)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.9),
                                Color.white.opacity(0.7)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                RoundedRectangle(cornerRadius: 24)
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.8),
                                Color.white.opacity(0.4)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            }
        )
        .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 15)
        .padding(24)
    }
}
