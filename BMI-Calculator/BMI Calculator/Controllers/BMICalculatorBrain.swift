//
//  BMICalculatorBrain.swift
//  BMI Calculator
//
//  Created by sohail shaik on 6/10/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct BMICalculatorBrain {
    var bmi:BMI?
    var bmiValue:String?
    
    mutating func calculateBMI(height:Float,weight:Float){
        let value = weight/(height*height)
        bmiValue = String(format:"%0.1f",value)
        if(value<18.5){
            bmi = BMI(value: bmiValue, advice: "Eat more Biryani's!", color: .blue)
        }
        else if (value<24.9){
            bmi = BMI(value: bmiValue, advice: "You are fit!", color: .green)
        }
        else{
            bmi = BMI(value: bmiValue, advice: "You are Fat!", color: .red)
        }
    }
    
    func getColor()->UIColor{
        return bmi?.color ?? UIColor.white
    }
    func getAdvice()->String{
        return bmi?.advice ?? "No advice"
    }
    func getBMIValue()->String{
        return bmi?.value ?? "0.0"
    }

}
