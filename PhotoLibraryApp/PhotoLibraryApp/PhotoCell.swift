//
//  PhotoCell.swift
//  PhotoLibraryApp
//
//  Created by Jun Ho JANG on 2021/03/22.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureColor()
    }
    
    private func configureColor() {
        self.backgroundColor = ColorGenerator.getRandomColor()
    }
    
}
