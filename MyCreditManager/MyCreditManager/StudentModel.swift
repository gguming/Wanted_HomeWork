//
//  StudentModel.swift
//  Wanted_Homework
//
//  Created by SUN on 2022/11/27.
//

import Foundation

struct Student {
    var name: String
    var gradeList: [Score] = []
    
    func firstIndex(subject: String) -> Int? {
        return gradeList.firstIndex(where: { $0.subject == subject })
    }
    
    func getAverageToString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        var result = 0.0
        for grade in gradeList {
            result += StudentsGradeManager.gradeScoreTable[grade.grade] ?? 0.0
        }
        result = result / Double(gradeList.count)
        return numberFormatter.string(for: result)!
    }
}

struct Score {
    var subject: String
    var grade: String
}
