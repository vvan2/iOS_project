import SwiftUI

struct ChatRoomView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var inputText = ""

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(viewModel.messages) { msg in
                            HStack {
                                if msg.isUser {
                                    Spacer()
                                    Text(msg.text)
                                        .padding()
                                        .background(Color(hex: "#A28CF5"))
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                } else {
                                    Text(msg.text)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(12)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                }
            }

            // 입력창
            HStack {
                TextField("메시지를 입력하세요", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                Button("전송") {
                    guard !inputText.isEmpty else { return }
                    viewModel.sendMessage(inputText)
                    inputText = ""
                }
                .padding(.horizontal)
                .background(Color(hex: "#A28CF5"))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
        .background(Color(hex: "#C5B6FA").ignoresSafeArea())
        .navigationTitle("Buggi chat")
    }
}

