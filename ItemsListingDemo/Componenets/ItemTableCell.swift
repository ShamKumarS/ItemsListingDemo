import UIKit

class ItemTableCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var checkbox: UIButton!
    @IBOutlet weak var crossButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Internal Methods
    
    func setData(_ title: String, _ isSelected: Bool, _ tag: Int) {
        textField.text = title
        setCheckbox(isSelected)
        textField.tag = tag
        checkbox.tag = tag
        crossButton.tag = tag
    }
    
    func setCheckbox(_ isSelected: Bool) {
        let image = isSelected ? UIImage(named: Images.selected) : UIImage(named: Images.unselected)
        checkbox.setImage(image, for: .normal)
    }
    
    
    
}
