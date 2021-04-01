//
//  DiscoverViewModel.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 03.03.2021.
//

import UIKit

protocol DiscoverViewModelInput {
    
}

protocol DiscoverViewModelOutput {
    func didSearchProduct(product: ProductModel)
}

class DiscoverViewModel {
    var coordinator: DiscoverFlow?
    var view: DiscoverViewInput?
    // Output View
}

extension DiscoverViewModel: DiscoverViewModelInput {
    // Input
    
    
}

extension DiscoverViewModel: DiscoverViewModelOutput {
    func didSearchProduct(product: ProductModel) {
        
        switch product.bodyLocation {
        case .bottom:
            let image = UIImage(imageLiteralResourceName: product.imageLink)
            view?.setBottomImage(image: image)
        default:
            ()
        }
        
    }
    
    
}
