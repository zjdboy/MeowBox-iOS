//
//  Q&AData.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 9..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation

struct QuestionAnswerData: Codable {
    
    let status: Bool
    let message: String
    let result: QuestionAnswer
}
