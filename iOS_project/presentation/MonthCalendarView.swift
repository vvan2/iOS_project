import SwiftUI

struct MonthCalendarView: View {
    var body: some View {
        VStack {
            Text("6월")
                .font(.title3)
                .padding()

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 16) {
                ForEach(["일", "월", "화", "수", "목", "금", "토"], id: \.self) {
                    Text($0)
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                ForEach(1..<32) { day in
                    Text("\(day)")
                        .frame(maxWidth: .infinity)
                        .padding(4)
                        .foregroundColor(.black.opacity(0.7))
                }
            }
            .padding()
        }
    }
}
#Preview {
    MonthCalendarView()
}
