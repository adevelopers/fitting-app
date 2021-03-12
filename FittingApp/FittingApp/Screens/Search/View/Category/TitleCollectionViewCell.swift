//
//  TitleCollectionViewCell.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 05.03.2021.
//

import UIKit


class TitleCollectionViewCell: UICollectionViewCell {
    
    static let reuseId: String = {
        String(describing: self)
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .catalogButtonsFont(size: 16, weight: .regular) //UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        return label
    }()
    
    private var imageView: UIImageView = {
       UIImageView()
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(title: String, image: UIImage?) {
        titleLabel.text = title
        imageView.image = image
    }
    
}

