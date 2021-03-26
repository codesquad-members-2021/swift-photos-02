//
//  DataManager.swift
//  PhotoLibraryApp
//
//  Created by Jun Ho JANG on 2021/03/24.
//

import UIKit

class DoodleDataManager {
    let doodleImageURL = "https://public.codesquad.kr/jk/doodle.json"
    
    private(set) var doodleImages: [DoodleImage]
    
    init() {
        doodleImages = []
        decodeJSON(){}
    }
    func countImage() -> Int {
        return doodleImages.count
    }
    
    func decodeJSON(completion: @escaping ()->()) {
        do {
            guard let doodleURL = URL(string: self.doodleImageURL),
                  let JSONData = try String(contentsOf: doodleURL).data(using: .utf8) else {
                return
            }
            self.doodleImages = try JSONDecoder().decode([DoodleImage].self, from: JSONData)
            completion()
        } catch {
            print(error)
        }
    }
    
    func loadImage(indexPath: IndexPath, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            let urlString = self.doodleImages[indexPath.item].image
            guard let url = URL(string: urlString),
                  let data = try? Data(contentsOf: url) else {
                return
            }
            let img = UIImage(data: data)
            completion(img)
        }
    }
}
