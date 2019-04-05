//
//  GuideAPI.swift
//  ios-basic-network
//
//  Created by Tristan Richard on 05/04/2019.
//  Copyright © 2019 Tristan Richard. All rights reserved.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift


class GuideAPI {
    
    private static let END_POINT = "https://private-c60ade-guidebook1.apiary-mock.com/upcomingGuides"
    
    class func getGuides() -> Observable<Any> {        
        return RxAlamofire.json(.get, END_POINT)
    }
    
}
