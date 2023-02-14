//
//  ViewController.swift
//  User API
//
//  Created by shoeb on 03/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPI()
    }
    
    //Get Api
    func getAPI(){
        let url = URL(string: "https://dummyjson.com/users")
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                let httpResponse = response as! HTTPURLResponse
                if(httpResponse.statusCode == 200){
                    let jsonConveter = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                    print(jsonConveter!)
                }
            }
        }
        dataTask.resume()
    }
    
    //Post Api
    func postAPI(){
        guard let url = URL(string: "https://dummyjson.com/products/add") else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let sendData = ["id": "1", "title": "iPhone 9", "brand": "Apple"]
        do{
            let jsonConvert = try JSONSerialization.data(withJSONObject: sendData, options: .prettyPrinted)
            request.httpBody = jsonConvert
            request.addValue("Application/json", forHTTPHeaderField: "content-type")
        }catch let errors{
            debugPrint(errors.localizedDescription)
        }
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            if error == nil {
                let httpResponse = response as! HTTPURLResponse
                if(httpResponse.statusCode == 200){
                    let jsonConveter = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                    print(jsonConveter!)
                }
            }
        }.resume()
    }
    
    //Put Api
    func putApi(){
        guard let url = URL(string: "https://dummyjson.com/products/1") else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        let sendData = ["id" : "1", "title": "iPhone 13", "brand": "Redmi"]
        do{
            let jsonConvert = try JSONSerialization.data(withJSONObject: sendData, options: .prettyPrinted)
            request.httpBody = jsonConvert
            request.addValue("Application/json", forHTTPHeaderField: "content-type")
        }catch let errors{
            debugPrint(errors.localizedDescription)
        }
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            if error == nil {
                let httpResponse = response as! HTTPURLResponse
                if(httpResponse.statusCode == 200){
                    let jsonConveter = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                    print(jsonConveter!)
                }
            }
        }.resume()
    }
}
