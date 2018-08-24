//
//  ViewController.swift
//  BolaoPresidenciaveis
//
//  Created by Bruno Scheltzke on 21/08/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var candidatos: [Candidato] = {
        let boulos = Candidato(name: "Boulos", bordao: "Vamo invadir aquele palácio!", image: #imageLiteral(resourceName: "boulos"))
        let caboDaciolo = Candidato(name: "Cabo Daciolo", bordao: "Tá, mas e a URSAL?", image: #imageLiteral(resourceName: "caboDaciolo"))
        let bolsonaro = Candidato(name: "Bolsonaro", bordao: "Mais enxaguante, menos mortes", image: #imageLiteral(resourceName: "bolsonaro"))
        let lula = Candidato(name: "Lula", bordao: "Ao vivo em cadeia nacional", image: #imageLiteral(resourceName: "lula"))
        
        return [boulos, caboDaciolo, bolsonaro, lula]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: Present Segue
    @IBAction func elegerButtonPressed(_ sender: Any) {
        
        let randomIndex = Int(arc4random_uniform(UInt32(candidatos.count)))
        let eleito = candidatos[randomIndex]
        
        showElectedCandidato(eleito)
    }
    
    func showElectedCandidato(_ candidato: Candidato) {
        performSegue(withIdentifier: elegerSegue, sender: candidato)
    }
    
    func showDescriptionOfCandidato(_ candidato: Candidato) {
        performSegue(withIdentifier: segueId, sender: candidato)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let candidatoVC = segue.destination as? CandidatoDetailViewController, let candidato = sender as? Candidato, let id = segue.identifier, id == segueId {
            candidatoVC.candidato = candidato
        }
        
        if let candidatoVC = segue.destination as? CandidatoDetailViewController, let candidato = sender as? Candidato, let id = segue.identifier, id == elegerSegue {
            candidatoVC.candidato = candidato
            candidatoVC.candidatoEleito = true
        }
    }
}

// MARK: Table View
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candidatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: candidatoCell) as? CandidatoTableViewCell else { return UITableViewCell() }
        
        cell.candidato = candidatos[indexPath.row]
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let candidato = candidatos[indexPath.row]
        showDescriptionOfCandidato(candidato)
    }
    
}

// MARK: Identifiers
private let candidatoCell = "candidatoCell"
private let segueId = "candidatoSegue"
private let elegerSegue = "elegerSegue"
