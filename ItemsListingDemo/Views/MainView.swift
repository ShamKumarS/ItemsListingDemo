//
//  View.swift
//  ItemsListingDemo
//
//  Created by BrainX IOS on 30/08/2022.
//

import UIKit

class MainView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var contentView: UIStackView!
    @IBOutlet weak var listHeaderView: ListTitleView!
    @IBOutlet weak var addButtonView: AddButtonView!
    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        configureViewsOnLoad()
    }
    
    // MARK: - Private Methods
    
    private func configureViewsOnLoad() {
        contentView.setCornerRadius(20, andClipContent: true)
        listHeaderView.addBorder(.bottom, withColor: .lightGray, andWidth: 0.2)
        addButtonView.setBorderColor(.lightGray, andWidth: 0.5)
        addButtonView.clipsToBounds = true
    }
}
