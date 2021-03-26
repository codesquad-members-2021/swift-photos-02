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
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBAction func plusButtonTapped(_ sender: Any) {
        self.present(appDelegate.doodleNavigaationController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Photos"
        PHPhotoLibrary.shared().register(photoCollectionView)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData(_:)), name: Notification.Name("SavePhoto"), object: nil)
    }
    
    @objc func reloadData(_ notification: Notification) {
        self.photoCollectionView.reloadData()
    }
}
