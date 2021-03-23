//
//  PhotoCell.swift
//  PhotoLibraryApp
//
//  Created by Jun Ho JANG on 2021/03/22.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    var representedAssetIdentifier: String?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func configure(with image: UIImage?) {
        photoImageView.image = image
    }
}
