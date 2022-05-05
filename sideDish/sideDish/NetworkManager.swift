//
//  NetworkManager.swift
//  sideDish
//
//  Created by 최예주 on 2022/05/02.
//

import Foundation
import OSLog

enum HttpMethod: String{
    case get = "GET"
}

class NetworkManager{
    
    // getRequest
    static func getRequest(url: String, complete: @escaping (Data) -> Void){
        guard let validURL = URL(string: url) else { return }
        var urlRequest = URLRequest(url: validURL)
        urlRequest.httpMethod = HttpMethod.get.rawValue
        
        URLSession.shared.dataTask(with: urlRequest){ data, response, _ in
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                if let response = response as? HTTPURLResponse{
                    os_log("%@", "\(response.statusCode)")
                }
                return
            }
            
            complete(data)
        }.resume()
    }
    
}
