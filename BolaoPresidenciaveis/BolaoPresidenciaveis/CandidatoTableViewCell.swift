//
//  CandidatoTableViewCell.swift
//  BolaoPresidenciaveis
//
//  Created by Bruno Scheltzke on 21/08/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import UIKit

class CandidatoTableViewCell: UITableViewCell {

    @IBOutlet weak var candidatoName: UILabel!
    @IBOutlet weak var candidatoImage: UIImageView!
    
    var candidato: Candidato! {
        didSet {
            setCandidato()
        }
    }
    
    func setCandidato() {
        candidatoName.text = candidato.name
        candidatoImage.image = candidato.image
    }
}
