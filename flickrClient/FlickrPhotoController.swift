//
//  FlickrPhotoController.swift
//  flickrClient
//
//  Created by Marco Del Angel on 8/1/17.
//  Copyright © 2017 Marco Del Angel. All rights reserved.
//

import Foundation
import UIKit

class FlickrPhotoController {
    
    let apiKey = "129fbda0801cc89b847a37c8b5fe752d"
    
    func fetchPhoto(completion: @escaping ([FlicrPhoto]?) -> Void) {
        let url =  URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=\(apiKey)&format=json&nojsoncallback=1")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data,
                let rawJson = try? JSONSerialization.jsonObject(with: data),
                let photosJson = rawJson as? [String: Any],
                let photos = photosJson["photos"] as? [String: Any],
                let photoArray = photos["photo"] as? NSArray{
                let flickrPhotos = photoArray.flatMap { FlicrPhoto(json: $0 as! [String : Any]) }
                completion(flickrPhotos)
            } else {
                print("Error")
                completion(nil)
            }
        }
        task.resume()
    }
    
    func fethcImage(url: URL, completion: @escaping (UIImage?) -> Void){
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let data = data,
                let image = UIImage(data: data){
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
