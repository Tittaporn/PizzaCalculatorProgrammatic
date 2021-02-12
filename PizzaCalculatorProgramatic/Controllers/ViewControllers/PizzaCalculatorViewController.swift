//
//  PizzaCalculatorViewController.swift
//  PizzaCalculatorProgramatic
//
//  Created by Lee McCormick on 2/9/21.
//

import UIKit

class PizzaCalculatorViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    var pizzas: Int?
    var calculateButton: UIButton {
        return calculatorButton
    }
    var people: UITextField {
        return peopleTextField
    }
    var segment: UISegmentedControl {
        return hungerSegment
    }
    var selectedResturant: String? = CalculatorController.shared.resturants[0]
    
    // MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        addAllSubViews ()
        contraintAllSubViews()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cheeseYellow
        activateCalculateButton()
        restuarantsPicker.dataSource = self
        restuarantsPicker.delegate = self
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    // MARK: - Helper Fuctions
    func addAllSubViews () {
        self.view.addSubview(mainLabel)
        self.view.addSubview(howManyPeopleLabel)
        self.view.addSubview(peopleTextField)
        self.view.addSubview(howHungryLabel)
        self.view.addSubview(hungerSegment)
        self.view.addSubview(wherePieFromLabel)
        self.view.addSubview(restuarantsPicker)
        self.view.addSubview(calculatorButton)
        self.view.addSubview(answerLabel)
    }
    
    func contraintAllSubViews() {
        mainLabel.anchor(top: safeArea.topAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 30, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
        howManyPeopleLabel.anchor(top: mainLabel.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 30, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
        peopleTextField.anchor(top: howManyPeopleLabel.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 16, paddingBottom: 16, paddingLeft: 40, paddingRight: 40)
        howHungryLabel.anchor(top: peopleTextField.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 30, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
        hungerSegment.anchor(top: howHungryLabel.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 16, paddingBottom: 16, paddingLeft: 40, paddingRight: 40)
        wherePieFromLabel.anchor(top: hungerSegment.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 30, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
        restuarantsPicker.anchor(top: wherePieFromLabel.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 16, paddingBottom: 16, paddingLeft: 40, paddingRight: 40)
        calculatorButton.anchor(top: restuarantsPicker.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 30, paddingBottom: 16, paddingLeft: 40, paddingRight: 40)
        answerLabel.anchor(top: calculatorButton.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 30, paddingBottom: 16, paddingLeft: 16, paddingRight: 16)
    }
    
    
    @objc func calculateButtonTapped(sender: UIButton){
        guard let people = peopleTextField.text else { return }
        guard let peopleAmount = Double(people) else { return presentErrorToUser(errorText: "ya gonna let us know how many people joining pizza party!!")}
        
        pizzas = CalculatorController.shared.caculatePizzasPerParty(hunger: segment.selectedSegmentIndex, people: peopleAmount)
        
        guard let pizzas = pizzas else { return }
        guard let selectedRestuarant = selectedResturant else {return}
        if pizzas > 1 {
            answerLabel.text = "Order \(pizzas) pies ya bozo!🍕 \nfrom \(selectedRestuarant)"
        } else {
            answerLabel.text = "Order \(pizzas) pie ya bozo!🍕 \nfrom \(selectedRestuarant)"
        }
    }
    
    
    func activateCalculateButton() {
        self.calculatorButton.addTarget(self, action: #selector(calculateButtonTapped(sender:)), for: .touchUpInside)
    }
    
    // MARK: - Views
    let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "🍕 Pizza 🍕\nCalculator"
        label.font = UIFont(name: FontNames.pizzaTitleFont, size: 60)
        label.textColor = .darkSauce
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        return label
    }()
    
    let howManyPeopleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "How many people eating 🍕 ?"
        label.font = UIFont(name: FontNames.pizzaTextFont, size: 30)
        label.textColor = .darkSauce
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        return label
    }()
    
    let peopleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addCornerRadius()
        textField.textColor = .darkSauce
        textField.backgroundColor = .cheeseYellow
        textField.layer.borderWidth = 2.5
        textField.layer.borderColor = UIColor.darkSauce.cgColor
        textField.placeholder = "Enter number of people..."
        textField.layer.masksToBounds = true
        textField.font = UIFont(name: FontNames.pizzaTextFont, size: 30)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let howHungryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "How hungry are you for 🍕 ?"
        label.font = UIFont(name: FontNames.pizzaTextFont, size: 30)
        label.textColor = .darkSauce
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        
        return label
    }()
    
    let hungerSegment: UISegmentedControl = {
        let titleFont : UIFont = UIFont(name: FontNames.pizzaTextFont, size: 25)!
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.darkSauce,
            NSAttributedString.Key.font : titleFont
        ]
        var segment = UISegmentedControl()
        let hungerLavelArrays = ["Kinda", "Hungry", "Starving"]
        segment = UISegmentedControl(items: hungerLavelArrays)
        segment.backgroundColor = .cheeseYellow
        segment.selectedSegmentTintColor = .sauceRed
        segment.selectedSegmentIndex = 0
        segment.setTitleTextAttributes(attributes, for: .normal)
        segment.layer.borderWidth = 2.5
        segment.layer.borderColor = UIColor.darkSauce.cgColor
        segment.setTitleTextAttributes([.foregroundColor : UIColor.cheeseYellow], for: .selected)
        segment.addCornerRadius()
        return segment
    }()
    
    let wherePieFromLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Where ya getting ya 🍕 from ?"
        label.font = UIFont(name: FontNames.pizzaTextFont, size: 30)
        label.textColor = .darkSauce
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        return label
    }()
    
    let restuarantsPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .cheeseYellow
        picker.layer.borderWidth = 2.5
        picker.layer.borderColor = UIColor.darkSauce.cgColor
        picker.addCornerRadius()
        return picker
    }()
    
    let calculatorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculator", for: .normal)
        button.backgroundColor = .darkSauce
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.sauceRed.cgColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.pizzaTextFont, size: 30)
        button.addCornerRadius()
        return button
    }()
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Pizzas Time. Let's eat 🍕🍕"
        label.font = UIFont(name: FontNames.pizzaTextFont, size: 30)
        label.textColor = .darkSauce
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        return label
    }()
    
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension PizzaCalculatorViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CalculatorController.shared.resturants.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CalculatorController.shared.resturants[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedResturant = CalculatorController.shared.resturants[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: FontNames.pizzaTextFont, size: 30)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = CalculatorController.shared.resturants[row]
        pickerLabel?.textColor = UIColor.darkSauce
        return pickerLabel!
    }
}






