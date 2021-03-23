//
//  ColorGenerator.swift
//  PhotoLibraryApp
//
//  Created by Jun Ho JANG on 2021/03/22.
//

import UIKit

struct ColorGenerator {
    static func getRandomColor() -> UIColor {
        let randomRed: CGFloat = CGFloat(drand48())
        let randomGreen: CGFloat = CGFloat(drand48())
        let randomBlue: CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
