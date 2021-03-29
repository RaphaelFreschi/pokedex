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
    
    var data: Displayable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("DATA -------- \(self.data!)")
        
        if self.data?.url != "" {
            requestDetails(url: self.data!.url)
        }
        
        
       
        
        configComponents()
        setSegControl()
        
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case pokeImages:
            return 6
        case pokeTypes:
            return 6
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == pokeImages {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageDatailCell", for: indexPath) as! pokeImageCollectionViewCell
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "typeCell", for: indexPath) as! PokeTypeCollectionViewCell
            
        return cell
            
        
    }
    
    
}

extension DetailViewController: UICollectionViewDelegate {
    
}

extension DetailViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ""
    }
    
    
}

extension DetailViewController: UIPickerViewDelegate {
    
}


