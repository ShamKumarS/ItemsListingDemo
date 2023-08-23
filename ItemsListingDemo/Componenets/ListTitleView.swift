import UIKit

class ListTitleView: BaseNibView {
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var itemCount: UILabel!
    
    // MARK: - Internal Methods
    
    func setTitleLabel(with title: String) {
        self.title.text = title
    }
    
    func setCountLabel(with count: Int) {
        itemCount.text = "\(count) Items"
    }
}
