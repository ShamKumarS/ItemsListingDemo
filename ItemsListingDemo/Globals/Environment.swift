import Foundation

enum Environment {
    
    // MARK: - Enum cases
    
    case development
    case staging
    case production
    
    // MARK: - Static Properties
    
    static var current: Environment { return .staging }
    static var baseUrl: URL? {
        switch current {
        case .development: return URL(string: "https://second-hand-car-dealer.herokuapp.com/api/v1/")
        case .staging: return URL(string: "https://beta.mba-apps.com/api/v1/")
        default:
            return URL(string: LocalizedKey.emptyText.string)
        }
    }
}
