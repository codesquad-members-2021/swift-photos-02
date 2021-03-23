//
//  PhotoAppViewController.swift
//  PhotoLibraryApp
//
//  Created by Jun Ho JANG on 2021/03/23.
//

import UIKit
import Photos

class PhotoAppViewController: UIViewController {
    @IBOutlet weak var photoCollectionView: PhotoCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Photos"
        PHPhotoLibrary.shared().register(photoCollectionView)
    }
}
