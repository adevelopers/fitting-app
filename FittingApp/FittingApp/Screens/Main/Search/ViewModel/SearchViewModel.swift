//
//  SearchViewModel.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 04.03.2021.
//

import UIKit


protocol SearchViewModelInput {
    func didTapCategoryButton()
    func didTapBrandButton()
    func didSelectCategory(index: Int)
    func didSelectBrand(index: Int)
    func didSelectProduct(index: Int)
    
    func viewDidLoad()
}

protocol SearchViewOutput {
    func applyState(state: SearchViewState)
}

struct CategoryModel {
    let title: String
    let imageLink: String
}

struct BrandModel {
    let imageLink: String
}

struct ProductModel {
    let title: String
    let imageLink: String
}

class SearchViewModel {
    var coordinator: SearchFlow?
    var view: SearchViewOutput?
    
    var categoryItems: [CategoryModel] = []
    var brandsItems: [BrandModel] = []
    var productsItems: [ProductModel] = []
    
    init() {
        brandsItems = [
            .init(imageLink: .hm),
            .init(imageLink: .armani),
            .init(imageLink: .gucci),
            .init(imageLink: .fendi),
            .init(imageLink: .calvinKlein),
            .init(imageLink: .km)
        ]
        
        categoryItems = [
            .init(title: "Джинсы", imageLink: "jeans_cat"),
            .init(title: "Куртки", imageLink: "cardigan_cat"),
            .init(title: "Пальто", imageLink: "coat_cat"),
            .init(title: "Юбки", imageLink: "skirt_cat")
        ]
        
        productsItems = [
            .init(title: "Юбка 1", imageLink: "skirt1"),
            .init(title: "Юбка 2", imageLink: "skirt2"),
            .init(title: "Юбка 3", imageLink: "skirt3")
        ]
    }
    
    private func mapBrandViewItem(_ item: BrandModel) -> BrandViewItem {
        BrandViewItem(image: UIImage(imageLiteralResourceName: item.imageLink))
    }
    
    private func mapCategoryViewItem(_ item: CategoryModel) -> CategoryViewItem {
        CategoryViewItem(text: item.title, image: UIImage(imageLiteralResourceName: item.imageLink))
    }
    
    private func mapProductViewItem(_ item: ProductModel) -> ProductViewItem {
        ProductViewItem(text: item.title, image: UIImage(imageLiteralResourceName: item.imageLink))
    }
    
}

extension SearchViewModel: SearchViewModelInput {
    
    func didSelectProduct(index: Int) {
        print("Выбран товар \(productsItems[index].title)")
    }
    
    
    func didSelectCategory(index: Int) {
        view?.applyState(state: .product(items: productsItems.map(mapProductViewItem)))
    }
    
    func didSelectBrand(index: Int) {
        view?.applyState(state: .product(items: productsItems.map(mapProductViewItem)))
    }
    
    func viewDidLoad() {
        view?.applyState(state: .brands(items: brandsItems.map(mapBrandViewItem) ))
    }
    
    func didTapCategoryButton() {
        view?.applyState(state: .category(items: categoryItems.map(mapCategoryViewItem)))
    }
    
    func didTapBrandButton() {
        view?.applyState(state: .brands(items: brandsItems.map(mapBrandViewItem) ))
    }
    
}


fileprivate extension String {
    static let calvinKlein = "ck"
    static let km = "km"
    static let hm = "hm"
    static let tommy = "tommy"
    static let mango = "mango"
    static let gucci = "gucci"
    static let armani =  "armani"
    static let fendi = "fendi"
    
    //
    
    
}

