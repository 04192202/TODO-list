//
//  Delegate.swift
//  ToDOS
//
//  Created by 郝义鹏 on 2022/10/17.
//
import UIKit
import Foundation

    extension TodosTableVC{
    //当用户点击cell的时候调用
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let vc = storyboard?.instantiateViewController(withIdentifier: KTodoTableVC) as! todosViewController
        //        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        //取消选择cell以让底色迅速消失
        //        找到storyboard上的vc
        
        //        let vc = storyboard?.instantiateViewController(withIdentifier: KTodoTableVC) as! todosViewController
        //        用代码进行push跳转
        //        navigationController?.pushViewController(vc, animated: true)
    }
        override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            isEditing ? .none :.delete 
//            if !isEditing{
//                return.delete
//            }else{
//                return.none
//            }
        }
        //编辑模式中缩进
        override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
            return false
        }
    
    }

    extension TodosTableVC:todoTableViewControllerDelegate{
    //增删改查-增
        
    func didadd(name: String) {
        //1.本地化存储，编码存储 添加数据
//        todos.append(Todo(name:name,checked: false))
        //单例，standard是userdefaults的类属性 省资源
        //saveData()
    //2core data
        // 实例化一个空的todo 调用saveCOntext（）查看内容是否有改变
        let todo = Todo(context: context)
        todo.name = name
        todos.append(todo)
        appDelegate.saveContext()
        //根据最新数据更新视图
        tableView.insertRows(at: [IndexPath(row: todos.count-1, section: 0)], with: .automatic)
    }
    
    
    //增删改查：改数据
    func didEidt(name: String) {
        //改数据
        todos[row].name = name
        //改完保存
        appDelegate.saveContext()
        
        // let indexPath = IndexPath(row:row, section: 0)
        // let cell = tableView.cellForRow(at: indexPath)as! ToDoCell
        // cell.ToDoLabel.text = name
        
//        appDelegate.saveContext()
        //重载数据
        tableView.reloadData()
    }
}
    

    
    

