//
//  CandidatoDetailViewController.swift
//  BolaoPresidenciaveis
//
//  Created by Bruno Scheltzke on 22/08/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import UIKit

class CandidatoDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bordaoLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var voceElegeuLabel: UILabel!
    
    @IBOutlet weak var leaveButton: UIButton!
    
    var candidato: Candidato!
    var candidatoEleito = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = candidato.image
        nameLabel.text = candidato.name
        bordaoLabel.text = candidato.bordao
        
        title = candidato.name
        
        leaveButton.isHidden = !candidatoEleito
        voceElegeuLabel.isHidden = !candidatoEleito
    }
    
    @IBAction func leaveButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
