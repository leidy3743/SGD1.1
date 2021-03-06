//
//  ModeloBdDisciplinas.swift
//  SGD
//
//  Created by Leidy Carvajal on 10/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit

protocol ModeloBDProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class ModeloBdDisciplinas: NSObject, NSURLSessionDataDelegate {
    
    weak var delegate: ModeloBDProtocol!
    var data : NSMutableData = NSMutableData()
    let urlPath: String = "http://bcpolicarbonatos.com.co/WSUser/dDisciplinas.php"
    
    
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
        let disciplinasElementos: NSMutableArray = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            jsonElement = jsonResult[i] as! NSDictionary
            let Objdisciplinas = DisciplinasDatos()
            
            
            if let disciplina = jsonElement["disciplina"] as? String,
                let cantidad = jsonElement["cantidad"] as? Int
            {
                
                Objdisciplinas.disciplina = disciplina
                Objdisciplinas.cantidad = cantidad
            }
            
            disciplinasElementos.addObject(Objdisciplinas)
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            
            self.delegate.itemsDownloaded(disciplinasElementos)
        })
    }
}
