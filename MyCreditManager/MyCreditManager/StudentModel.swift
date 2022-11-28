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
}

struct Score {
    var subject: String
    var grade: String
}
