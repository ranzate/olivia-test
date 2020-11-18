//
//  ViewController.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 16/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private var cancellables: Set<AnyCancellable> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let test = ListProductViewModel()
        
        test.dispatch(useCase: GetProductsUseCase(), param: nil) { (response) in
            switch response {
            case .success(let product):
                print(product)
                return
            case .failure(let error):
                print(error)
            }
        }
        
        test.$items.sink { (items) in
            print(items)
        }.store(in: &cancellables)
    }


}

