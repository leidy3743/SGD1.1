//
//  ViewControllerProgramaApoyo.swift
//  SGD
//
//  Created by Leidy Carvajal on 14/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerProgramaApoyo: UIViewController {

    @IBOutlet weak var gTabla: UIView!
    @IBOutlet weak var gLinea: UIView!
    @IBOutlet weak var gDona: UIView!
    @IBOutlet weak var menuBoton: UIBarButtonItem!
    @IBOutlet weak var botonGraficos: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if revealViewController() != nil {
            menuBoton.target = revealViewController()
            menuBoton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        gDona.hidden = false
        gLinea.hidden = true
        gTabla.hidden = true
        
    }

    @IBAction func cambiarGrafico(sender: AnyObject) {
        
        switch botonGraficos.selectedSegmentIndex{
        case 0:
            gDona.hidden = false
            gLinea.hidden = true
            gTabla.hidden = true
        case 1:
            gDona.hidden = true
            gLinea.hidden = false
            gTabla.hidden = true
        case 2:
            gDona.hidden = true
            gLinea.hidden = true
            gTabla.hidden = false
        default:
            break;
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

