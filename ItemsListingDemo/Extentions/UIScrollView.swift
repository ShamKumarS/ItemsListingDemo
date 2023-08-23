import UIKit

// MARK: - UIScrollView Methods

extension UIScrollView {
    
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: 0)
        setContentOffset(desiredOffset, animated: true)
    }
}
