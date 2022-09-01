import UIKit

extension UIFont {
    
    // MARK: - Static Methods
    
    static func brownStdRegular(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "BrownStd-Regular", size: size)
    }
    
    static func brownStdBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "BrownStd-Bold", size: size)
    }
    
    static func poppinsRegular(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Regular", size: size)
    }
    
    static func poppinsMedium(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Medium", size: size)
    }
    
    static func poppinsSemiBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-SemiBold", size: size)
    }
    
    static func poppinsBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Bold", size: size)
    }
    
    static func sfProTextRegular(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "SFProText-Regular", size: size)
    }
    
    static func sfProTextSemibold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "SFProText-Semibold", size: size)
    }
}
