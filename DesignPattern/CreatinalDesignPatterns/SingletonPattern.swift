//
//  NetworkManager.swift
//  DesignPattern
//
//  Created by Mac on 06/08/2022.
//

import Foundation
struct NetworkManager {
    private init(){}
    static var shared = NetworkManager()
    func fetchData<Model: Decodable>(url : String, completion : @escaping (Model?) -> ()) {
        let sessionURL = URL(string: url)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: sessionURL!) { (data, response, error) in
            if error == nil {
                if let safeData = data {
                    do {
                        let decodedData = try JSONDecoder().decode(Model.self, from: safeData)
                        completion(decodedData)
                    } catch {
                        print("error while parsing data \(error)")
                    }
                } else {
                    debugPrint("failed to fetch data")
                    completion(nil)
                }
            }
            else {
                print("error in data task is \(String(describing: error))")
                completion(nil)
            }
        }
        dataTask.resume()
    }
}
//to use
//NetworkManager.shared.fetchData(url: <#T##String#>, completion: <#T##(Decodable?) -> ()#>)
