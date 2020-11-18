//
//  ListProductRouter.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

class ListProductRouter {
    class func createModule() -> ListProductViewController {
        
        let viewController = ListProductViewController(nibName: "ListProductViewController", bundle: Bundle.main)
        viewController.viewModel = ListProductViewModel()
        
        return viewController
        
    }
}
