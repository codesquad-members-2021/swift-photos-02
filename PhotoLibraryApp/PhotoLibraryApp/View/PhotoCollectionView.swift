//
//  PhotoCollectionView.swift
//  PhotoLibraryApp
//
//  Created by 지북 on 2021/03/22.
//

import UIKit
import Photos

class PhotoCollectionView: UICollectionView {
    init(collectionView: UICollectionView, frame: CGRect) {
        let layout = UICollectionViewLayout()
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        self.dataSource = self
        self.delegate = self
    }
}

extension PhotoCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoManager.shared.countPhotos()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        let asset = PhotoManager.shared.getAsset(indexPath: indexPath)
        PhotoManager.shared.requestIamge(with: asset, thumbnailSize: CGSize(width: 100, height: 100)) { (image) in
            cell.photoImageView.image = image
        }
        return cell
    }
}

extension PhotoCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension PhotoCollectionView: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        changeInstance.changeDetails(for: PHAsset.fetchAssets(with: nil))
    }
}
