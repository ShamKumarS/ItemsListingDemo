import Foundation

enum AttachmentType: CaseIterable {
    
    // MARK: - Enum cases
    
    case imageJpeg
    case imagePng
    
    // MARK: - Internal Properties
    
    var backendName: String {
        switch self {
        case .imageJpeg:
            return "image/jpeg"
        case .imagePng:
            return "image/png"
        }
    }
    
    var extensionName: String {
        switch self {
        case .imageJpeg:
            return ".jpeg"
        case .imagePng:
            return ".png"
        }
    }
}
