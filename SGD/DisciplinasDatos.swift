//
//  DisciplinasDatos.swift
//  SGD
//
//  Created by Leidy Carvajal on 10/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit

class DisciplinasDatos: NSObject {
    
    var disciplina: String?
    var cantidad: Int?
    
    
    override init(){
        
    }
    
    
    //construct with @disciplina, @cantidas
    init(disciplina: String, cantidad: Int) {
        
        self.disciplina = disciplina
        self.cantidad = cantidad
    }
    
    
    //prints object's current state
    override var description: String {
        
        return "disciplina: \(disciplina)"
    }
}