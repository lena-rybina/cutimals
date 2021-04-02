//
//  ImageDownloader.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/31/21.
//

import Foundation
import UIKit

class ImageDownloader {
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    static func downloadImage(from url: URL?,
                              completed: @escaping (UIImage?)->()) {
        guard let url = url else {
            completed(nil)
            return
        }
        
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print("Download Finished")
            DispatchQueue.main.async() {
                completed(UIImage(data: data))
            }
        }
    }
}
