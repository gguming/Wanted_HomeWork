//
//  StudentsGradeManager.swift
//  Wanted_Homework
//
//  Created by SUN on 2022/11/27.
//

import Foundation

enum InputError: Error {
    case emptyInput
    case aleadyExist(name: String)
    case notFoundStudent(name: String)
    case invalidFormat
}

class StudentsGradeManager {
    static let gradeScoreTable = ["A+": 4.5, "A": 4.0, "B+": 3.5, "B": 3.0, "C+": 2.5, "C": 2.0, "D+": 1.5, "D": 1.0, "F": 0.0]
    private let gradeTable = Array(gradeScoreTable.keys)
    private var studentList: [Student] = []
    
    
    
    func addStudent() throws {
        print("추가할 학생의 이름을 입력해주세요.")
        
        guard let input = readLine() else { throw InputError.emptyInput }
        
        guard !studentList.contains(where: { student in
            student.name == input
        }) else { throw InputError.aleadyExist(name: input)}
        
        let student = Student(name: input)
        studentList.append(student)
        print(String(format: "%@ 학생을 추가했습니다.", input))
    }
    
    func removeStudent() throws {
        print("삭제할 학생의 이름을 입력해주세요.")
        guard let input = readLine() else { throw InputError.emptyInput }
        
        guard studentList.contains(where: { student in
            student.name == input }) else { throw InputError.notFoundStudent(name: input) }
        
        studentList = studentList.filter({ $0.name != input })
        print(String(format: "%@ 학생을 삭제했습니다.", input))
    }
    
    func addGrade() throws {
        print("성적을 추가할 학생의 이름, 과목이름, 성적(A, A+, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift A+")
        print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        guard let input = readLine() else { throw InputError.emptyInput }
        
        let splitedInput = input.split(separator: " ").map({ String($0) })
        
        guard splitedInput.count == 3 else { throw InputError.invalidFormat }
        
        guard studentList.contains(where: {$0.name == splitedInput[0]}) else { throw InputError.notFoundStudent(name: splitedInput[0])}
        
        if studentList.contains(where: { student in student.name == splitedInput.first }),
           let index = studentList.firstIndex(where:{ student in student.name == splitedInput.first }),
           let gradeListIndex = studentList[index].gradeList.firstIndex(where: { score in score.subject == splitedInput[1]}){
            studentList[index].gradeList[gradeListIndex].grade = splitedInput[3]
            print(String(format: "%@ 학생의 %@ 과목이 %@로 추가(변경)되었습니다,", splitedInput[0], splitedInput[1], splitedInput[2]))
        } else if studentList.contains(where: { student in student.name == splitedInput.first }),
            let index = studentList.firstIndex(where:{ student in student.name == splitedInput.first }) {
            let subjectAndGrade = Score(subject: splitedInput[1], grade: splitedInput[2])
            studentList[index].gradeList.append(subjectAndGrade)
            print(String(format: "%@ 학생의 %@ 과목이 %@로 추가(변경)되었습니다,", splitedInput[0], splitedInput[1], splitedInput[2]))
        }
    }
    
    func removeGrade() throws {
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift")
        guard let input = readLine() else { throw InputError.emptyInput }
        
        let splitedInput = input.split(separator: " ").map({ String($0) })
        
        guard splitedInput.count == 2 else { throw InputError.invalidFormat }
        
        guard studentList.contains(where: {$0.name == splitedInput[0]}) else { throw InputError.notFoundStudent(name: splitedInput[0])}
        
        let index = firstIndex(name: splitedInput[0])!
        studentList[index].gradeList = studentList[index].gradeList.filter({ $0.subject != splitedInput[1]})
        print(String(format: "%@ 학생의 %@ 과목의 성적이 삭제되었습니다,", splitedInput[0], splitedInput[1]))
    }
    
    func getGrades() throws {
        print("평점을 알고싶은 학생의 이름을 입력해주세요.")
        guard let input = readLine() else { throw InputError.emptyInput }
        
        guard studentList.contains(where: {$0.name == input}) else { throw InputError.notFoundStudent(name: input)}
        
        let index = firstIndex(name: input)!
        studentList[index].gradeList.forEach({
            print(String(format: "%@: %@", $0.subject, $0.grade))
        })
        print(String(format: "평점: %@", studentList[index].getAverageToString()))
    }
    
}

// MARK: 기타 메소드
extension StudentsGradeManager {
    private func firstIndex(name: String) -> Int? {
        return studentList.firstIndex(where: { $0.name == name })
    }

    private func isExistStudent(name: String) -> Bool {
        return studentList.contains(where:{ $0.name == name })
    }
}
