//
//  GuideApiResult.swift
//  ios-basic-network
//
//  Created by Tristan Richard on 05/04/2019.
//  Copyright © 2019 Tristan Richard. All rights reserved.
//

import Foundation
import SwiftyJSON

class GuideApiResponse {
    
    var total = ""
    var data = [Guide]()
    
    init() {}
    
    init(json: JSON) {
        
        self.total = json["total"].string ?? ""
        
        for item in json["data"].array ?? [JSON]() {
            data.append(Guide(json: item))
        }
        
    }
}
