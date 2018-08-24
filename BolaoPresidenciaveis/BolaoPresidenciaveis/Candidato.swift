//
//  Candidato.swift
//  BolaoPresidenciaveis
//
//  Created by Bruno Scheltzke on 21/08/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import UIKit

class Candidato {
    var name: String
    var bordao: String
    var image: UIImage
    
    init(name: String, bordao: String, image: UIImage) {
        self.name = name
        self.bordao = bordao
        self.image = image
    }
}
