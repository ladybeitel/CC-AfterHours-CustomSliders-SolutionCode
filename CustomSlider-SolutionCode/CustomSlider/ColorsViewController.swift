//
//  ColorsViewController.swift
//  CustomSlider
//
//  Created by Ciara Beitel on 3/11/20.
//  Copyright © 2020 Ciara Beitel. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    
    var color1 = UIColor()
    var color2 = UIColor()
    
    @IBOutlet weak var swatchSquare: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var saveColor1Button: UIButton!
    @IBOutlet weak var saveColor2Button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func redChanged(_ sender: UISlider) {
        updateViews()
    }
    
    @IBAction func greenChanged(_ sender: UISlider) {
        updateViews()
    }
    
    @IBAction func blueChanged(_ sender: UISlider) {
        updateViews()
    }
    
    @IBAction func saveColor1Tapped(_ sender: UIButton) {
        color1 = UIColor(red: CGFloat(redSlider.value / 255), green: CGFloat(greenSlider.value / 255), blue: CGFloat(blueSlider.value / 255), alpha: CGFloat(1))
    }
    
    @IBAction func saveColor2Tapped(_ sender: UIButton) {
        color2 = UIColor(red: CGFloat(redSlider.value / 255), green: CGFloat(greenSlider.value / 255), blue: CGFloat(blueSlider.value / 255), alpha: CGFloat(1))
    }
    
    func updateViews() {
        let redValue = CGFloat(redSlider.value / 255)
        let greenValue = CGFloat(greenSlider.value / 255)
        let blueValue = CGFloat(blueSlider.value / 255)
        swatchSquare.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: CGFloat(1))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFilterVCSegue" {
            let destinationVC = segue.destination as? FilterViewController
            destinationVC?.destinationColor1 = color1
            destinationVC?.destinationColor2 = color2
        }
    }
}
