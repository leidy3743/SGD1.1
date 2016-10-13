//
//  ViewControllerNacionalidades.swift
//  SGD
//
//  Created by Leidy Carvajal on 12/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class ViewControllerNacionalidades: UIViewController {
    
    
    @IBOutlet weak var gBubble: UIView!
    @IBOutlet weak var gBarra: UIView!
    @IBOutlet weak var gTabla: UIView!
    
    
    @IBOutlet weak var menuBoton: UIBarButtonItem!
    @IBOutlet weak var botonGrafico: UISegmentedControl!
    
    @IBAction func cambiarGrafico(sender: AnyObject) {
        
        switch botonGrafico.selectedSegmentIndex{
        case 0:
            gBubble.hidden = false
            gBarra.hidden = true
            gTabla.hidden = true
        case 1:
            gBubble.hidden = true
            gBarra.hidden = false
            gTabla.hidden = true
        case 2:
            gBubble.hidden = true
            gBarra.hidden = true
            gTabla.hidden = false
        default:
            break;
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if revealViewController() != nil {
            menuBoton.target = revealViewController()
            menuBoton.action = "revealToggle:"
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        gBubble.hidden = false
        gBarra.hidden = true
        gTabla.hidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}