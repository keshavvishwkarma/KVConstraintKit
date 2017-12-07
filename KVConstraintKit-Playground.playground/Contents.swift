//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import KVConstraintKit

class MyViewController : UIViewController {
    override func loadView() {
        let aView  = View()
        aView.backgroundColor = .red
        self.view = aView
        
        // Prepare view heirarchy 
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "KVConstraintKit!"
        label.textAlignment = .center
        
        self.view + label // self.view.addSubviews(label)
        label.applyCenter().applyLeading(40).applyAspectRatio()
        
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

