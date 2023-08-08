//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Марина on 07.08.2023.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(weightValue: Float, heightValue: Float) {
        let bmiValue = weightValue / pow(heightValue, 2)
        switch bmiValue {
        case 0.0 ..< 18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more yummy food", color: .blue)
        case 18.5 ..< 24.9:
            bmi = BMI(value: bmiValue, advice: "Good job", color: .green)
        default:
            bmi = BMI(value: bmiValue, advice: "Do more activities", color: .red)
        }
    }
    
    func getBMIvalue() -> String {
        let BMIto1decimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return BMIto1decimalPlace
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "no advice"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? .systemGray
    }
}
