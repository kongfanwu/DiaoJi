import Combine

@MainActor
final class MainTabController: ObservableObject {
    @Published var selectedTab: AppTab = .discovery
}
