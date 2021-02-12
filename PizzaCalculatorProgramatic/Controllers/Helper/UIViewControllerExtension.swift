//
//  UIViewControllerExtension.swift
//  PizzaCalculatorProgramatic
//
//  Created by Lee McCormick on 2/11/21.
//


import UIKit

// MARK: - Anchor

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingBottom: CGFloat, paddingLeft: CGFloat, paddingRight: CGFloat, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
} 

// MARK: - Fonts
struct FontNames {
    static let pizzaTitleFont = "GOOD PEOPLE"
    static let pizzaTextFont = "Letters for Learners"
}

// MARK: - Colors
extension UIColor {
    static let cheeseYellow = UIColor(named: "cheeseYellow")!
    static let darkSauce  = UIColor(named: "darkSauce")!
    static let sauceRed = UIColor(named: "sauceRed")!
}

// MARK: - CornerRadius
extension UIView {
    func addCornerRadius(radius: CGFloat = 8) {
        self.layer.cornerRadius = radius
    }
}

// MARK: - Alert User 
extension UIViewController {
    func presentErrorToUser(errorText: String) {
        let alertController = UIAlertController(title: "Whool!!", message: errorText, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}
