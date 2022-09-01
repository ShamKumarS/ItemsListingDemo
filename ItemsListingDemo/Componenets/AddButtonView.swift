import UIKit

class AddButtonView: BaseNibView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Internal Methods
    
    func setTitleLabel(with title: String) {
        titleLabel.text = "+  \(title)"
    }
}
