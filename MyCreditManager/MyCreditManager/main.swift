//
//  StudentModel.swift
//  Wanted_Homework
//
//  Created by SUN on 2022/11/27.
//

import Foundation

private var input = ""

repeat {
    print(StringConstant.chooseMainOption)
    input = readLine() ?? ""
    
    switch input {
    case "1":
        print(1)
    case "2":
        print(6)
    case "3":
        print(5)
    case "4":
        print(4)
    case "5":
        print(3)
    default:
        print(StringConstant.errorMessageForMainOption)

    }
} while input != "X"

