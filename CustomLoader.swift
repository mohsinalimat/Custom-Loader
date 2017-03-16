//
//  customLoader.swift
//  CustomLoader
//
//  Created by Julipopo  on 15/03/2017.
//  Copyright © 2017 Julipopo . All rights reserved.
//

import UIKit

class CustomLoader: UIView {

    var shouldAnimate = true;
    var brushImage = UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(withImageNamed : String, inRect: CGRect){
        
        brushImage = UIImage.init(named: withImageNamed)!
        
        super.init(frame: inRect)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let h = rect.height
        let w = rect.width
        
        brushImage.draw(in: CGRect(x: 0, y: 0, width: w, height: h))
    }
    
    func loadImage(stringg: String){
        brushImage = UIImage.init(named: stringg)!
    }
    
    func startAnimating(){
        shouldAnimate = true
        animate()
    }
    
    func animate(){
        UIView.animate(withDuration: 0.025, delay: 0, options: .curveLinear, animations: { () -> Void in
            self.transform = self.transform.rotated(by: CGFloat(M_PI_2/20))
        }) { (finished) -> Void in
            if self.shouldAnimate{
                self.startAnimating()
            }
        }
    }
    
    func stopAnimating(){
        shouldAnimate = false
    }

}

extension CustomLoader {
    
    @IBInspectable var withImage: UIImage {
        get {
            return brushImage
        }
        set {
            brushImage = newValue
        }
    }
    
}
