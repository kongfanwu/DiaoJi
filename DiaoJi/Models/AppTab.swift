import Foundation

enum AppTab: String, CaseIterable, Identifiable {
    case discovery = "发现"
    case map = "地图"
    case records = "记录"
    case community = "社区"
    case profile = "我的"

    var id: String { rawValue }
    var normalIconName: String {
        switch self {
        case .discovery: "home_normal"
        case .map: "map_normal"
        case .records: "jilu_normal"
        case .community: "shequ_normal"
        case .profile: "me_normal"
        }
    }

    var selectedIconName: String {
        switch self {
        case .discovery: "home_select"
        case .map: "map_select"
        case .records: "jilu_select"
        case .community: "shequ_select"
        case .profile: "me_select"
        }
    }
}
