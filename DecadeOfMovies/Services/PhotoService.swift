//
//  PhotoService.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/19/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireImage

class PhotoService {
    
    static let instance = PhotoService()
    
    func getPhotosByTitle(title: String,completion: @escaping (_ error: Error?, _ photos: [Photo]?) -> Void) {
        let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=a7a008ff16667261ee7183dce8a3a1af&format=json&nojsoncallback=1&text=\(title)&page=1&per_page=10"
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded) {
            AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
                switch response.result {
                case .failure(let error):
                    completion(error, nil)
                    print(error)
                case .success(let value):
                    let json = JSON(value)
                    var photos = [Photo]()
                    if let photosArr = json["photos"]["photo"].array {
                        for item in photosArr {
                            guard let item = item.dictionary else {return}
                            var photo = Photo()
                            photo.id = item["id"]?.string ?? ""
                            photo.owner = item["owner"]?.string ?? ""
                            photo.secret = item["secret"]?.string ?? ""
                            photo.server = item["server"]?.string ?? ""
                            photo.farm = item["farm"]?.int ?? 0
                            photo.title = item["title"]?.string ?? ""
                            photo.ispublic = item["ispublic"]?.int ?? 0
                            photo.isfriend = item["ispublic"]?.int ?? 0
                            photo.isfamily = item["ispublic"]?.int ?? 0
                            photos.append(photo)
                        }
                    }
                    completion(nil,photos)
                }
            }
        }
    }
    
    func getPhoto(farm: Int, server: String, id: String, secret: String,completion: @escaping (_ error: Error?, _ photo: UIImage) -> Void) {
//        https://farm66.staticflickr.com/65535/50129346458_d610a9f7c6_m.jpg
        let urlString = "https://farm​\(farm).staticflickr.com/​\(server)/​\(id)_​\(secret)_m.jpg"
//        let urlString = "https://farm66.staticflickr.com/65535/50129346458_d610a9f7c6_m.jpg"
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),let url = URL(string: encoded) {
            print(urlString)
            print(url)
            AF.request(url).responseImage { (response) in
                switch response.result {
                case let .success(image):
                    completion(nil,image)
                case let .failure(error):
                    completion(error,UIImage())
                    print(error)
                }
            }
        }
    }
}
