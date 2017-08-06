//
//  FlickrPhoto.swift
//  flickrClient
//
//  Created by Marco Del Angel on 8/1/17.
//  Copyright © 2017 Marco Del Angel. All rights reserved.
//

import Foundation
import UIKit

struct PropertyKeys {
    static let title = "title"
    static let farm = "farm"
    static let server = "server"
    static let id = "id"
    static let secret = "secret"
    static let url = "url"
}

struct FlicrPhoto {
    var title : String
    var farm : Int
    var server : String
    var id : String
    var secret : String
    var url : URL?
    var photo : UIImage?
    
    static func flickrPhotoURL(flickrPhoto: FlicrPhoto) -> URL? {
        let url = URL(string: "https://farm\(flickrPhoto.farm).staticflickr.com/\(flickrPhoto.server)/\(flickrPhoto.id)_\(flickrPhoto.secret)_q.jpg")
        return url
    }
    
    init?(json: [String: Any]){
        guard let title = json[PropertyKeys.title] as? String,
            let farm = json[PropertyKeys.farm] as? Int,
            let server = json[PropertyKeys.server] as? String,
            let id = json[PropertyKeys.id] as? String,
            let secret = json[PropertyKeys.secret] as? String else {return nil}
        self.title =  title
        self.farm = farm
        self.server = server
        self.id = id
        self.secret = secret
        self.url = FlicrPhoto.flickrPhotoURL(flickrPhoto: self)
    }
}
