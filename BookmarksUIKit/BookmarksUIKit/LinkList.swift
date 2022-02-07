//
//  LinkList.swift
//  BookmarksUIKit
//
//  Created by Vasiliy Shannikov on 20.01.2022.
//

import UIKit
import SnapKit

class LinkList: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    private var links: [String] = ["google.com", "yandex.ru", "gismeteo.ru"]
//    private var linkObj = [LinkModel(name: "google", link: "https://www.google.ru/?client=safari&channel=mac_bm"), LinkModel(name: "yandex.ru", link: "https://yandex.kz")]
    private  var linkObj = Storage.savedLinks
    
    lazy var listTitle: UILabel = {
        let label = UILabel()
        label.text = "List"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    lazy var list: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bookmark App"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = """
Save your first
bookmark
"""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add bookmark", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(addButtonDidPress), for: .touchUpInside)
        return button
    }()
    
    @objc private func addButtonDidPress() {
        print("Button was pressed!")
        let alert = UIAlertController(title: "Please enter name and URL of the dookmark", message: "", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "Page name"
            field.returnKeyType = .next
            field.keyboardType = .default
            
        }
        alert.addTextField { field in
            field.placeholder = "URL"
            field.returnKeyType = .next
            field.keyboardType = .URL
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
            print("Hi")
            guard let fields = alert.textFields, fields.count == 2 else {
                return
            }

            guard let name = fields[0].text,!name.isEmpty,
                  let link = fields[1].text,!link.isEmpty else {
                      return
                  }
            self.linkObj.append(LinkModel(name: name, link: link))
            Storage.savedLinks.append(LinkModel(name: name, link: link))
            self.check(n: self.linkObj.count)
            self.list.reloadData()
            
          //  self.view.layoutIfNeeded()
        }))
        
        present(alert, animated: true)
//        mainLabel.removeFromSuperview()
//        titleLabel.removeFromSuperview()
        
      
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        check(n: linkObj.count)
        
        view.backgroundColor = .white
        list.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        
        list.delegate = self
        list.dataSource = self
        
        view.addSubview(listTitle)
        view.addSubview(list)
        view.addSubview(addButton)
        view.addSubview(titleLabel)
        view.addSubview(mainLabel)
        
        listTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(56)
        }
        
        list.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(listTitle.snp.bottom)
            // make.top.equalToSuperview().offset(10)
//            make.leading.equalToSuperview().offset(10)
//            make.trailing.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            make.height.equalTo(650)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(56)
        }
        
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
  
//            if linkObj.count != 0 {
//                listTitle.snp.makeConstraints { make in
//                    make.centerX.equalToSuperview()
//                    make.top.equalToSuperview().offset(56)
//                }
//
//                list.snp.makeConstraints { make in
//                    make.width.equalToSuperview()
//                    make.top.equalTo(listTitle.snp.bottom)
//                    // make.top.equalToSuperview().offset(10)
//                    make.leading.equalToSuperview().offset(10)
//                    make.trailing.equalToSuperview().offset(-10)
//                    make.height.equalTo(650)
//                }
//            } else {
//                titleLabel.snp.makeConstraints { make in
//                    make.centerX.equalTo(view.snp.centerX)
//                    make.top.equalTo(view.snp.top).offset(56)
//                }
//
//                view.addSubview(mainLabel)
//                mainLabel.snp.makeConstraints { make in
//                    make.centerX.equalTo(view.snp.centerX)
//                    make.centerY.equalTo(view.snp.centerY)
//                }
//            }
        
        
        addButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(58)
            make.bottom.equalTo(view.snp.bottom).offset(-50)
            make.left.equalTo(view.snp.left).offset(16)
        }
        // Do any additional setup after loading the view.
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  list.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
       // cell.configure(name: links[indexPath.row])
        cell.configure(name: linkObj[indexPath.row].name, link1: linkObj[indexPath.row].link)
        //cell.conf= links[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return linkObj.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row is selected")
        if let url = URL(string: linkObj[indexPath.row].link) {
             UIApplication.shared.open(url)
         }
    }
     
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func check(n: Int) {
        if n == 0 {
            titleLabel.isHidden = false
            mainLabel.isHidden = false
            listTitle.isHidden = true
            list.isHidden = true
        }
        else if n > 0 {
            titleLabel.isHidden = true
            mainLabel.isHidden = true
            list.isHidden = false
            listTitle.isHidden = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
