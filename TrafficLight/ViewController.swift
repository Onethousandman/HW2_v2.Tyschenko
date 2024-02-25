//
//  ViewController.swift
//  HW2_v2.Tyschenko
//
//  Created by Никита Тыщенко on 30.01.2024.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var lightChangeButton: UIButton!
    
    private var currentLight = Light.red
    private let ligthOn = 1.0
    private let lightOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.alpha = lightOff
        yellowLightView.alpha = lightOff
        greenLightView.alpha = lightOff
        
        lightChangeButton.layer.cornerRadius = 10
    }
    
    override func viewDidLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.height / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.height / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.height / 2
    }


    @IBAction func lightColorChange() {
        if lightChangeButton.currentTitle == "START" {
            lightChangeButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLightView.alpha = lightOff
            redLightView.alpha = ligthOn
            currentLight = .yellow
        case .yellow:
            redLightView.alpha = lightOff
            yellowLightView.alpha = ligthOn
            currentLight = .green
        case .green:
            yellowLightView.alpha = lightOff
            greenLightView.alpha = ligthOn
            currentLight = .red
        }
    }
}

extension UIViewController {
    enum Light {
        case red, yellow, green
    }
}

