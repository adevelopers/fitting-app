//
//  DiscoverViewController.swift
//  LookLike
//
//  Created by Kirill Khudiakov on 25.02.2021.
//


import UIKit
import SnapKit


protocol DiscoverViewInput {
    func setBottomImage(image: UIImage)
}


class DiscoverViewController: UIViewController, DiscoverViewProtocol {
    
    var viewModel: DiscoverViewModelInput?
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Discover"
        view.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.font = .mainTitleAndPriceFont(size: 36, weight: .regular)
        return view
    }()
    
    lazy var bookmarkButton : UIButton = {
        let view = UIButton()
        view.setImage(.bookmarkImg, for: .normal)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addTarget(self,
                       action: #selector(didTapBookmark),
                       for: .touchUpInside)
        return view
    }()
    
    lazy var mannequinBackgroundImg: UIImageView = {
        let view = UIImageView()
        view.image = .mannequinImg
        return view
    }()
    
    lazy var addHeadwearButton : UIButton = {
        let view = UIButton()
        view.setImage(.plusImg, for: .normal)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addTarget(self,
                       action: #selector(didTapAddHeadwearButton),
                       for: .touchUpInside)
        return view
    }()
    
    lazy var addTopClothesButton : UIButton = {
        let view = UIButton()
        view.setImage(.plusImg, for: .normal)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addTarget(self,
                       action: #selector(didTapAddTopClothesButton),
                       for: .touchUpInside)
        return view
    }()
    
    lazy var addBottomClothesButton : UIButton = {
        let view = UIButton()
        view.setImage(.plusImg, for: .normal)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addTarget(self,
                       action: #selector(didTapAddBottomClothesButton),
                       for: .touchUpInside)
        return view
    }()
    
    lazy var addBagButton : UIButton = {
        let view = UIButton()
        view.setImage(.plusImg, for: .normal)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addTarget(self,
                       action: #selector(didTapAddBagButton),
                       for: .touchUpInside)
        return view
    }()
    
    lazy var addShoesButton : UIButton = {
        let view = UIButton()
        view.setImage(.plusImg, for: .normal)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addTarget(self,
                       action: #selector(didTapAddShoesButton),
                       for: .touchUpInside)
        return view
    }()
    
    // примерочные картинки
    private lazy var bottomImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.setNavigationBarHidden(true, animated: true)

        view.addSubview(bookmarkButton)
        view.addSubview(mannequinBackgroundImg)
        view.addSubview(titleLabel)
        view.addSubview(addHeadwearButton)
        view.addSubview(addTopClothesButton)
        view.addSubview(addBottomClothesButton)
        view.addSubview(addBagButton)
        view.addSubview(addShoesButton)
        
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-42)
            $0.centerY.equalTo(titleLabel)
        }
        
        mannequinBackgroundImg.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(35)
            $0.centerX.equalToSuperview()
        }
        
        addHeadwearButton.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalTo(24)
            $0.right.equalTo(mannequinBackgroundImg.snp.right).offset(-80)
            $0.top.equalTo(mannequinBackgroundImg.snp.top)
        }
        
        addTopClothesButton.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalTo(24)
            $0.left.equalTo(mannequinBackgroundImg.snp.left)
            $0.top.equalTo(mannequinBackgroundImg.snp.top).offset(120)
        }
        
        addBottomClothesButton.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalTo(24)
            $0.left.equalTo(mannequinBackgroundImg.snp.left).offset(28)
            $0.bottom.equalTo(mannequinBackgroundImg.snp.bottom).offset(-183)
        }
        
        addBagButton.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalTo(24)
            $0.left.equalTo(mannequinBackgroundImg.snp.right).offset(-18)
            $0.bottom.equalTo(mannequinBackgroundImg.snp.bottom).offset(-220)
        }
        
        addShoesButton.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalTo(24)
            $0.right.equalTo(mannequinBackgroundImg.snp.right).offset(-31)
            $0.bottom.equalTo(mannequinBackgroundImg.snp.bottom).offset(-16)
        }
        
        view.addSubview(bottomImageView)
        bottomImageView.snp.makeConstraints {
            $0.bottom.equalTo(mannequinBackgroundImg.snp.bottom).inset(100)
            $0.width.equalTo(160)
            $0.height.equalTo(260)
            $0.centerX.equalTo(mannequinBackgroundImg.snp.centerX)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.navigationBar.barTintColor = .white
    }
    
    @objc
    private func didTapBookmark() {
        bookmarkButton.setImage(.bookmarkMakedImg, for: .normal)
        print("Кнопка - Закладка")
    }
    
    @objc
    private func didTapAddHeadwearButton() {
        print("Кнопка - Добавить голоной убор")
    }
    
    @objc
    private func didTapAddTopClothesButton() {
        print("Кнопка - Добавить верх")
    }
    
    @objc
    private func didTapAddBottomClothesButton() {
        print("Кнопка - Добавить низ")
    }
    
    @objc
    private func didTapAddBagButton() {
        print("Кнопка - Добавить сумку")
    }
    
    @objc
    private func didTapAddShoesButton() {
        print("Кнопка - Добавить обувь")
        
        
        
    }
    

}

extension DiscoverViewController: DiscoverViewInput {
    func setBottomImage(image: UIImage) {
        bottomImageView.image = image
    }
    
}
