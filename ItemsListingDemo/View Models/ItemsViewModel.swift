import Foundation

class ItemsViewModel {
    
    
    // MARK:- Internal Properties
    
    var itemsData = [Item]()
    
    // MARK:- Initializer Methods
    
    init() {
        if itemsData.isEmpty {
            loadItemsData()
        }
    }
    
    // MARK:- Private Methods
    
    private func loadItemsData() {
        itemsData.append(Item(title: "Food", isSelected: false))
        itemsData.append(Item(title: "Drink", isSelected: false))
        itemsData.append(Item(title: "Eat Fruits", isSelected: true))
    }
}
