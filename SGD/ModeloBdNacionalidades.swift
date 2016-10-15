//
//  ModeloBdNacionalidades.swift
//  SGD
//
//  Created by Leidy Carvajal on 12/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit

protocol ModeloBDPNac: class {
    func itemsDownloaded(items: NSArray)
}


class ModeloBdNacionalidades: NSObject, NSURLSessionDataDelegate {
    
    weak var delegate: ModeloBDPNac!
    var data : NSMutableData = NSMutableData()
    let urlPath: String = "http://bcpolicarbonatos.com.co/WSUser/dNacionalidades.php"
    
    
    func downloadItems() {
        
        let url: NSURL = NSURL(string: urlPath)!
        var session: NSURLSession!
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        let task = session.dataTaskWithURL(url)
        task.resume()
    }
    
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        self.data.appendData(data);
    }
    
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil {
            print("Failed to download data")
        }else {
            print("Data downloaded")
            self.parseJSON()
        }
    }
    
    
    func parseJSON() {
        
        var jsonResult: NSMutableArray = NSMutableArray()
        
        do{
            jsonResult = try NSJSONSerialization.JSONObjectWithData(self.data, options:NSJSONReadingOptions.AllowFragments) as! NSMutableArray
        } catch let error as NSError {
            print(error)
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let nacionalidadesElementos: NSMutableArray = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            jsonElement = jsonResult[i] as! NSDictionary
            let Objnacionalidades = NacionalidadesDatos()
            
            
            if let nacionalidad = jsonElement["nacionalidad"] as? String,
                let cantidad = jsonElement["cantidad"] as? Int
            {
                
                Objnacionalidades.nacionalidad = nacionalidad
                Objnacionalidades.cantidad = cantidad
            }
            
            nacionalidadesElementos.addObject(Objnacionalidades)
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            
            self.delegate.itemsDownloaded(nacionalidadesElementos)
        })
    }
}