//
//  PreferencesExplorer.swift
//  StanwoodCore
//
//  Created by Tal Zion on 12/02/2018.
//

import Foundation

/**
 PreferenceExplorerError error types
 */
public enum PreferenceExplorerError: Error {
    
    /// Preference view not found error
    case notFound(String)
}

/**
 PreferencesExplorer is a helper class to handle the settings view with a specific type.
 
 - SeeAlso: `PreferenceType`
 */
open class PreferencesExplorer {
    
    // MARK: - Class properties -
    
    /// preference path
    static private let preferencePath = "App-Prefs:root"
    
    // MARK: - Class methods -
    
    /**
     Opens a preference settings view
     
     - Parameters:
        - preferenceType: The preference type `PreferenceType`
     */
    open static func open(_ preferenceType: PreferenceType) throws {
        var preferencePath: String
        if #available(iOS 11.0, *), [.video, .locationServices, .photos].contains(preferenceType) {
            preferencePath = UIApplicationOpenSettingsURLString
        } else {
            preferencePath = "\(PreferencesExplorer.preferencePath)=\(preferenceType.rawValue)"
        }
        
        if let url = URL(string: preferencePath) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            throw PreferenceExplorerError.notFound(preferencePath)
        }
    }
}

/**
 Preference settings types
 */
public enum PreferenceType: String {
    
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
}
