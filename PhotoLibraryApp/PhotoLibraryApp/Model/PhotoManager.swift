//
//  PhotoManager.swift
//  PhotoLibraryApp
//
//  Created by Jun Ho JANG on 2021/03/23.
//

import Photos
import UIKit

class PhotoManager {
    static var shared = PhotoManager()
    let imageManager = PHCachingImageManager()
    var representedAssetIdentifier: String?
    
    func countPhotos() -> Int {
        return PHAsset.fetchAssets(with: nil).count
    }
    
    func getAsset(indexPath: IndexPath) -> PHAsset? {
        return PHAsset.fetchAssets(with: nil)[indexPath.item]
    }
    
    func requestIamge(with asset: PHAsset?, thumbnailSize: CGSize, completion: @escaping (UIImage?) -> Void) {
        guard let asset = asset else {
            completion(nil)
            return
        }
        self.representedAssetIdentifier = asset.localIdentifier
        self.imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil, resultHandler: { image, info in
            if self.representedAssetIdentifier == asset.localIdentifier {
                completion(image)
            }
        })
    }
}
