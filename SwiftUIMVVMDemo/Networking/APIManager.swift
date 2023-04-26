//
//  APIManager.swift
//  SwiftUIMVVMDemo
//
//  Created by Abhishek Karkar on 04/25/23.
//

import Foundation

final class APIManager {
  static let shared = APIManager()
  private init(){}
  
  private let allowedDiskSize = 100 * 1024 * 1024
  lazy var cache: URLCache = {
    return URLCache(memoryCapacity: 0, diskCapacity: allowedDiskSize, diskPath: "gifCache")
  }()
  
  typealias DownloadCompletionHandler = (Result<Data,Error>) -> ()
  
  private func createAndRetrieveURLSession() -> URLSession {
    let sessionConfiguration = URLSessionConfiguration.default
    sessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad
    sessionConfiguration.urlCache = cache
    return URLSession(configuration: sessionConfiguration)
  }
  
  func downloadContent(fromUrlString: String, completionHandler: @escaping DownloadCompletionHandler) {
    
    guard let downloadUrl = URL(string: fromUrlString) else { return }
    let urlRequest = URLRequest(url: downloadUrl)
      // First try to fetching cached data if exist
    if let cachedData = self.cache.cachedResponse(for: urlRequest) {
      print("Cached data in bytes:", cachedData.data)
      completionHandler(.success(cachedData.data))
      
    } else {
        // No cached data, download content than cache the data
      createAndRetrieveURLSession().dataTask(with: urlRequest) { (data, response, error) in
        
        if let error = error {
          completionHandler(.failure(error))
        } else {
          
          let cachedData = CachedURLResponse(response: response!, data: data!)
          self.cache.storeCachedResponse(cachedData, for: urlRequest)
          
          completionHandler(.success(data!))
        }
      }.resume()
    }
  }
  
  func fetchProductForUrl(_ completionHandler: @escaping (EcomProduct?, Bool) -> Void) {
    guard let url = URL(string: "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328")
    else {
      return
    }

    let task = URLSession.shared.dataTask(with: url) {data, _, error in
      guard let data = data, error == nil else {
        return
      }
        // TODO: Remove artificial slow down
//      sleep(2)
        //convert to JSON
      do {
        let ecomProduct = try JSONDecoder().decode(EcomProduct.self, from: data)
        completionHandler(ecomProduct,true)
      }
      catch {
        print(error)
        completionHandler(nil,false)
      }
      
    }
    task.resume()
    
  }
  
}
