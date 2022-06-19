//
//  CocktailStepsVC.swift
//  Cocktail
//
//  Created by wictoriene on 21.03.22.
//

import UIKit
import Lottie
import Firebase
import SDWebImage

class CocktailStepsVC: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var stepOrder: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    
    private var animationView: AnimationView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 15
        animatedScreen()
        
        
    }
    
    func animatedScreen(){
        animationView = .init(name: "bar")
        animationView!.frame = CGRect(x: 30, y: 515, width: 120, height: 120)
        animationView!.backgroundColor = .white
        animationView!.contentMode = .scaleAspectFill
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 1.5
        view.addSubview(animationView!)
        animationView.play()
    }
    
    
    
  }

