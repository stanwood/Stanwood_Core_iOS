//
//  SelectableLinkController.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood GmbH. All rights reserved.
//

import Foundation

/*
 
 Subclassing this controller allows us to insert links into a `UITextView`
 
 
 `LinkObject` consists of 2 properties
    -  `var link = ""`
    -  `var text = ""`

 
 By passing and array of `LinkObject` to `setUpTouchesFor(_ textView: UITextView, with mainText: String, with objects:[LinkObject]?, with color: UIColor = .white)` We inspect all object and take the range of `text` and turn it into a link. The link is then handled in the delegate extension below
 
 This currently only supports `UIViewController`
 
 */




class SelectableLinkController: UIViewController, UITextViewDelegate {
    
    @available(iOS 10.0, *)
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:])
        return false
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        UIApplication.shared.open(URL, options: [:])
        return false
    }
    
    func setUpTouchesFor(_ textView: UITextView, with mainText: String, with objects:[LinkObject]?, with color: UIColor = .gray){
        
        guard let objects = objects else { return }
        
        let attributedString = NSMutableAttributedString(string: mainText)
        
        objects.forEach { (object) in
            
            if let range = mainText.range(of: object.text) {
                let nsRange = mainText.nsRange(from: range)
                attributedString.addAttribute(.link, value: object.link, range: nsRange)
                attributedString.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: nsRange)
            }
        }
        
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: 0, length: attributedString.length - 1))
        
        textView.tintColor = color
        textView.attributedText = attributedString
        textView.delegate = self
    }
}



enum LinkType{
    case conditions
    case privacy
}

struct LinkObject {
    
    
    // MARK:- Properties
    
    
    var link = ""
    var text = ""
    
    
    // MARK:- Functions
    
    
    static var termsAndConditions: [LinkObject] {
        
        let terms = LinkObject.type(with: .conditions)
        let privacy = LinkObject.type(with: .privacy)
        return [terms, privacy]
    }
    
    
    
    static func type(with type: LinkType) -> LinkObject{
        
        switch type {
        case .conditions:
            return LinkObject(link: "Add URL" , text: "Add Text")
        case .privacy:
            return LinkObject(link: "Add URL", text: "Add Text")
        }
    }
}


extension LinkObject {
    
}
