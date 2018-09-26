//
//  AppSettingsExplorer.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2018 Stanwood GmbH (www.stanwood.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// :nodoc:
@available(*, unavailable, renamed: "AppSettingsExplorerError")
public enum PreferenceExplorerError: Error {}

/// :nodoc:
@available(*, unavailable, renamed: "AppSettingsExplorer")
open class PreferencesExplorer {}

/// :nodoc:
@available(*, unavailable, renamed: "AppSettingsExplorer.Type")
public enum PreferenceType {}

/**
 AppSettingsExplorerError error types
 */
public enum AppSettingsExplorerError: Error {
    
    /// Preference view not found error
    case notFound(String)
}

/**
 AppSettingsExplorer is a helper class to handle the settings view with a specific type.
 
 - SeeAlso: `PreferenceType`
 */
open class AppSettingsExplorer {
    
    // MARK: - Class properties -
    
    /// preference path
    static private let setttingsPath = "App-Prefs:root"
    
    // MARK: - Class methods -
    
    /**
     Opens a preference settings view
     
     - Parameters:
        - preferenceType: The preference type `PreferenceType`
     */
    open static func open(_ preferenceType: Type) throws {
        var preferencePath: String
        if #available(iOS 11.0, *), [.video, .locationServices, .photos, .notificationsId, .microphone].contains(preferenceType) {
            preferencePath = UIApplication.openSettingsURLString
        } else {
            preferencePath = "\(AppSettingsExplorer.setttingsPath)=\(preferenceType.rawValue)"
        }
        
        if let url = URL(string: preferencePath) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            throw AppSettingsExplorerError.notFound(preferencePath)
        }
    }
    
    /**
     Preference settings types
     */
    public enum `Type`: String {
        
        /// Opens settings About view
        case about = "General&path=About"
        
        /// Opens settings accessibility view
        case accessibility = "General&path=ACCESSIBILITY"
        
        /// Opens settings airplaneMode view
        case airplaneMode = "AIRPLANE_MODE"
        
        /// Opens settings autolock view
        case autolock = "General&path=AUTOLOCK"
        
        /// Opens settings cellularUsage view
        case cellularUsage = "General&path=USAGE/CELLULAR_USAGE"
        
        /// Opens settings brightness view
        case brightness = "Brightness"
        
        /// Opens settings bluetooth view
        case bluetooth = "Bluetooth"
        
        /// Opens settings dateAndTime view
        case dateAndTime = "General&path=DATE_AND_TIME"
        
        /// Opens settings facetime view
        case facetime = "FACETIME"
        
        /// Opens settings general view
        case general = "General"
        
        /// Opens settings keyboard view
        case keyboard = "General&path=Keyboard"
        
        /// Opens settings castle view
        case castle = "CASTLE"
        
        /// Opens settings storageAndBackup view
        case storageAndBackup = "CASTLE&path=STORAGE_AND_BACKUP"
        
        /// Opens settings international view
        case international = "General&path=INTERNATIONAL"
        
        /// Opens settings locationServices view
        case locationServices = "LOCATION_SERVICES"
        
        /// Opens settings accountSettings view
        case accountSettings = "ACCOUNT_SETTINGS"
        
        /// Opens settings music view
        case music = "MUSIC"
        
        /// Opens settings equalizer view
        case equalizer = "MUSIC&path=EQ"
        
        /// Opens settings volumeLimit view
        case volumeLimit = "MUSIC&path=VolumeLimit"
        
        /// Opens settings network view
        case network = "General&path=Network"
        
        /// Opens settings nikePlusIPod view
        case nikePlusIPod = "NIKE_PLUS_IPOD"
        
        /// Opens settings notes view
        case notes = "NOTES"
        
        /// Opens settings notifications view
        case notificationsId = "NOTIFICATIONS_ID"
        
        /// Opens settings phone view
        case phone = "Phone"
        
        /// Opens settings app photos view
        case photos = "Photos"
        
        /// Opens settings managed configuration list view
        case managedConfigurationList = "General&path=ManagedConfigurationList"
        
        /// Opens settings reset view
        case reset = "General&path=Reset"
        
        /// Opens settings ringtone view
        case ringtone = "Sounds&path=Ringtone"
        
        /// Opens settings safari view
        case safari = "Safari"
        
        /// Opens settings assistant view
        case assistant = "General&path=Assistant"
        
        /// Opens settings sounds view
        case sounds = "Sounds"
        
        /// Opens settings software update view
        case softwareUpdateLink = "General&path=SOFTWARE_UPDATE_LINK"
        
        /// Opens settings store view
        case store = "STORE"
        
        /// Opens settings twitter view
        case twitter = "TWITTER"
        
        /// Opens settings facebook view
        case facebook = "FACEBOOK"
        
        /// Opens settings usage view
        case usage = "General&path=USAGE"
        
        /// Opens settings app video view
        case video = "VIDEO"
        
        /// Opens settings vpn view
        case vpn = "General&path=Network/VPN"
        
        /// Opens settings wallpaper view
        case wallpaper = "Wallpaper"
        
        /// Opens settings wifi view
        case wifi = "WIFI"
        
        /// Opens settings tethering view
        case tethering = "INTERNET_TETHERING"
        
        /// Opens settings blocked view
        case blocked = "Phone&path=Blocked"
        
        /// Opens settings Do Not Disturb view
        case doNotDisturb = "DO_NOT_DISTURB"
        
        /// Microphone
        case microphone
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
