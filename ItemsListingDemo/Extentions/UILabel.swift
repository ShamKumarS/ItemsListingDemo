import UIKit

extension UILabel {
    
    // MARK: - Internal Methods

    func underline(startingIndex: Int, length: Int) {
        if let textString = self.text {
          let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: startingIndex, length: length))
          attributedText = attributedString
        }
    }
}
