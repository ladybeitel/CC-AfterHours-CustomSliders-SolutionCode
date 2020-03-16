//
//  FilterViewController.swift
//  CustomSlider
//
//  Created by Ciara Beitel on 3/11/20.
//  Copyright © 2020 Ciara Beitel. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    var destinationColor1: UIColor?
    var destinationColor2: UIColor?
    var context: CIContext!
    var currentFilter: CIFilter!

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkMeOutTapped(_ sender: UIButton) {
        context = CIContext()
        guard let color1 = destinationColor1,
            let color2 = destinationColor2 else { return }
        currentFilter = CIFilter(name: "CICheckerboardGenerator", parameters: ["inputColor0" : CIColor(color: color1), "inputColor1" : CIColor(color: color2), "inputCenter" : CIVector(x: 0, y: 0), "inputWidth" : 50.00])
        
        if let cgimg = context.createCGImage(currentFilter.outputImage!, from: self.imageView.bounds) {
            self.imageView.image = UIImage(cgImage: cgimg)
        }
    }
}
