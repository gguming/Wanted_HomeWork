//
//  StudentsGradeManager.swift
//  Wanted_Homework
//
//  Created by SUN on 2022/11/27.
//

import Foundation

enum InputErrorInAddStudent: Error {
    case emptyInput
    case aleadyExist
}

class StudentsGradeManager {
    static let gradeScoreTable = ["A+": 4.5, "A": 4.0, "B+": 3.5, "B": 3.0, "C+": 2.5, "C": 2.0, "D+": 1.5, "D": 1.0, "F": 0.0]
    let gradeTable = Array(gradeScoreTable.keys)
    var studentList: [Student] = []
    
    
    func addStudent() throws {
        print("추가할 학생의 이름을 입력해주세요.")
        let input = readLine() ?? ""
        
        guard !input.isEmpty else { throw InputErrorInAddStudent.emptyInput }
        
        guard !studentList.contains(where: { student in
            student.name == input
        }) else { throw InputErrorInAddStudent.aleadyExist}
        
        let student = Student(name: input)
        studentList.append(student)
        print(String(format: "%@ 학생을 추가했습니다.", input))
    }
    
    func removeStudent() throws {
        print("삭제할 학생의 이름을 입력해주세요.")
        let input = readLine() ?? ""
        
        guard !input.isEmpty else { throw InputErrorInAddStudent.emptyInput }
        
    }
    
}
