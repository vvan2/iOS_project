import SwiftUI

struct MyView: View {
    @State private var alarmOn = true
    @State private var adOn = true
    @State private var messageOn = true

    var body: some View {
        VStack(spacing: 0) {
            // 상단 배경
            ZStack(alignment: .topLeading) {
                Color(hex: "#A28CF5")
                    .frame(height: 180)
                    .ignoresSafeArea(edges: .top)

                Text("My Buggi")
                    .font(.custom("Marker Felt", size: 26))
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                    .padding(.top, 40)
            }

            // 프로필
            HStack(alignment: .top, spacing: 16) {
                // 왼쪽 캐릭터
                ZStack {
                    Circle()
                        .fill(Color(hex: "#9A83F7"))
                        .frame(width: 80, height: 80)

                    HStack(spacing: 8) {
                        Circle().fill(.white).frame(width: 12, height: 20)
                        Circle().fill(.white).frame(width: 12, height: 20)
                    }
                }

                // 오른쪽 뷰 묶음
                VStack(spacing: 16) {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 180, height: 140)

                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 100, height: 60)
                }

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, -40)


            // 토글 설정
            VStack(spacing: 0) {
                ToggleRow(title: "알람 설정", isOn: $alarmOn)
                ToggleRow(title: "광고 수신", isOn: $adOn)
                ToggleRow(title: "메세지 알람", isOn: $messageOn)
            }
            .background(Color.white)
            .padding(.top, 10)

            // 구분선
            Rectangle()
                .fill(Color(hex: "#A28CF5").opacity(0.5))
                .frame(height: 2)
                .padding(.top, 8)

            Spacer()

            // 하단 버튼
            VStack(spacing: 12) {
                Button(action: {}) {
                    Text("로그아웃")
                        .foregroundColor(.white)
                        .frame(width: 120, height: 40)
                        .background(Color(hex: "#A28CF5"))
                        .cornerRadius(20)
                }

                Button(action: {}) {
                    Text("회원탈퇴")
                        .foregroundColor(.gray)
                        .frame(width: 120, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                }

                Text("회원정보를 완전히 삭제하고 싶으신가요?")
                    .font(.footnote)
                    .foregroundColor(.gray.opacity(0.7))
            }
            .padding(.bottom, 40)
        }
        .background(Color.white)
        .ignoresSafeArea(edges: .top)
    }
}
