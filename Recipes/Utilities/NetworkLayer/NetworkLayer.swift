//
//  NetworkLayer.swift
//  Recipes
//
//  Created by Amna on 16/06/2021.
//

import Foundation
import Alamofire

class NetworkLayer{
    func fetchData<T:Decodable> (params:[String:[String]]=[:],url:String,responseClass:T.Type,completion: @escaping (Result<T?,NSError>)->Void){
        AF.request(url,method: .get,parameters: params,headers: [:]).responseJSON{(res) in
            guard let statusCode = res.response?.statusCode else{return}
            switch res.result{
            case .success(_):
            if statusCode == 200{
                guard let jsonResponse = try? res.result.get()else{return}
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: [])else{return}
                guard let resposeObj = try? JSONDecoder().decode(T.self,from:jsonData) else{return}
                completion(.success(resposeObj))
            }
            case.failure(let error):
                print(error)
                completion(.failure(error as NSError ))
        }
        
    }
}
} 
