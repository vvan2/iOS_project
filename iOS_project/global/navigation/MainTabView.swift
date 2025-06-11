import SwiftUI

struct MainTabView: View {
    let onLogout: () -> Void
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "sun.max")
                    Text("홈")
                }

            ScheduleView()
                .tabItem {
                    Image(systemName: "clock")
                    Text("일정")
                }

            InfoView()
                .tabItem {
                    Image(systemName: "doc.plaintext")
                    Text("정보")
                }

            NavigationStack {
                ChatView()
            }
            .tabItem {
                Image(systemName: "bubble.left.and.bubble.right")
                Text("챗봇")
            }

            MyView(onLogout: onLogout)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("마이")
                }
        }
    }
}
