//
//  CalculatorController.swift
//  PizzaCalculatorProgramatic
//
//  Created by Lee McCormick on 2/11/21.
//

import Foundation
class CalculatorController {
    
    static let shared = CalculatorController()
    var resturants: [String] = ["Somewhere in the world","Dominos", "Pizza Hut", "Papa John's", "Little Caesars"]
    
    // MARK: - Methods
    func caculatePizzasPerParty(hunger: Int, people: Double) -> Int {
        var pies: Int = 1
        switch hunger {
        case 0:
            let pieAmount = (people * 1.0) / 8.0
            pies = Int(ceil(pieAmount))
        case 1:
            let pieAmount = (people * 2.0) / 8.0
            pies = Int(ceil(pieAmount))
        case 2:
            let pieAmount = (people * 4.0) / 8.0
            pies = Int(ceil(pieAmount))
        default:
            pies = 1
        }
        return pies
    }//end func
}
