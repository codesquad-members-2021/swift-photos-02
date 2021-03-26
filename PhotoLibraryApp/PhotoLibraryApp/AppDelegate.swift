//
//  AppDelegate.swift
//  PhotoLibraryApp
//
//  Created by Jun Ho JANG on 2021/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var doodleCollectionViewController: DoodleViewController!
    var doodleNavigaationController: UINavigationController!
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        doodleCollectionViewController = DoodleViewController(collectionViewLayout: UICollectionViewFlowLayout())
        doodleNavigaationController = UINavigationController(rootViewController: doodleCollectionViewController)
        doodleNavigaationController.modalPresentationStyle = .fullScreen
        return true
    }
}

