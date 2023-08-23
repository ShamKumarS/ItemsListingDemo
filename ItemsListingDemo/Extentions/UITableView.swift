import Foundation
import UIKit

extension UITableView {
    
    // MARK: - Internal Methods
    
    func dequeueCell<T: UITableViewCell>(for indexpath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexpath) as! T
    }
}
