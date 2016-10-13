//
//  NacionalidadesDatos.swift
//  SGD
//
//  Created by Leidy Carvajal on 12/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit

class NacionalidadesDatos: NSObject {
    
    var nacionalidad: String?
    var cantidad: Int?
    
    
    override init(){
        
    }
    
    
    //construct with @nacionalidad, @cantidad
    init(nacionalidad: String, cantidad: Int) {
        
        self.nacionalidad = nacionalidad
        self.cantidad = cantidad
    }
}