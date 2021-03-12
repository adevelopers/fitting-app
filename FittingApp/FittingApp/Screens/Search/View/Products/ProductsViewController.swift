//
//  ProductsViewController.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 05.03.2021.
//


import UIKit
import SnapKit
import RxCocoa
import RxSwift


final class ProductsViewController: UIViewController {
    
    
    var productsItems = BehaviorRelay<[ProductViewItem]>.init(value: [])
    
    private let disposeBag = DisposeBag()
    
    private lazy var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 91, height: 107)
        layout.sectionInset = .init(top: 8, left: 0, bottom: 8, right: 0)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsItems
            .bind(to: collectionView.rx.items) { (c, i, e) in
                let cell = c.dequeueReusableCell(withReuseIdentifier: "cell", for: IndexPath(row: i, section: 0))
                (cell as? ImageCollectionViewCell)?.setup(image: e.image)
                return cell
            }
            .disposed(by: disposeBag)
        
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setCollectionDelegate(_ delegate: UICollectionViewDelegate) {
        collectionView.delegate = delegate
    }
    
}
