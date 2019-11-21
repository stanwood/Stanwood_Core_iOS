//
//  UIViewController+Extension.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import SafariServices
import MessageUI
import MapKit

typealias ViewControllerCompletionBlock = () -> Void?
typealias ViewControllerSuccessBlock = (_ success: Bool) -> Void


extension UIViewController: MFMailComposeViewControllerDelegate {
    
    func showSafariViewController(from urlString: String?){
        
        guard
            let string = urlString,
            let url = URL(string: string)
            else{ return }
        
        let safariController = SFSafariViewController(url: url)
        present(safariController, animated: true, completion: nil)
    }
    
    
    @discardableResult
    func sendEmailIfPossible(to emails: [String]?,
                             subject: String? = nil,
                             tintColour: UIColor = .blue,
                             backUpURL: String? = "www.Stanwood.io",
                             body: String? = nil,
                             isHTML: Bool = false,
                             _ completion: ViewControllerSuccessBlock? = nil) -> Bool{
        
        if MFMailComposeViewController.canSendMail() {
            
            let mailController = MFMailComposeViewController()
            mailController.mailComposeDelegate = self
            mailController.setToRecipients(emails)
            
            if let subject = subject {
                mailController.setSubject(subject)
            }
            
            if let body = body {
                mailController.setMessageBody(body, isHTML: isHTML)
            }
            
            mailController.navigationBar.tintColor = tintColour
            mailController.navigationBar.barTintColor = .white
            mailController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : tintColour]
            
            completion?(true)
            present(mailController, animated: true, completion: nil)
            return true
            
        }else{
            
            completion?(false)
            guard let url = URL(string: backUpURL ?? "") else { return false }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            return false
        }
    }
    
    func pushIfPossible(with controller: UIViewController, _ completion: ViewControllerCompletionBlock? = nil){
        
        if let navigationController = navigationController {
            navigationController.pushViewController(controller, animated: true)
        }else{
            present(controller, animated: true) {
                completion?()
            }
        }
    }
    
    func openMapFor(_ location: CLLocation, withRegion distance: CLLocationDistance? = 10000, withTitle title: String? = "") {
        
        let coordinates = location.coordinate
        let unwrappedDistance = distance ?? 10000
        
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: unwrappedDistance, longitudinalMeters: unwrappedDistance)
        
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        mapItem.openInMaps(launchOptions: options)
    }
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
