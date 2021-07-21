//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabelOne: UILabel!
    @IBOutlet weak var resultLabelTwo: UILabel!
    
    var questions: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculate()
        self.navigationItem.hidesBackButton = true
    }
    
    private func calculate() {
        var frequency: [AnimalType: Int] = [:]
        let responseTypes = questions.map { $0.type }
        
        for questions in responseTypes {
            frequency[questions] = (frequency[questions] ?? 0) + 1
            let mostCommonAnswer = frequency.sorted { $0.1 > $1.1 }.first!.key
            
            resultLabelOne.text = "Вы - \(mostCommonAnswer.rawValue)!"
            resultLabelTwo.text = mostCommonAnswer.definition
        }
    }
}
