import Foundation

class Item {
    
    // MARK: Internal Properties
    
    var title = LocalizedKey.emptyText.string
    var isSelected = false
    
    // MARK:- Initializer Methods

    private init() {}
    
    init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }
}
