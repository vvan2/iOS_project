import Foundation
import SwiftUI

struct SignUpStep2View: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var nickname: String = ""
    @State private var selectedGender: String = ""
    @State private var birthDate = Date()
    @State private var showDatePicker = false
    @State private var showNextStep = false

    let genders = ["남성", "여성", "선택안함"]

    private var isFormValid: Bool {
        !name.isEmpty && !nickname.isEmpty && !selectedGender.isEmpty
    }

    // 컴파일러 부담을 줄이기 위해 개별 색상 변수로 분리
    let color1 = Color(hex: "#9C88FF")
    let color2 = Color(hex: "#A28CF5")
    let color3 = Color(hex: "#B8A9FF")
    let color4 = Color(hex: "#D9D2FB")
    
   

    var body: some View {
        ZStack {
            backgroundGradient
            
            ScrollView {
                VStack(spacing: 0) {
                    headerSection
                    progressBar
                    titleSection
                    
                    Spacer().frame(height: 50)
                    
                    formCard
                    
                    Spacer().frame(height: 60)
                    
                    nextButton
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $showNextStep) {
            SignUpStep3View()
        }
        .sheet(isPresented: $showDatePicker) {
            datePickerSheet
        }
    }
    
    // MARK: - View Components
    
    private var backgroundGradient: some View {
        LinearGradient(
            colors: [color1, color2, color3, color4],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    private var headerSection: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(
                        Circle()
                            .fill(.ultraThinMaterial)
                            .environment(\.colorScheme, .dark)
                    )
            }

            Spacer()

            Text("2 / 3")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
        }
        .padding(.horizontal, 24)
        .padding(.top, 10)
    }
    
    private var progressBar: some View {
        HStack(spacing: 8) {
            progressBarSegment(isActive: true)
            progressBarSegment(isActive: true)
            progressBarSegment(isActive: false)
        }
        .padding(.horizontal, 24)
        .padding(.top, 20)
    }
    
    private func progressBarSegment(isActive: Bool) -> some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(isActive ? .white : .white.opacity(0.3))
            .frame(height: 4)
            .frame(maxWidth: .infinity)
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("개인 정보를 입력해주세요")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)

            Text("프로필 설정을 위한 기본 정보입니다")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
        }
        .padding(.top, 50)
        .padding(.horizontal, 24)
    }
    
    private var formCard: some View {
        VStack(spacing: 24) {
            nameField
            nicknameField
            birthDateField
            genderSelection
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.regularMaterial)
                .environment(\.colorScheme, .dark)
        )
        .padding(.horizontal, 24)
    }
    
    private var nameField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("이름")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)

            TextField("실명을 입력해주세요", text: $name)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(inputFieldBackground)
        }
    }
    
    private var nicknameField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("닉네임")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)

            TextField("사용할 닉네임을 입력해주세요", text: $nickname)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(inputFieldBackground)
        }
    }
    
    private var birthDateField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("생년월일")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)

            Button {
                showDatePicker.toggle()
            } label: {
                HStack {
                    Text(DateFormatter.displayFormatter.string(from: birthDate))
                        .font(.system(size: 16))
                        .foregroundColor(.white)

                    Spacer()

                    Image(systemName: "calendar")
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(inputFieldBackground)
            }
        }
    }
    
    private var genderSelection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("성별")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)

            HStack(spacing: 12) {
                ForEach(genders, id: \.self) { gender in
                    genderButton(for: gender)
                }
            }
        }
    }
    
    private func genderButton(for gender: String) -> some View {
        Button {
            selectedGender = gender
        } label: {
            Text(gender)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(genderButtonBackground(isSelected: selectedGender == gender))
        }
    }
    
    private var nextButton: some View {
        Button {
            showNextStep = true
        } label: {
            Text("다음")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(nextButtonBackground)
        }
        .disabled(!isFormValid)
        .padding(.horizontal, 24)
        .padding(.bottom, 40)
    }
    
    private var datePickerSheet: some View {
        VStack(spacing: 20) {
            Text("생년월일 선택")
                .font(.system(size: 18, weight: .bold))

            DatePicker(
                "생년월일 선택",
                selection: $birthDate,
                in: ...Date(),
                displayedComponents: .date
            )
            .datePickerStyle(.wheel)
            .labelsHidden()

            Button("완료") {
                showDatePicker = false
            }
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(color1)
            )
        }
        .padding(24)
        .presentationDetents([.height(350)])
    }
    
    // MARK: - Helper Views
    
    private var inputFieldBackground: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.ultraThinMaterial)
            .environment(\.colorScheme, .dark)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.white.opacity(0.2), lineWidth: 1)
            )
    }
    
    private func genderButtonBackground(isSelected: Bool) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(isSelected ? .regularMaterial : .ultraThinMaterial)
            .opacity(isSelected ? 0.8 : 1.0)
            .environment(\.colorScheme, .dark)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isSelected ? .white.opacity(0.4) : .white.opacity(0.2),
                        lineWidth: 1
                    )
            )
    }

    
    private var nextButtonBackground: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(isFormValid ? .regularMaterial : .ultraThinMaterial)
            .opacity(isFormValid ? 0.8 : 0.3)
            .environment(\.colorScheme, .dark)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.white.opacity(0.2), lineWidth: 1)
            )
    }
}

// 날짜 포맷터 확장
extension DateFormatter {
    static let displayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }()
}
#Preview{
    SignUpStep2View()
}
