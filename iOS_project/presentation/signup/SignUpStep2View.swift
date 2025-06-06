import SwiftUI

struct SignUpStep2View: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            // 예시: 상단 뒤로가기 버튼
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(hex: "#A28CF5"))
                }
                .padding(.leading, 20)
                Spacer()
            }
            .padding(.top, 20)

            // 진행도 프로그래스바 (이번에는 두 번째 단계이므로 60% 정도 채움)
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 6)

                Capsule()
                    .fill(Color(hex: "#A28CF5"))
                    .frame(width: UIScreen.main.bounds.width * 0.65, height: 6)
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)

            // 제목 예시
            Text("추가 정보를 입력해주세요")
                .font(.system(size: 20, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top, 40)

            Spacer()

            // 임시 콘텐츠
            Text("여기에 두 번째 단계 폼을 만드세요.")
                .foregroundColor(.gray)

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpStep2View()
}
