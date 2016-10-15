//
//  ProgramaApoyoDatos.swift
//  SGD
//
//  Created by Leidy Carvajal on 14/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit

class ProgramaApoyoDatos: NSObject {
    
    var esBeneficiario: String?
    var cantidadUso: Int?
    
    
    override init(){
        
    }
    
    
    //construct with @disciplina, @cantidas
    init(esBeneficiario: String, cantidadUso: Int) {
        
        self.esBeneficiario = esBeneficiario
        self.cantidadUso = cantidadUso
    }
}