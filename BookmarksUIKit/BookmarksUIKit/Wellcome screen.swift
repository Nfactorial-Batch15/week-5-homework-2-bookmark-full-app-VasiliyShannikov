//
//  Wellcome screen.swift
//  BookmarksUIKit
//
//  Created by Vasiliy Shannikov on 18.01.2022.
//

import Foundation
import UIKit
import SnapKit

class WelcomeScreen: UIViewController {
    let vc  = LinkList()
    
    @objc private func buttonDidPress() {
        print("Button was pressed!")
        UserDefaults.standard.set(true, forKey: "firstLaunch")
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true, completion: {
            print("FirstBookmark finished presenting!")
           
        })
    }
    
    lazy var bgImage: UIImageView = {
         let image = UIImage(named:  "image 8")
         let imageView = UIImageView(image: image)
         return imageView
     }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
      //  print(#function)
        
//        let imageName = "image 8"
//        let image = UIImage(named: imageName)
//        let imageView = UIImageView(image: image)
//       // imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bgImage)
        
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Save all interesting links in one app"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)//label.font.withSize(36)
        label.lineBreakMode = .byTruncatingTail
        
        view.addSubview(label)
        
        let rectangle: UIView = UIView()
        rectangle.backgroundColor = .white
        rectangle.layer.cornerRadius = 16
        rectangle.isUserInteractionEnabled = true
        view.addSubview(rectangle)
        
        lazy var button: UIButton = {
            let button = UIButton()
            button.setTitle("Let’s start collecting", for: .normal)
            button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
            button.setTitleColor(.black, for: .normal)
            return button
        }()
         
        rectangle.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerY.equalTo(rectangle.snp.centerY)
            make.centerX.equalTo(rectangle.snp.centerX)
        }
      
        bgImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(bgImage.snp.bottom).offset(16)
            make.width.equalTo(358)
            make.height.equalTo(92)
            make.centerX.equalTo(bgImage.snp.centerX)
        }
        
      
        
        rectangle.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(24)
            make.width.equalTo(358)
            make.height.equalTo(58)
            make.centerX.equalTo(view.snp.centerX)
        }
        
    }
    
    override func loadView() {
        print(#function)
        let blueView = UIView()
        blueView.backgroundColor = .black
        
        view = blueView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
}
