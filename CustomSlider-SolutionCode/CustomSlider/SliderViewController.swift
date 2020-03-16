//
//  SliderViewController.swift
//  CustomSlider
//
//  Created by Ciara Beitel on 3/11/20.
//  Copyright © 2020 Ciara Beitel. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBAction func sliderValue(_ sender: CustomSlider) {
        let intValue = Int(mySlider.value)
        self.valueLabel.text = "\(intValue)% satisfied"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.valueLabel.text = "0% satisfied"
        mySlider.minimumTrackTintColor = UIColor(red: 244.0/255.0, green: 228.0/255.0, blue: 115.0/255.0, alpha: 1)
        mySlider.maximumTrackTintColor = UIColor(red: 204.0/255.0, green: 122.0/255.0, blue: 52.0/255.0, alpha: 1)
        mySlider.setThumbImage(UIImage(named: "Smile-Icon"), for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowColorsVCSegue" {
            let destinationVC = segue.destination as? ColorsViewController
        }
    }
}
    
class CustomSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let point = CGPoint(x: bounds.minX, y: bounds.midY)
        return CGRect(origin: point, size: CGSize(width: bounds.width, height: 20))
    }
}
