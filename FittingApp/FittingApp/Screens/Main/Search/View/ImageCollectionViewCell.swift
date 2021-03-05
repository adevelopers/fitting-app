//
//  ImageCollectionViewCell.swift
//  FittingApp
//
//  Created by Kirill Khudiakov on 05.03.2021.
//

import UIKit


class ImageCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView = {
       UIImageView()
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(image: UIImage) {
        imageView.image = image
    }
    
}

