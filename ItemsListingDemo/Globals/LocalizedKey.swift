import Foundation

enum LocalizedKey: String {
    
    // MARK: - Internal Properties
    
    var string: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
    
    // MARK: - Enum cases
    
    case emptyText = ""
    case ok = "OK"
    case error = "error"
    case alert = "Alert"
    case addMore = "Add more"
    case add = "Add"
}
