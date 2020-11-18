//
//  ListProductViewController.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import UIKit
import Combine

class ListProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var totalLabel: UILabel!

    var viewModel: ListProductViewModel!
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        bindView()
        getProducts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "ItemProductCell", bundle: Bundle.main), forCellReuseIdentifier: "ItemProductCell")
    }
    
    private func getProducts() {
        viewModel.getProducts()
    }
    
    private func bindView() {
        viewModel.items.bind { (_) in
            self.tableView.reloadData()
        }
        
        viewModel.total.bind({
            self.totalLabel.text = $0
        })
    }

}

extension ListProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemProductCell", for: indexPath) as? ItemProductCell else {
            return UITableViewCell.init(frame: CGRect.zero)
        }
        cell.item = viewModel.getItems()[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension ListProductViewController: ItemProductCellDelegate {
    func add(_ item: CheckoutItem) {
        viewModel.addItemProduct(item)
    }
    
    func remove(_ item: CheckoutItem) {
        viewModel.removeItemProduct(item)
    }
}
