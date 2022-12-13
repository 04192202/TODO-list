//
//  TodosTableVC.swift
//  ToDOS
//
//  Created by 郝义鹏 on 2022/10/14.
//

import UIKit

class TodosTableVC: UITableViewController {
    
    
    var todos : [Todo] = []
    //var todos = [Todo]()
    
    var row = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        
        navigationItem.rightBarButtonItem?.image = sizeIcon("plus.circle.fill")
        
        //sandbox 路径
        print(NSHomeDirectory())
        
        let request = Todo.fetchRequest()
        //ascending true 升序 fasle 降序
        //sortDescriptors 排序功能
        request.sortDescriptors = [NSSortDescriptor(key: korderID, ascending: true)]
        
        if let todos = try?context.fetch(request){
            self.todos=todos
        }else{
            print("SQlite获取失败")
        }

        
        
//        if let data = UserDefaults.standard.data(forKey: TodoKey){
//
//            if let todos = try?JSONDecoder().decode([Todo].self, from: data){
//                self.todos = todos
//        }else{
//            print("解码失败")
//          }
//        }
    }
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! todosViewController
        vc.delegate = self
        
        if segue.identifier == kEditTodo{
            
            let cell = sender as! ToDoCell//sender就是用户点击的cell
            
            //cell-->IndexPath
            row = tableView.indexPath(for: cell)!.row
            // indexPath-->cell
            //tableView.cellForRow(at: indexPath) as! ToDoCell
            vc.name = todos[row].name//正向传值
            
        }
    }
}
        
        
        
       

        
    
