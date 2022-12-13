//
//  Constants.swift
//  ToDOS
//
//  Created by 郝义鹏 on 2022/10/14.
//

import Foundation
import UIKit

let kToDoCellID = "ToDoCellID"
let kAddTodoID = "AddTodoID"
let KTodoTableVC = "TodoTableVCID"
let kEditTodo = "EditTodoID"
let korderID = "orderID"
//user
 let TodoKey = "Todoskey"
func sizeIcon(_ inconname:String, _ size: CGFloat = 22)->UIImage?{
    let config = UIImage.SymbolConfiguration(pointSize: size)
    return UIImage(systemName: inconname, withConfiguration: config)
}
