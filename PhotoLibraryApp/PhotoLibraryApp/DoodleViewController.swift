//
//  DoodleViewController.swift
//  PhotoLibraryApp
//
//  Created by Jun Ho JANG on 2021/03/24.
//

import UIKit

private let reuseIdentifier = "Cell"

class DoodleViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        configureDoodleCollectionView()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
    
    func configureDoodleCollectionView() {
        self.collectionView.backgroundColor = .darkGray
        self.title = "Dooodle Library"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeDoodleCollectionView))
    }
    
    @objc func closeDoodleCollectionView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
