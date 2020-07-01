//
//  ViewController.swift
//  ColorInference
//
//  Created by Ahmed Khalaf on 7/1/20.
//  Copyright © 2020 io.github.ahmedkhalaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var index = 0
        func switchColor() {
            let color = colors[index]
            labelContainerView.backgroundColor = color
            label.textColor = color.darkerAndMoreSaturated
            index = (index + 1) % colors.count
        }
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { (_) in
            switchColor()
        }
        switchColor()
    }
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Hello"
        label.font = .boldSystemFont(ofSize: 51)
        label.translatesAutoresizingMaskIntoConstraints = false
        labelContainerView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: labelContainerView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: labelContainerView.centerYAnchor),
            label.widthAnchor.constraint(equalTo: labelContainerView.widthAnchor, constant: -32),
            label.heightAnchor.constraint(equalTo: labelContainerView.heightAnchor, constant: -16)
        ])
        return label
    }()
    private lazy var labelContainerView: UIView = {
        let labelContainerView = UIView(frame: .zero)
        labelContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelContainerView)
        NSLayoutConstraint.activate([
            labelContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return labelContainerView
    }()
    private var colors: [UIColor] = [#colorLiteral(red: 0.968627451, green: 0.8156862745, blue: 0.8431372549, alpha: 1), #colorLiteral(red: 0.8, green: 0.9647058824, blue: 0.968627451, alpha: 1), #colorLiteral(red: 0.9137254902, green: 0.8509803922, blue: 0.9098039216, alpha: 1)]
}

private extension UIColor {
    var darkerAndMoreSaturated: UIColor {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: 1, brightness: 0.5, alpha: a)
    }
}
