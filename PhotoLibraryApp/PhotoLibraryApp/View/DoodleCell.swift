//
//  DoodleCell.swift
//  PhotoLibraryApp
//
//  Created by 지북 on 2021/03/25.
//

import UIKit

class DoodleCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "DoodleCell"
    
    static let nib = {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(touchCell(_:)))
        self.addGestureRecognizer(gesture)
    }
    
    func configure(with image: UIImage?) {
        self.imageView.image = image
    }
    
    @objc func touchCell(_ sender: UILongPressGestureRecognizer) {
        self.becomeFirstResponder()
        let menuItem = UIMenuItem(title: "Save", action: #selector(save(_:)))

        UIMenuController.shared.menuItems = [menuItem]
        UIMenuController.shared.showMenu(from: self, rect: self.contentView.frame)
    }
    
    @objc func save(_ sender: UIMenuItem) {
        guard let image = imageView.image else {
            return
        }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        NotificationCenter.default.post(name: Notification.Name("SavePhoto"), object: self)
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(save(_:))
    }
}


