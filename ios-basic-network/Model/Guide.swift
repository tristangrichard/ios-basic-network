//
//  Guide.swift
//  ios-basic-network
//
//  Created by Tristan Richard on 05/04/2019.
//  Copyright © 2019 Tristan Richard. All rights reserved.
//

import Foundation
import SwiftyJSON

class Guide {
    
    var startDate: String
    var endDate: String
    var name: String
    var url: String
    var login_required: Bool
    var venue: Any
    var objType: String
    var icon: String
    
    
    init(json: JSON) {
        
        self.startDate = json["startDate"].string ?? ""
        self.endDate = json["endDate"].string ?? ""
        self.name = json["name"].string ?? ""
        self.url = json["url"].string ?? ""
        self.login_required = json["login_required"].bool ?? false
        self.venue = json["venue"].object
        self.objType = json["objType"].string ?? ""
        self.icon = json["icon"].string ?? ""
        
    }
}
