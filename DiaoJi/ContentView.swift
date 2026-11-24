import SwiftUI

struct ContentView: View {
    @StateObject private var controller = MainTabController()

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch controller.selectedTab {
                case .discovery: DiscoveryView()
                case .map: MapView()
                case .records: RecordsView()
                case .community: CommunityView()
                case .profile: ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            TabBarView(selection: $controller.selectedTab)
        }
        .background(Color(hex: 0xF4F8F7).ignoresSafeArea())
        .preferredColorScheme(.light)
    }
}

extension Color {
    init(hex: UInt32) {
        self.init(.sRGB, red: Double((hex >> 16) & 0xff) / 255, green: Double((hex >> 8) & 0xff) / 255, blue: Double(hex & 0xff) / 255, opacity: 1)
    }
}

#Preview { ContentView() }
