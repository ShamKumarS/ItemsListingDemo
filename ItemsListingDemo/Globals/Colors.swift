import UIKit

enum Color {
    
    // MARK: - Static Properties
    
    static let lightBrownColor = UIColor(hex: "#AFAFB2")
    static let borderColor = UIColor(hex: "#DFDFDF")
    static let filledFieldColor = UIColor(hex: "#EAECEF")
    static let buttonColor = UIColor(hex: "#153253")
    static let shadowColor = UIColor(hex: "#565656")
    static let placeholderColor = UIColor(hex: "#BDC2CD")
    static let darkBrownColor = UIColor(hex: "#666666")
    static let removeButtonColor = UIColor(named: "Remove_Button_Color") ?? buttonColor
    static let searchFieldPlaceholderColor = UIColor(named: "Search_Field_Placeholder_Color")
    static let cancelButtonColor = UIColor(named: "Cancel_Button_Color") ?? buttonColor
    static let yellowGreenColor = UIColor(named: "YellowGreenColor") ?? buttonColor
    static let shadow = UIColor(red: 21/255, green: 50/255, blue: 83/255, alpha: 0.05)
}
