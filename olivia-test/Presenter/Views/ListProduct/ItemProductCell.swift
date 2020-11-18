//
//  ItemProductCell.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import UIKit

protocol ItemProductCellDelegate: class {
    func add(_ item: CheckoutItem)
    func remove(_ item: CheckoutItem)
}

class ItemProductCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    weak var delegate: ItemProductCellDelegate?
    var item: CheckoutItem! {
        didSet {
            setupCell(item)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func add(_ sender: UIButton) {
        item.amount = item.amount + 1
        amountLabel.text = String(item.amount)
        delegate?.add(item)
    }
    
    @IBAction func remove(_ sender: UIButton) {
        guard item.amount > 0 else {
            return
        }
        
        item.amount = item.amount - 1
        amountLabel.text = String(item.amount)
        delegate?.remove(item)
    }
    
    private func setupCell(_ item: CheckoutItem) {
        nameLabel.text = item.name
        amountLabel.text = String(item.amount)
    }
    
}
