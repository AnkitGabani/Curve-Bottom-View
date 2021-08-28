//
//  LoginViewController.swift
//  TapGesture
//
//  Created by Rutvik Moradiya on 28/08/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setHalfView()
        // Do any additional setup after loading the view.
    }
    

   
    func setHalfView() {
        topView.clipsToBounds = true

        let curveRadius    = topView.frame.width * 0.03 // Adjust curve of the topView view here
        let invertedRadius = 1.0 / curveRadius

        let rect = CGRect(x: 0,
                          y: -40,
                          width: topView.bounds.width + topView.frame.width * 2 * invertedRadius,
                          height: topView.bounds.height)

        let ellipsePath = UIBezierPath(ovalIn: rect)
        let transform = CGAffineTransform(translationX: -topView.frame.width * invertedRadius, y: 0)
        ellipsePath.apply(transform)

        let rectanglePath = UIBezierPath(rect: topView.bounds)
        rectanglePath.apply(CGAffineTransform(translationX: 0, y: -topView.frame.height * 0.5))
        ellipsePath.append(rectanglePath)

        let maskShapeLayer  = CAShapeLayer()
        maskShapeLayer.frame = topView.bounds
        maskShapeLayer.path  = ellipsePath.cgPath
        topView.layer.mask = maskShapeLayer

    }

}
