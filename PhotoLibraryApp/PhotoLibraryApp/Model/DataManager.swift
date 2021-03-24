//
//  DataManager.swift
//  PhotoLibraryApp
//
//  Created by Jun Ho JANG on 2021/03/24.
//

import UIKit

class DoodleDataManager {
    let doodleImageURL = "https://public.codesquad.kr/jk/doodle.json"
    
    private(set) var doodleImages = [DoodleImage]()
    
    func countImage() -> Int {
        return doodleImages.count
    }
    
    func decodeJSON() {
        do {
            guard let doodleURL = URL(string: doodleImageURL) else {
                return
            }
            guard let JSONData = try String(contentsOf: doodleURL).data(using: .utf8) else {
                return
            }
            self.doodleImages = try JSONDecoder().decode([DoodleImage].self, from: JSONData)
        } catch {
            
        }
    }
}
