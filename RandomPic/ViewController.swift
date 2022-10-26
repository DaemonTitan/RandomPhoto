//
//  ViewController.swift
//  RandomPic
//
//  Created by Tony Chen on 24/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()

    private let button: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.configuration?.title = "Get Random Photo"
        button.configuration?.subtitle = "Photo from webpage"
        button.configuration?.baseForegroundColor = .white
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.image = UIImage(systemName: "photo.fill")
        button.configuration?.imagePadding = 8.0
        //button.backgroundColor = .white
        //button.setTitle("Random Photo", for: .normal)
        //button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Image name: XXXX"
        label.textColor = .white
        label.font = .systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemRed,
        .systemBlue,
        .systemGray,
        .systemOrange
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        view.addSubview(button)
        view.addSubview(label)
//        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -24),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 90),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            label.heightAnchor.constraint(equalToConstant: 40),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),

            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 55)
        ])
        imageView.center = view.center
        
        
        getRandomPic()
       button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPic()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        button.frame = CGRect(x: 30, y: view.frame.size.height - 150 - view.safeAreaInsets.bottom, width: view.frame.size.width - 60, height: 55)
    }
    
    func getRandomPic() {
        let urlString = "https://source.unsplash.com/random/600x600"
        guard let url = URL(string: urlString),
              let data = try? Data(contentsOf: url) else {
                  return
              }
        imageView.image = UIImage(data: data)
    }


}

