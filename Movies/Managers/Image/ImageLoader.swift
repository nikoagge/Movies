//
//  ImageLoader.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import Foundation

final class ImageLoader {
    static let shared = ImageLoader()
    
    private var imageDataCache = NSCache<NSString, NSData>()
    
    private init() {}

    func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let key = url.absoluteString as NSString
        if let data = imageDataCache.object(forKey: key) {
            completion(.success(data as Data))
            
            return
        }
        
        let characterImageURLRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: characterImageURLRequest) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                
                return
            }
            
            let key = url.absoluteString as NSString
            let value = data as NSData
            self?.imageDataCache.setObject(value, forKey: key)
            completion(.success(data))
        }.resume()
    }
    
    func fetchImage(urlString: String?, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            
            return
        }
        downloadImage(url, completion: completion)
    }
}
