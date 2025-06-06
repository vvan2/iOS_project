import SwiftUI

struct SignUpStep1View: View {
    // 뒤로 가기를 컨트롤하는 프레젠테이션 모드 환경 변수
    @Environment(\.dismiss) private var dismiss

    // 1단계에서 입력할 필드에 대한 State
    @State private var name: String = ""
    @State private var studentId: String = ""
    @State private var phoneNumber: String = ""

    var body: some View {
        VStack(spacing: 0) {
            // ─────────────────────────────────────────────────────────
            // 1) 상단: 뒤로가기 버튼 + 진행도 프로그래스바
            // ─────────────────────────────────────────────────────────
            HStack {
                // 뒤로가기 버튼 (화면 왼쪽 상단)
                Button {
                    dismiss() // 이전 화면으로 돌아감
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

            // 진행도 프로그래스바
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 6)

                // 진행 정도를 수치로 조절: 예시로 33%만 채움
                Capsule()
                    .fill(Color(hex: "#A28CF5"))
                    .frame(width: UIScreen.main.bounds.width * 0.35, height: 6)
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)

            // ─────────────────────────────────────────────────────────
            // 2) 제목: "개인 정보를 입력해주세요"
            // ─────────────────────────────────────────────────────────
            Text("개인 정보를 입력해주세요")
                .font(.system(size: 20, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top, 40)

            Spacer().frame(height: 30)

            // ─────────────────────────────────────────────────────────
            // 3) 입력 필드: 이름 / 학번 / 전화번호
            // ─────────────────────────────────────────────────────────
            VStack(spacing: 24) {
                // 3-1) 이름
                VStack(alignment: .leading, spacing: 6) {
                    TextField("이름을 입력해주세요", text: $name)
                        .font(.system(size: 16))
                        .padding(.vertical, 8)
                    Rectangle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(height: 1)
                }

                // 3-2) 학번
                VStack(alignment: .leading, spacing: 6) {
                    TextField("학번을 입력해주세요", text: $studentId)
                        .font(.system(size: 16))
                        .padding(.vertical, 8)
                    Rectangle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(height: 1)
                }

                // 3-3) 전화번호
                VStack(alignment: .leading, spacing: 6) {
                    TextField("전화번호를 입력해주세요", text: $phoneNumber)
                        .font(.system(size: 16))
                        .padding(.vertical, 8)
                    Rectangle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(height: 1)
                }
            }
            .padding(.horizontal, 24)

            Spacer()

            // ─────────────────────────────────────────────────────────
            // 4) 하단: 다음 버튼 (SignUpStep2View로 이동)
            // ─────────────────────────────────────────────────────────
            NavigationLink {
                SignUpStep2View()
            } label: {
                Text("다음")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color(hex: "#A28CF5"))
                    .cornerRadius(24)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
            }
        }
        .navigationBarBackButtonHidden(true) // 시스템 백버튼 감추기
    }
}

#Preview {
    SignUpStep1View()
}
