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
    case search(items: [ProductViewItem])
    case category(items: [CategoryViewItem])
    case brands(items: [BrandViewItem])
}

class SearchViewController: UIViewController, SearchViewProtocol, UIScrollViewDelegate {
    
    private let disposeBag = DisposeBag()
    
    var viewModel: SearchViewModelInput?
    
    private lazy var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 107, height: 107)
        layout.sectionInset = .init(top: 8, left: 0, bottom: 8, right: 0)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
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
        view.setTitleColor( #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
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
        view.setTitleColor( #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
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
        view.addSubview(collectionView)
        
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
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(buttonsStack.snp.bottom)
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        setupSubscriptions()
        
        viewModel?.viewDidLoad()
    }
    
    @objc
    private func didTapCategoriesButton() {
        print("Кнопка - выбор Категории")
        viewModel?.didTapCategoryButton()
    }
    
    @objc
    private func didTapBrandsButton() {
        print("Кнопка - выбор Бренды")
        viewModel?.didTapBrandButton()
    }
    
    private var brandItems = BehaviorRelay<[BrandViewItem]>.init(value: [])
    
    private func setupSubscriptions() {
        brandItems
            .bind(to: collectionView.rx.items) { (c, i, e) in
                let cell = c.dequeueReusableCell(withReuseIdentifier: "cell", for: IndexPath(row: i, section: 0))
                (cell as? ImageCollectionViewCell)?.setup(image: e.image)
                return cell
            }
            .disposed(by: disposeBag)
        
        collectionView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
    }
}

extension SearchViewController: SearchViewOutput {
    func applyState(state: SearchViewState) {
        
        switch state {
        case let .brands(items):
            brandItems.accept(items)
        default:
            ()
        }
        
        collectionView.reloadData()
    }
}

extension SearchViewController: UICollectionViewDelegate {
    
}
