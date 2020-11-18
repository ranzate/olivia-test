//
//  ListProductViewModel.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation
import Combine

class ListProductViewModel: BaseViewModel {
    
    @Inject var getProductUseCase: GetProductsUseCase!
    @Inject var applyDiscountUseCase: ApplyDiscountUseCase!
    
    var items: Observable<[CheckoutItem]> = Observable([])
    var total: Observable<String> = Observable("--")
    
    func getProducts() {
        dispatch(useCase: getProductUseCase, param: nil) { (result) in
            switch result {
            case .success(let product):
                self.items.value = product.map({ CheckoutItem(name: $0.name ?? "", code: $0.code ?? "", amount: 0, price: $0.price ?? 0.0) })
                return
            case .failure(let error):
                self.error.value = error.message
                return
            }
        }
    }
    
    func addItemProduct(_ item: CheckoutItem) {
        updateList(item)
        applyDiscount()
    }
    
    func removeItemProduct(_ item: CheckoutItem) {
        updateList(item)
        applyDiscount()
    }
    
    func getItems() -> [CheckoutItem] {
        return items.value
    }
    
    private func applyDiscount() {
        dispatch(useCase: applyDiscountUseCase, param: items.value) { (result) in
            switch result {
            case .success(let total):
                self.total.value = total.currencyFormatting()
                return
            case .failure(let error):
                self.error.value = error.message
                return
            }
        }
    }
    
    private func updateList(_ item: CheckoutItem) {
        let items: [CheckoutItem] = self.items.value.map({
            if $0.code == item.code{
                return item
            }
            return $0
        })
        self.items.value = items
    }
}
