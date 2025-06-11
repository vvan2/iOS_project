import SwiftUI

struct AddLectureDialog: View {
    @Binding var isPresented: Bool
    let onAdd: (Lecture) -> Void

    @State private var title = ""
    @State private var professor = ""
    @State private var selectedDay = 0
    @State private var selectedTime = "09:00"

    let days = ["월", "화", "수", "목", "금"]
    let times = ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]
    let colors = ["#ff6b6b", "#4ecdc4", "#45b7d1", "#96ceb4", "#feca57", "#ff9ff3", "#54a0ff"]

    var body: some View {
        ZStack {
            // Background overlay
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    isPresented = false
                }
            
            // Dialog container
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 16) {
                    // Handle bar
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 6)
                        .padding(.top, 12)
                    
                    Text("새 강의 추가")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.primary)
                }
                .padding(.bottom, 24)
                
                // Content
                VStack(spacing: 20) {
                    // Title Input
                    VStack(alignment: .leading, spacing: 8) {
                        Text("강의명")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.secondary)
                        
                        TextField("강의명을 입력하세요", text: $title)
                            .font(.system(size: 16))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.08))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                    )
                            )
                    }
                    
                    // Professor Input
                    VStack(alignment: .leading, spacing: 8) {
                        Text("교수명")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.secondary)
                        
                        TextField("교수명을 입력하세요", text: $professor)
                            .font(.system(size: 16))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.08))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                    )
                            )
                    }
                    
                    // Day and Time Selection
                    HStack(spacing: 16) {
                        // Day Picker
                        VStack(alignment: .leading, spacing: 8) {
                            Text("요일")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.secondary)
                            
                            Menu {
                                ForEach(0..<days.count, id: \.self) { index in
                                    Button(days[index]) {
                                        selectedDay = index
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(days[selectedDay])
                                        .font(.system(size: 16))
                                        .foregroundColor(.primary)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(.secondary)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 14)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.gray.opacity(0.08))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                        )
                                )
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        // Time Picker
                        VStack(alignment: .leading, spacing: 8) {
                            Text("시간")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.secondary)
                            
                            Menu {
                                ForEach(times, id: \.self) { time in
                                    Button(time) {
                                        selectedTime = time
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(selectedTime)
                                        .font(.system(size: 16))
                                        .foregroundColor(.primary)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(.secondary)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 14)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.gray.opacity(0.08))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                        )
                                )
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal, 24)
                
                // Action Buttons
                HStack(spacing: 12) {
                    // Cancel Button
                    Button(action: {
                        isPresented = false
                    }) {
                        Text("취소")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                    )
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    // Add Button
                    Button(action: {
                        let lecture = Lecture(
                            title: title,
                            professor: professor,
                            dayIndex: selectedDay,
                            timeRange: selectedTime,
                            colorHex: colors.randomElement() ?? "#667eea"
                        )
                        onAdd(lecture)
                        isPresented = false
                    }) {
                        Text("추가")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(
                                        title.isEmpty || professor.isEmpty
                                        ? AnyShapeStyle(Color.gray.opacity(0.3))
                                        : AnyShapeStyle(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color(hex: "#667EEA"), Color(hex: "#764BA2")]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                    )

                            )
                    }
                    .disabled(title.isEmpty || professor.isEmpty)
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal, 24)
                .padding(.top, 32)
                .padding(.bottom, 24)
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(UIColor.systemBackground))
                    .shadow(color: .black.opacity(0.15), radius: 20, x: 0, y: 8)
            )
            .padding(.horizontal, 20)
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.8), value: isPresented)
    }
}
