//
//  FirstBookmark.swift
//  BookmarksUIKit
//
//  Created by Vasiliy Shannikov on 20.01.2022.
//

import UIKit
import SnapKit

class FirstBookmark: UIViewController {
    
 
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
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
       
        return button
    }()
    @objc private func addButtonDidPress() {
        print("Button was pressed!")
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
       self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(56)
        }
        
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }

        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(58)
            make.bottom.equalToSuperview().offset(-50)
           // make.left.equalTo(view.snp.left).offset(16)
            make.width.equalTo(300)
        }
        
        addButton.addTarget(self, action: #selector(addButtonDidPress), for: .touchUpInside)
       // addButton.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
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
