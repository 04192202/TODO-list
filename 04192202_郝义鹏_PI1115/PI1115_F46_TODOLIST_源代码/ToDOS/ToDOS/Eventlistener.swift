//
//  Eventlistener.swift
//  ToDOS
//
//  Created by 郝义鹏 on 2022/10/18.
//

import UIKit



//事件监听：
extension TodosTableVC{
    @objc func toggleCheck(CheckButton :UIButton){
        let row = CheckButton.tag
        //修改数据
        todos[row].checked.toggle()
        //测试：print("点击\(row+1)行",“todos改变”,todos)
        //根据最新的数据更新视图
        appDelegate.saveContext()
        //移动完后要更新整个数据
        let checked = todos[row].checked
        CheckButton.isSelected = checked
        let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0))as! ToDoCell
        cell.ToDoLabel.textColor = checked ? .tertiaryLabel :.label
        
    }
}

