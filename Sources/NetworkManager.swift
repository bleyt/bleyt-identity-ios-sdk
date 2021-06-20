//
//  NetworkManager.swift
//  BleytIdentity
//
//  Created by Ribads on 6/12/21.
//

import Foundation

class NetworkManager {
    
    public static var shared = NetworkManager()
    
    private let domainUrlString = "https://test.com"
    
    func getApplicationRequest(mobileKey: String, completionHandler: @escaping (ApplicationRequest?) -> Void) {
        let url = URL(string: domainUrlString + "users/application/authorize/")!

        let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: "mobileKey", value: mobileKey)
        ]
        
        var request = URLRequest(url: (components?.url)!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
            print("Error with the response, unexpected status code: \(response)")
            return
          }

          if let data = data, let request = try? JSONDecoder().decode(ApplicationRequest.self, from: data) {
            completionHandler(request)
          } else {
            completionHandler(nil)
          }
        })
        task.resume()
    }
    
    func authorizeApplication(mobileKey: String, authToken: String, completionHandler: @escaping (String?) -> Void) {
        
    }
    
}
