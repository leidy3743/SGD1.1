//
//  CampeonatosDatos.swift
//  SGD
//
//  Created by Leidy Carvajal on 13/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit

class CampeonatosDatos: NSObject {
        
        var tipo: String?
        var cantidadTipo: Int?
        
        
        override init(){
            
        }
        
        
        //construct with @disciplina, @cantidas
        init(tipo: String, cantidadTipo: Int) {
            
            self.tipo = tipo
            self.cantidadTipo = cantidadTipo
        }
    }