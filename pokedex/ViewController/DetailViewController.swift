//
//  DetailViewController.swift
//  pokedex
//
//  Created by Raphael Freschi on 28/03/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var pokeName: UILabel!
    @IBOutlet var pokeImages: UICollectionView!
    @IBOutlet var pokeTypes: UICollectionView!
    @IBOutlet var pokeVariation: UIPickerView!
    @IBOutlet var pokeTab: UISegmentedControl!
    
    @IBOutlet var statsView: UIView!
    @IBOutlet var abilitiesView: UIView!
    @IBOutlet var evolutionView: UIView!
    
    let statsController = StatsViewController()
    
    var detail: DisplayableDetail!
    var evolution: DisplayableEvolution!
    var data: Displayable?
    var types: [DisplayableType] = []
    var stats: [DisplayableDetails] = []
    
    weak var delegate: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if self.data?.url != nil {
            requestDetails(url: self.data!.url)
        }
        
        
        DispatchQueue.main.async {
            self.requestData()
        }
        
        
        configComponents()
        setSegControl()
        
        
    }
    
    func requestData() {
        
        let cStats = children.first as? StatsViewController
        cStats?.requestStats(url: self.data!.url)
        
        let cAbilities = children.last as? AbilitiesViewController
        cAbilities?.requestAbilities(url: self.data!.url)
        
    }
    
    func requestEvolution(id: String) {
        let cEvolution = children[1] as? EvolutionViewController
        cEvolution?.requestEvolution(url: "https://pokeapi.co/api/v2/evolution-chain/\(id)")
        
        requestEvolution(url: "https://pokeapi.co/api/v2/evolution-chain/\(id)")
    }
    
    func configComponents() {
        pokeImages.dataSource = self
        pokeImages.delegate = self
        pokeTypes.dataSource = self
        pokeTypes.delegate = self
        pokeVariation.dataSource = self
        pokeVariation.delegate = self
    }
    
    func setSegControl() {
        pokeTab.setTitle("Stats", forSegmentAt: 0)
        pokeTab.setTitle("Evolution", forSegmentAt: 1)
        pokeTab.setTitle("Abilities", forSegmentAt: 2)
    }
    
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            statsView.alpha = 1
            abilitiesView.alpha = 0
            evolutionView.alpha = 0
        } else if sender.selectedSegmentIndex == 1 {
            statsView.alpha = 0
            abilitiesView.alpha = 1
            evolutionView.alpha = 0
        } else if sender.selectedSegmentIndex == 2 {
            statsView.alpha = 0
            abilitiesView.alpha = 0
            evolutionView.alpha = 1
        }
        
    }
    
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case pokeImages:
            return 6
        case pokeTypes:
            return types.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == pokeImages {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageDatailCell", for: indexPath) as! pokeImageCollectionViewCell
            
            cell.pokeImage.downloadedFrom(url: URL(string: "https://img.pokemondb.net/sprites/x-y/normal/\(self.data!.name).png")!)
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "typeCell", for: indexPath) as! PokeTypeCollectionViewCell
        
        cell.type.text = self.types[indexPath.row].PokeType.name
        
        return cell
        
        
    }
    
    
}

extension DetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == pokeTypes {
            print(indexPath.row)
            self.navigationController?.popViewController(animated: true)
            
            let vc = self.navigationController?.viewControllers[0] as! ViewController
            vc.requestWithType(url: self.types[indexPath.row].PokeType.url)
            
        }
    }
    
}

extension DetailViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if self.evolution != nil {
            let titles = ["\(self.evolution.chain.species.name)", "\(self.evolution.chain.evolves_to[0].species.name)", "\(self.evolution.chain.evolves_to[0].evolves_to[0].species.name)"]
            
            return titles[row]
        }
        
        return ""
    }
    
    
}

extension DetailViewController: UIPickerViewDelegate {
    
}


