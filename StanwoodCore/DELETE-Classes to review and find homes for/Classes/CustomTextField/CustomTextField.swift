//
//  CustomTextField.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood GmbH. All rights reserved.
//

import UIKit


extension UIColor{
    static var errorRed = UIColor(r: 208, g: 2, b: 27)
    static var labelGrey = UIColor(r: 155, g: 155, b: 155)
}

enum CustomTextFieldType{
    case email, name
}

protocol CustomTextFieldDelegate: class {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    func textFieldDidChange(_ textField: UITextField)
}

class CustomTextField: UIView {
    
    
    // MARK:- Public Properties
    
    
    var text: String?{
        get{
            return textfield.text
        }
    }
    
    weak var delegate: CustomTextFieldDelegate?
    
    
    // MARK:- Private Properties
    
    
    private var isValid = true {
        didSet{
            let image = (textfield.text?.isEmpty ?? true) ? nil : validIcon
            validImageView.image = image
            titleLabel.textColor = isValid ? .labelGrey :  .errorRed
            errorLabel.isHidden = isValid
        }
    }
    private var hasText = false {
        didSet{
            UIView.animate(withDuration: .medium) {
                self.titleCentredConstraint.priority = UILayoutPriority(rawValue: self.hasText ? 900 : 900)
                self.layoutIfNeeded()
            }
        }
    }
    private var validIcon: UIImage {
        get{
            return isValid ? #imageLiteral(resourceName: "icCheckCircle") :  #imageLiteral(resourceName: "icError")
        }
    }
    private var hideErrorLabels = false
    private var type: CustomTextFieldType = .email

    
    // MARK:- Outlets
    
    
    @IBOutlet private weak var validImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet private weak var titleCentredConstraint: NSLayoutConstraint!
    
    
    // MARK:- Init
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadFromOutlet()
        layoutViews()
    }
    
    
    // MARK:- Private Functions
    
    
    private func layoutViews(){
        errorLabel.textColor = .errorRed
        isValid = false
        errorLabel.isHidden = hideErrorLabels
        hasText = false
        textfield.delegate = self
        backgroundColor = .clear
        isValid = true
    }
    
    private func validate(_ type: CustomTextFieldType){
        switch type {
        case .email:
            isValid = textfield.text?.isValid(.email) ?? false
        case .name:
            isValid = textfield.text?.isValid(.name) ?? false
        }
    }
    
    
    // MARK:- Public Functions

    
    func configure(for type: CustomTextFieldType){
        
        self.type = type
        
        switch type {
        case .email:
            titleLabel.text = "Email"
            errorLabel.text = "Invalid Email"
            textfield.keyboardType = .emailAddress
            textfield.autocapitalizationType = .none
            textfield.placeholder = "jon@stanwood.io"
        case .name:
            titleLabel.text = "Name"
            errorLabel.text = "Invalid Name"
            textfield.keyboardType = .default
            textfield.autocapitalizationType = .words
            textfield.placeholder = "Jon S Wood"
        }
    }
    
    
    // MARK:- Actions
    
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        
        guard sender.text?.count ?? 0 > 0 else {
            isValid = true
            return
        }
        
        hasText = !(sender.text?.isEmpty ?? true)
        validate(type)
        delegate?.textFieldDidChange(sender)
    }
}


// MARK:- UITextFieldDelegate


extension CustomTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        hasText = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn(textField) ?? true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        hasText = textField.text?.trimmedLowerCase.count ?? 0 > 0
    }
}
