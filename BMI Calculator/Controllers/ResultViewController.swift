//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Марина on 07.08.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue = "0.0"
    var advice = "no advice"
    var color = UIColor.systemGray
    
    
    private let backImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "result_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 35)
        label.text = "YOUR RESULT"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resultValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 80)
        label.text = "19.5"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let adviceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.text = "EAT SOME MORE SNACKS!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var  recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.3843137255, green: 0.3764705882, blue: 0.6156862745, alpha: 1)
        button.setTitle("RECALCULATE", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(recalculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setConstraints()
    }
    
    private func setUpView() {
        view.backgroundColor = color
        view.addSubview(backImage)
        
        labelsStackView.addArrangedSubview(resultLabel)
        labelsStackView.addArrangedSubview(resultValueLabel)
        labelsStackView.addArrangedSubview(adviceLabel)
        view.addSubview(labelsStackView)
        
        view.addSubview(recalculateButton)
        
        resultValueLabel.text = bmiValue
        adviceLabel.text = advice
        
    }
    
    @objc func recalculateButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ResultViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: view.topAnchor),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            labelsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            recalculateButton.heightAnchor.constraint(equalToConstant: 50),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            recalculateButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        
        ])
    }
}
