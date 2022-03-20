//
//  ViewController.swift
//  Cocktail
//
//  Created by wictoriene on 2.03.22.
//

import UIKit
import Alamofire
import Lottie

class ViewController: UIViewController {
    
    public var completion: (() -> Void)?
    private var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        animatedScreen()
        
        dismiss(animated: false) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.completion?()
            }
        }
    
    func animatedScreen(){
        animationView = .init(name: "cocktail-mixx")
        animationView!.frame = CGRect(x: 40, y: 260, width: 320, height: 320)
        animationView!.backgroundColor = .white
        animationView!.contentMode = .scaleAspectFill
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 1.5
        view.addSubview(animationView!)
        animationView.play()
    }
  }
}

