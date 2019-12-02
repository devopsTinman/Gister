//
//  ViewController.swift
//  Gister
//
//  Created by Allbee, Eamon on 11/29/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import UIKit
import Alamofire


class GisterMainVC: UIViewController {

    
    @IBOutlet weak var btnTestGister: UIButton!
    
    @IBAction func gisterBtnPressed(_ sender: Any) {
        
        
        let urlComp = URLComponents(string: POST_ENDPOINT)
        
        let url = urlComp?.url
        
        let config = URLSessionConfiguration.default
        
        let session = URLSession(configuration: config)
        
        var dataTask: URLSessionDataTask?
        
        dataTask = session.dataTask(with: url!, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in

            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            
            
            
            guard error == nil else {
                print("Error calling GET on /posts/1")
                print(error)
                return
            }
            
            
            do {
                // make sure this JSON is in the format we expect
                if let post = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    // try to read out a string array

                    print(post.description)
                    
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        
            
        })
        
        dataTask?.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

