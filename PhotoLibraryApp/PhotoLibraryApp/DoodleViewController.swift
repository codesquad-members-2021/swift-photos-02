//
//  DoodleViewController.swift
//  PhotoLibraryApp
//
//  Created by Jun Ho JANG on 2021/03/24.
//

import UIKit


class DoodleViewController: UICollectionViewController {
    
    var doodleDataManager = DoodleDataManager()
    var identifier = "DoodleCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView!.register(DoodleCell.nib(), forCellWithReuseIdentifier: DoodleCell.identifier)
        configureDoodleCollectionView()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doodleDataManager.countImage()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoodleCell.identifier, for: indexPath) as! DoodleCell
        
        doodleDataManager.loadImage(indexPath: indexPath) { img in
            DispatchQueue.main.async {
                cell.imageView.image = img
            }
        }
        return cell
    }
    
    func configureDoodleCollectionView() {
        self.collectionView.backgroundColor = .darkGray
        self.title = "Dooodle Library"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeDoodleCollectionView))
    }
    
    @objc func reloadData(_ notification: Notification) {
        self.collectionView.reloadData()
    }
    
    @objc func closeDoodleCollectionView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension DoodleViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 50)
    }
}
