import SwiftUI
// ToggleRow 컴포넌트: 토글 행을 간편하게 재사용하기 위해 분리했습니다.
struct ToggleRow: View {
    var title: String
    @Binding var isOn: Bool

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color.white) // 토글 행 자체는 흰색 배경
    }
}
