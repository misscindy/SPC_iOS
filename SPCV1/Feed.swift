//
//  Feed.swift
//  SPCV1
//
//  Created by Cindy Fan on 9/11/15.
//  Copyright (c) 2015 Cindy Fan. All rights reserved.
//

import Foundation

class Feed: NSObject {
    var primaryTitle: String
    var secondaryTitle: String
    var content: String
    var image: String
    
    init(primaryTitle: String, secondaryTitle: String, content: String, image: String) {
        self.primaryTitle = primaryTitle
        self.secondaryTitle = secondaryTitle
        self.content = content
        self.image = image
        super.init()
    }
}