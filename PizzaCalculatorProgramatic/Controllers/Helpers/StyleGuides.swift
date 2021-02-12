//
//  StyleGuides.swift
//  PizzaCalculatorProgramatic
//
//  Created by Lee McCormick on 2/10/21.
//

import UIKit

struct FontNames {
    static let pizzaTitleFont = "GOOD PEOPLE"
    static let pizzaTextFont = "Letters for Learners"
    
}

extension UIColor {
    static let cheeseYellow = UIColor(named: "cheeseYellow")!
    static let darkSauce  = UIColor(named: "darkSauce")!
    static let orangeAccent = UIColor(named: "orangeAccent")!
    static let sauceRed = UIColor(named: "sauceRed")!
    static let spaceBlack = UIColor(named: "spaceBlack")!
}

extension UIView {
    func addCornerRadius(radius: CGFloat = 8) {
        self.layer.cornerRadius = radius
    }
    
}
