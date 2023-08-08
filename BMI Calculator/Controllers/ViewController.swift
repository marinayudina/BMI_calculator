//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Марина on 03.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
   
    private let backImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "calculate_background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 40)
        label.numberOfLines = 0
        label.text = "CALCULATE YOUR BMI"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightStack : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17)
        label.text = "Height"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let heightValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17)
        label.text = "1.5m"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weightStack : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17)
        label.text = "Weight"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let weightValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17)
        label.text = "100kg"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 3
        slider.thumbTintColor = #colorLiteral(red: 0.5301787853, green: 0.5373442173, blue: 0.8578383327, alpha: 0.5179794521)
        slider.minimumTrackTintColor = #colorLiteral(red: 0.5301787853, green: 0.5373442173, blue: 0.8578383327, alpha: 1)
        slider.addTarget(self, action: #selector(heightSliderMoved), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    private lazy var weightSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 200
        slider.thumbTintColor = #colorLiteral(red: 0.5301787853, green: 0.5373442173, blue: 0.8578383327, alpha: 0.5179794521)
        slider.minimumTrackTintColor = #colorLiteral(red: 0.5301787853, green: 0.5373442173, blue: 0.8578383327, alpha: 1)
        slider.addTarget(self, action: #selector(weightSliderMoved), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var  calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("CALCULATE", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = #colorLiteral(red: 0.3843137255, green: 0.3764705882, blue: 0.6156862745, alpha: 1)
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setConstraints()
    }

    private func setUpView() {
        view.addSubview(backImage)
        
        
        heightStack.addArrangedSubview(heightLabel)
        heightStack.addArrangedSubview(heightValueLabel)
        
        weightStack.addArrangedSubview(weightLabel)
        weightStack.addArrangedSubview(weightValueLabel)
        
        mainStack.addArrangedSubview(nameLabel)
        mainStack.addArrangedSubview(heightStack)
        mainStack.addArrangedSubview(heightSlider)
        mainStack.addArrangedSubview(weightStack)
        mainStack.addArrangedSubview(weightSlider)
        mainStack.addArrangedSubview(calculateButton)
        view.addSubview(mainStack)
        
        heightSlider.value = 1.5
        weightSlider.value = 100
    }
    
    @objc func weightSliderMoved(_ sender: UISlider){
        weightValueLabel.text = String(format: "%.0f", sender.value) + "kg"
    }
    
    @objc func heightSliderMoved(_ sender: UISlider){
        heightValueLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @objc func calculateButtonTapped(_ sender: UIButton) {
        let weightValue = weightSlider.value
        let heightValue = heightSlider.value
        
        
        calculatorBrain.calculateBMI(weightValue: weightValue, heightValue: heightValue)
        
        let resultVC = ResultViewController()
        resultVC.bmiValue = calculatorBrain.getBMIvalue()
        resultVC.advice = calculatorBrain.getAdvice()
        resultVC.color = calculatorBrain.getColor()
        self.present(resultVC, animated: true, completion: nil)
    }
    

}

extension ViewController{
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: view.topAnchor),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            heightStack.heightAnchor.constraint(equalToConstant: 21),
            weightStack.heightAnchor.constraint(equalToConstant: 21),
            
            weightSlider.heightAnchor.constraint(equalToConstant: 60),
            heightSlider.heightAnchor.constraint(equalToConstant: 60),
            
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
}
