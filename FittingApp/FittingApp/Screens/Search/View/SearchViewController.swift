//
//  SearchViewController.swift
//  LookLike
//
//  Created by Kirill Khudiakov on 25.02.2021.
//

import UIKit
import SnapKit

import RxSwift
import RxCocoa


struct BrandViewItem {
    let image: UIImage
}

struct CategoryViewItem {
    let text: String
    let image: UIImage
}

struct ProductViewItem {
    let text: String
    let image: UIImage
}

enum SearchViewState {
    case empty
    case product(items: [ProductViewItem])
    case category(items: [CategoryViewItem])
    case brands(items: [BrandViewItem])
}

class SearchViewController: UIViewController, SearchViewProtocol, UIScrollViewDelegate {
    
    private let disposeBag = DisposeBag()
    
    var viewModel: SearchViewModelInput?
    
    private let categriesController = CategoriesViewController()
    private let brandsController = BrandsViewController()
    private let productsController = ProductsViewController()
    
    private var state: SearchViewState = .empty
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Search"
        view.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.font = .mainTitleAndPriceFont(size: 36, weight: .regular)
        return view
    }()
    
    private lazy var searchTextField: UITextField = {
        let view = UITextField()
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        view.placeholder = "Search clothes"
        return view
    }()
    
    private lazy var categoriesButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 6
        view.setTitle("Категории", for: .normal)
        view.titleLabel?.font = .catalogButtonsFont(size: 18, weight: .regular)
        view.setTitleColor( .buttontNormalTitle, for: .normal)
        view.addTarget(self,
                       action: #selector(didTapCategoriesButton),
                       for: .touchUpInside)
        return view
    }()
    
    private lazy var brandsButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 6
        view.setTitle("Бренды", for: .normal)
        view.titleLabel?.font = .catalogButtonsFont(size: 18, weight: .regular)
        view.setTitleColor( .buttontNormalTitle, for: .normal)
        view.addTarget(self,
                       action: #selector(didTapBrandsButton),
                       for: .touchUpInside)
        return view
    }()

    private lazy var buttonsStack: UIStackView = {
            let buttonsStack = UIStackView(arrangedSubviews: [categoriesButton, brandsButton])
        buttonsStack.backgroundColor = .clear
        buttonsStack.axis = .horizontal
        buttonsStack.distribution = .fillEqually
        buttonsStack.spacing = 25
        return buttonsStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addSubview(titleLabel)
        view.addSubview(searchTextField)
        view.addSubview(buttonsStack)
        
        view.addSubview(categriesController.view)
        view.addSubview(brandsController.view)
        view.addSubview(productsController.view)
        addChild(categriesController)
        addChild(brandsController)
        addChild(productsController)
        
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(104)
        }
        
        searchTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(37)
        }
        
        buttonsStack.snp.makeConstraints({ item in
            item.top.equalTo(searchTextField.snp.bottom).offset(21)
            item.height.equalTo(50)
            item.left.equalToSuperview().offset(15)
            item.right.equalToSuperview().offset(-15)
        })
        
        [productsController.view,
         categriesController.view,
         brandsController.view].forEach { subview in
            subview.snp.makeConstraints {
                $0.top.equalTo(buttonsStack.snp.bottom).offset(16)
                $0.left.right.equalToSuperview().inset(16)
                $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }
        }
        
        setupSubscriptions()
        
        viewModel?.viewDidLoad()
    }
    
    @objc
    private func didTapCategoriesButton() {
        print("Кнопка - выбор Категории")
        buttonsStack.arrangedSubviews.forEach {
            $0.backgroundColor = .white
            ($0 as? UIButton)?.setTitleColor(.buttontNormalTitle, for: .normal)
        }
        categoriesButton.backgroundColor = .black
        categoriesButton.setTitleColor(.white, for: .normal)
        viewModel?.didTapCategoryButton()
    }
    
    @objc
    private func didTapBrandsButton() {
        print("Кнопка - выбор Бренды")
        buttonsStack.arrangedSubviews.forEach {
            $0.backgroundColor = .white
            ($0 as? UIButton)?.setTitleColor(.buttontNormalTitle, for: .normal)
        }
        brandsButton.backgroundColor = .black
        brandsButton.setTitleColor(.white, for: .normal)
        viewModel?.didTapBrandButton()
    }
    
    private func setupSubscriptions() {
        brandsController.setCollectionDelegate(self)
        categriesController.setCollectionDelegate(self)
        productsController.setCollectionDelegate(self)
    }
}

extension SearchViewController: SearchViewOutput {
    func applyState(state: SearchViewState) {
        self.state = state
        switch state {
        case let .brands(items):
            brandsController.brandItems.accept(items)
            categriesController.view.isHidden = true
            productsController.view.isHidden = true
            
            brandsController.view.isHidden = false
        case let .category(items):
            categriesController.categoryItems.accept(items)
            brandsController.view.isHidden = true
            productsController.view.isHidden = true
            
            categriesController.view.isHidden = false
        case let .product(items):
            productsController.productsItems.accept(items)
            brandsController.view.isHidden = true
            categriesController.view.isHidden = true
            
            productsController.view.isHidden = false
        case .empty:
            ()
        }
    }
}

extension SearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch state {
        case .brands:
            viewModel?.didSelectBrand(index: indexPath.row)
        case .category:
            viewModel?.didSelectCategory(index: indexPath.row)
        case .product:
            viewModel?.didSelectProduct(index: indexPath.row)
        default:
            ()
        }
    }
    
}
