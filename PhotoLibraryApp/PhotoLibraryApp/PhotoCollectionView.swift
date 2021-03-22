//
//  PhotoCollectionView.swift
//  PhotoLibraryApp
//
//  Created by 지북 on 2021/03/22.
//

import UIKit

class PhotoCollectionView: UICollectionView {
    func configureCollectionView(at dataSource: UICollectionViewDataSource, at delegate: UICollectionViewDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
    }
}


extension PhotoCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension PhotoCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
