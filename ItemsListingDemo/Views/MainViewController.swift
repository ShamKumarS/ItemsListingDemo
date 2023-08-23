//
//  ViewController.swift
//  ItemsListingDemo
//
//  Created by BrainX IOS on 26/08/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mainView: MainView!
    
    // MARK: - Private Properties
    
    private var itemsViewModel = ItemsViewModel()
    private var contentSizeObservation: NSKeyValueObservation?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnLoad()
    }
    
    // MARK: - Deinitializer

    deinit {
        contentSizeObservation?.invalidate()
    }
    
    // MARK: - Private Methods
    
    private func configureOnLoad() {
        mainView.itemsTableView.register(ItemTableCell.nib(), forCellReuseIdentifier: ItemTableCell.reuseIdentifier)
        mainView.itemsTableView.delegate = self
        mainView.itemsTableView.dataSource = self
        contentSizeObservation = mainView.itemsTableView.observe(\.contentSize, options: .new, changeHandler: { [weak self] (tv, _) in
            guard let self = self else { return }
            self.mainView.tableViewHeightConstraint.constant = tv.contentSize.height
            self.mainView.stackHeightConstraint.constant = tv.contentSize.height
        })
        mainView.addButtonView.addTapAction(#selector(addItem(sender:)), target: self)
    }
    
    // MARK: - Action Methods
    
    @objc
    func toggleCheckbox(sender: UIButton) {
        let buttonTag = sender.tag
        let itemData = itemsViewModel.itemsData[buttonTag]
        itemData.isSelected = !itemData.isSelected
        mainView.itemsTableView.reloadData()
    }
    
    @objc
    func deleteItem(sender: UIButton) {
        let buttonTag = sender.tag
        itemsViewModel.itemsData.remove(at: buttonTag)
        mainView.itemsTableView.reloadData()
    }
    
    @objc
    func addItem(sender: UIButton) {
        itemsViewModel.itemsData.append(Item(title: LocalizedKey.emptyText.string, isSelected: false))
        mainView.itemsTableView.reloadData()
    }
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        let tag = textField.tag
        guard let text = textField.text else { return }
        itemsViewModel.itemsData[tag].title = text
    }
}

// MARK: - UITableViewDataSource Methods

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itemsCount = itemsViewModel.itemsData.count
        mainView.listHeaderView.setCountLabel(with: itemsCount)
        itemsCount > 0 ? mainView.addButtonView.setTitleLabel(with: LocalizedKey.addMore.string) : mainView.addButtonView.setTitleLabel(with: LocalizedKey.add.string)
        return itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemTableCell = tableView.dequeueCell(for: indexPath)
        let item = itemsViewModel.itemsData[indexPath.row]
        cell.setData(item.title, item.isSelected, indexPath.row)
        cell.checkbox.addTarget(self, action: #selector(toggleCheckbox(sender:)), for: .touchUpInside)
        cell.crossButton.addTarget(self, action: #selector(deleteItem(sender:)), for: .touchUpInside)
        cell.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        return cell
    }
}

// MARK: - UITableViewDelegate Methods

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
