//
//  InicioViewController.swift
//  SGD
//
//  Created by Leidy Carvajal on 10/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit

class InicioViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var menuBoton: UIBarButtonItem!
    @IBOutlet weak var extraBoton: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = 340
        
        if self.revealViewController() != nil {
            menuBoton.target = self.revealViewController()
            menuBoton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            extraBoton.target = self.revealViewController()
            extraBoton.action = "rightRevealToggle:"
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        let urlPath: String = "http://www.sind.gov.co/noticias/listar"
        let url: NSURL = NSURL(string: urlPath)!
        
        //Crea una variable llamda request que hace una carga de la url contenida en url
        let request = NSURLRequest (URL:url)
        
        //Cargamos la web en nuestro objeto web
        webView.loadRequest(request)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}