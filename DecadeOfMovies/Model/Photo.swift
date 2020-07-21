//
//  Photo.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/19/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation

struct Photo {
    
    // MARK: Properties
    var id = ""
    var owner = ""
    var secret = ""
    var server = ""
    var farm = 1
    var title = ""
    var ispublic = 1
    var isfriend = 0
    var isfamily = 0
    
    //MARK: initialization
    init(id: String, owner: String, secret: String, server: String, farm: Int, title: String, ispublic: Int, isfriend: Int, isfamily: Int) {
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.title = title
        self.ispublic = ispublic
        self.isfriend = isfriend
        self.isfamily = isfamily
    }
    
    init() {
        
    }
}
