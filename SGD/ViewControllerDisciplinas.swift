//
//  ViewControllerDisciplinas.swift
//  SGD
//
//  Created by Leidy Carvajal on 11/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerDisciplinas: UIViewController {
    
    
    
    @IBOutlet weak var gBarra: UIView!
    @IBOutlet weak var gDona: UIView!
    @IBOutlet weak var gTabla: UIView!
    @IBOutlet weak var botonGraficos: UISegmentedControl!
    @IBOutlet weak var menuBoton: UIBarButtonItem!
  
    @IBAction func cambiarGrafico(sender: UISegmentedControl) {
        switch botonGraficos.selectedSegmentIndex{
        case 0:
            gBarra.hidden = false
            gDona.hidden = true
            gTabla.hidden = true
        case 1:
            gBarra.hidden = true
            gDona.hidden = false
            gTabla.hidden = true
        case 2:
            gBarra.hidden = true
            gDona.hidden = true
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
        
        gBarra.hidden = false
        gDona.hidden = true
        gTabla.hidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}