//
//  ViewController.swift
//  push_Notif
//
//  Created by Sugan on 25/07/18.
//  Copyright © 2018 Sugan. All rights reserved.
//

//to do

//1.Notification for multiple user devices,
//2.based on user prefernce changes topic subscribe and its message...


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://fcm.googleapis.com/fcm/send")
        let postParams: [String : Any] = ["to": "cw34y2oZgXk:APA91bGzQI2oD-v0ceQ93c57D0AwDCgjPKcAGT-dI-pZu1Yi020XhkVBRanGIxq5IYc70VSt3W8AP4klphFaHqj7re-a6JjKxm7iCycUAF_DBQb3OteZFHOsgXJaWaCU-fXc8CzIfiq5RDpX_LxAC2hIyLFtC4mKlQ" , "notification": ["body": "This is the body.", "title": "This is the title.", "sound" : "allow.mp3","badge":1]]
//        let params :
        
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("key=AIzaSyCuRIHhaQz9oaPmvlU-FbRKKrmyPqOTnMY", forHTTPHeaderField: "Authorization")
        
        do
        {
            request.httpBody = try JSONSerialization.data(withJSONObject: postParams, options: JSONSerialization.WritingOptions())
            print("My paramaters: \(postParams)")
        }
        catch
        {
            print("Caught an error: \(error)")
        }
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if let realResponse = response as? HTTPURLResponse
            {
                if realResponse.statusCode != 200
                {
                    print("Not a 200 response")
                }
            }
            
            if let postString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as? String
            {
                print("POST: \(postString)")
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

