//
//  UIViewcontrollerExtension.swift
//  PizzaCalculatorProgramatic
//
//  Created by Lee McCormick on 2/9/21.
//

import Foundation

import UIKit

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
} //End of extension

struct SpacingConstants{
    static let verticalObjectBuffer: CGFloat = 8.0
    static let outerHorizontalPadding: CGFloat = 32.0
    static let outerVerticalPadding: CGFloat = 16.0
    static let smallElementHeight: CGFloat = 24.0
    static let mediumElementHeight: CGFloat = 32.0
}


extension UIViewController {
    
    func presentErrorToUser(message: String) {
        let alertController = UIAlertController(title: "Whool..", message: message, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}
