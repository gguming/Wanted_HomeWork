//
//  StudentModel.swift
//  Wanted_Homework
//
//  Created by SUN on 2022/11/27.
//

import Foundation

private var input = ""
let studentDataManager = StudentsGradeManager()

repeat {
    print(StringConstant.chooseMainOption)
    input = readLine() ?? ""
    
    switch input {
    case "1":
        do {
            try studentDataManager.addStudent()
        } catch InputError.emptyInput {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        } catch InputError.aleadyExist(let name) {
            print(String(format: "%@은 이미 존재하는 학생입니다. 추가하지 않습니다.", name))
        }
    case "2":
        do {
            try studentDataManager.removeStudent()
        } catch InputError.notFoundStudent(let name) {
            print(String(format: "%@ 학생을 찾지 못했습니다.", name))
        }
    case "3":
        do {
            try studentDataManager.addGrade()
        } catch InputError.emptyInput, InputError.invalidFormat {
            print("입력이 잘못되엇습니다. 다시 확인해주세요.")
        } catch InputError.notFoundStudent(let name) {
            print(String(format: "%@ 학생을 찾지 못했습니다.", name))
        }
    case "4":
        do {
            try studentDataManager.removeGrade()
        } catch InputError.emptyInput, InputError.invalidFormat {
            print("입력이 잘못되엇습니다. 다시 확인해주세요.")
        } catch InputError.notFoundStudent(let name) {
            print(String(format: "%@ 학생을 찾지 못했습니다.", name))
        }
    case "5":
        do {
            try studentDataManager.getGrades()
        } catch InputError.emptyInput{
            print("입력이 잘못되엇습니다. 다시 확인해주세요.")
        } catch InputError.notFoundStudent(let name) {
            print(String(format: "%@ 학생을 찾지 못했습니다.", name))
        }
    case "X":
        print("프로그램을 종료합니다...")
    default:
        print(StringConstant.errorMessageForMainOption)

    }
} while input != "X"
