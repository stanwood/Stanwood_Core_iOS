//
//  Configurations.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/27/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase


struct Configurations {
    
    static var firebaseConfigurationFileName: String {

        #if DEBUG
        return PList.debug
        #elseif STAGE
        return PList.stage
        #else
        return PList.production
        #endif
    }
    
    static var baseURL: String{
        
        #if DEBUG
        return FirebaseConfig.devEndPoint.value() ?? ""
        #else
        
        if ProcessInfo.processInfo.arguments.contains(Key.testIAP) {
            return FirebaseConfig.devEndPoint.value() ?? ""
        } else {
            return FirebaseConfig.prodEndPoint.value() ?? ""
        }
        
        #endif
    }
    
    enum FirebaseConfig: String {
        
        case condenastTestAPI
        case contentfulServerRootPathTmp
        case serverRootPathTmp
        case isShoppingWeek
        case rateMeImageURL
        case rateMeBannerURL
        case appID
        case shopfinderPosition
        case authEndpoint
        case authEndpointDev
        case serverRootPath
        case serverRootPathDev
        case contentfulServerRootPath
        case contentfulServerRootPathDev
        case contentfulImageRootPath
        case contentfulImageRootPathDev
        case itunesUrl
        case supportUrl
        case supportEmail
        case conditionsLink
        case openPrivacyLink
        case faq
        case dataprotection
        case imprint
        case imageServiceUrl
        case imageParserToken
        case devEndPoint
        case stageEndPoint
        case prodEndPoint
        case afterBoughtOfferText
        case afterBoughtOfferCta
        case afterBoughtOfferOfferId
        case testPurchaseID
        case testPurchaseCode
        case stripeEnablediOS
        case currentIOSIAPID

        case stripePubKey
        
        static func value<T: Any>(for key: FirebaseConfig) -> T? {
            let value = RemoteConfig.remoteConfig()[key.rawValue]
            
            switch T.self {
            case is String.Type: return value.stringValue as? T
            //case is [String].Type: return value.stringValue?.toArray as? T
            case is Data.Type: return value.dataValue as? T
            case is Bool.Type: return value.boolValue as? T
            case is Int.Type: return value.numberValue?.intValue as? T
            default: return nil
            }
        }
        
        public func value<T: Any>() -> T? {
            return FirebaseConfig.value(for: self)
        }
    }
    
    struct PList {
        
        static let stage = "GoogleService-Info-Stage"
        static let debug = "GoogleService-Info-Debug"
        static let production = "GoogleService-Info"
    }
    
    struct Parameters{
        
        static func newsFeedParamtersWithLimit(_ limit: Int? = 24, withOffset offset: Int = 0) -> StringDictionary {
            
            let params = [Key.limit : String(describing: limit ?? 24),
                          Key.offset : String(describing: offset),
                          Key.locale : LocationManager.locale]
            return params
        }
        
        static func imageParameters(with imageURL: String, and token: String, width: Int) -> StringDictionary {
            
            let params = [Key.url : imageURL,
                          Key.token : token,
                          Key.width : String(describing: width)]
            return params
        }
        
        static var locale: [String : String] {
            get{
                return [Key.locale : LocationManager.locale]
            }
        }
        
        static let applicationJson = "application/json"
        static let dealsCarousel = ["screen" : "Deals"]
        static let facebookGraph = ["fields": "first_name, last_name, picture, email"]
    }
    
    struct Key {
//        static let numberOfAppStarts = "de.glamour.numberOfAppStarts"
//        static let hasGrantedLocationPermission = "de.glamour.hasGrantedLocationPermission"
//        static let boughtProducts = "boughtProducts"
        static let limit = "limit"
        static let locale = "locale"
//        static let within = "within"
//        static let brandId = "brand_id"
//        static let inAppPurchaseId = "inAppPurchaseId"
//        static let query = "query"
//        static let near = "near"
        static let id = "id"
//        static let categories = "categories"
//        static let brand_id = "brand_id"
//        static let brand_name = "brand_name"
        static let offset = "offset"
//        static let defaultLocale = "de-DE"
        static let token = "token"
        static let width = "width"
//        static let foo = "foo"
//        static let openProduct = "openProduct"
        static let remoteConfigDefaults = "RemoteConfigDefaults"
        static let items = "items"
//        static let zodiacSign = "zodiacSign"
//        static let glamour = "glamour"
        static let contentType = "Content-Type"
//        static let userId = "userId"
//        static let email = "email"
//        static let uid = "uid"
//        static let name = "userId"
//        static let fbKey = "fb"
//        static let authorize = "authorize"
//        static let disabledIvw = "de.glamour.disabledIvw"
//        static let cacheControl = "Cache-Control"
//        static let currentTimeZone = "currentTimeZone"
//        static let receipt = "receipt"
//        static let expiresDate = "expires_date"
//        static let purchaseDate = "original_purchase_date"
//        static let scratchCardLastFetchedDate = "de.glamour.scratchCardLastFetchedWinStateDate"
//        static let scratchCardLastResult = "de.glamour.scratchCardLastFetchedWinStateValue"
        static let url = "url"
//        static let feedKey = "feedKey"
//        static let feedItems = "FeedItems"
//        static let messages = "Messages"
//        static let zodiacItems = "ZodiacItems"
//        static let articleItems = "ArticleItems"
//        static let cards = "Cards"
//        static let deals = "Deals"
//        static let deal = "deal"
//        static let dealsCarouselItems = "DealsCarouselItems"
//        static let linkedItem = "linkedItem"
//        static let appstoreSecret = "d1a76845e65e4dda96a03219f6277ee1"
//        static let openShop = "openShop"
//        static let openArticle = "openArticle"
//        static let openURL = "openURL"
//        static let openShopFromLink = "openShopFromLink"
//        static let mailto = "mailto"
//        static let testIAP = "IAP_TEST_ENV"
//        static let openDeal = "openDeal"
//        static let noticesShown = "de.glamour.noticesShown"
//        static let openDealList = "openDealList"
//
//        /// User Data
//        static let lastZodiacUserProperty = "zodiac"
//        static let emailUserProperty = "email"
//        static let currentLocation = "currentLocation"
//        static let locations = "locations"
//        static let zodiac = "zodiac"
//        static let favouriteShops = "favouriteShops"
//        static let favouriteBrands = "favouriteBrands"
//        static let openedOfferBrand = "openedOfferBrand"
//        static let sharedOffer = "sharedOffer"
//        static let searchedShops = "searchedShops"
//        static let categoryPreference = "categoryPreference"
//        static let categoryPreferencePercentage = "categoryPreferencePercentage"
//        static let users = "users"
//        static let orphanedData = "orphanedData"
//        static let latitude = "latitude"
//        static let longitude = "longitude"
//        static let favouriteProducts = "favouriteProducts"
//        static let openedOfferProduct = "openedOfferProduct"
//        static let facebook = "facebook.com"
//        static let emailValidated = "emailValidated"
//        static let scratches = "scratches"
//        static let couponCode = "couponCode"
//        static let username = "username"
//        static let canReceiveAdvertisingEmails = "canReceiveAdvertisingEmails"
//        static let me = "me"
//        static let firstName = "first_name"
//        static let lastName = "last_name"
//        static let date = "date"
//        static let articles = "views/articles/"
//        static let nativeAd = "nativead"
//
//        /// Filters
//        static let alle = "alle"
//        static let alleDeals = "alledeals"
//        static let alleBrands = "allebrands"
//        static let favourites = "favourites"
//        static let online = "online"
//        static let offline = "offline"
//
//        static let googleAnalyticsUserAction = "User action"
//        static let googleAnalyticsBoughtShoppingCard = "boughtShoppingCard"
//        static let stripeProductIdCard = "shopping-card"
//
//        static let stripeDebug = "pk_test_IlihCBiH6Pa676Nes02DTjdG"
//        static let stripeProduction = "pk_live_1pLnNwV9zE10glHi4ZqwcmFE"
    }
    
    struct EndPoint {
        static let entries = "entries"
        static let mainFeed = "mainFeed"
    }

    struct Headers{
        static let contentTypeJSON = Header(value: Parameters.applicationJson, field: Key.contentType)
    }
    
    
    
    struct FullURLPath{
        static let mainFeed = "\(FirebaseConfig.serverRootPath.value() ?? "")\(EndPoint.mainFeed)"
    }
    
    struct HTTPMethod {
        
        static let get = "GET"
        static let post = "POST"
        static let put = "PUT"
        static let patch = "PATCH"
        static let delete = "DELETE"
        static let head = "HEAD"
    }
}


// MARK:- Functions


extension Configurations {
    
    static func configureFirebase(){
        
//        if FirebaseApp.app() == nil {
//            FirebaseApp.configure()
//        }
//
//        Database.database().isPersistenceEnabled = true
        
        RemoteConfig.remoteConfig().setDefaults(fromPlist: Key.remoteConfigDefaults)
        updateConfig()
    }
    
    static func configureStore(){
        
    }
    
    
    static func updateConfig(){
        
        let remoteConfig = RemoteConfig.remoteConfig()
        
        var cacheLimit: TimeInterval = 0
        
        #if DEBUG
        remoteConfig.configSettings = RemoteConfigSettings(developerModeEnabled: true)
        #else
        cacheLimit = Constant.Time.secondsInMinute
        #endif
        
        remoteConfig.fetch(withExpirationDuration: cacheLimit) { (status, error) in
            remoteConfig.activateFetched()
        }
    }
}

