//
//  NSCache.swift
//  MoviesApp
//
//  Created by Vinayak T on 26/04/23.
//

import Foundation
import UIKit

class ImageCache{
    static let shared = ImageCache()
    
    var cache: NSCache = NSCache<NSString, UIImage>()
    
    private init(){
        cache.countLimit = 100
    }
    
    func setLimit(count:Int){
        cache.countLimit = count
    }
    
    func getImage(forUrlString: String) -> UIImage?{
        guard forUrlString != "" else { return nil}
        return cache.object(forKey: forUrlString as NSString)
    }
    
    func setImage(image:UIImage, forUrlString: String){
        cache.setObject(image, forKey: forUrlString as NSString)
    }
    
    func removeAllCache(){
        cache.removeAllObjects()
    }
}
