//
//  CustomTableViewCell.swift
//  BookmarksUIKit
//
//  Created by Vasiliy Shannikov on 20.01.2022.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    private let customView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var linkButton: UIButton = {
        
        let btnImage = UIImage(named: "link")
        let button = UIButton()
        button.setImage(btnImage, for: .normal)
        button.addTarget(self, action: #selector(linkButtonDidPress), for: .touchUpInside)
        
        return button
    }()
    
    var link = ""
    

    
    @objc private func linkButtonDidPress() {
        print("link button is pressed")
        toLink()

    }
    
//    private var linkImage: UIImage = { () -> <#Result#> in
//        let image = UIImage(named: "link")
//        //let imageView = UIImageView(image: image)
//        return imageView
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setUI() {
        self.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(1)
            make.bottom.equalToSuperview().offset(-1)
            make.height.equalTo(60)
            
            customView.addSubview(nameLabel)
            nameLabel.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(12)
                make.centerY.equalToSuperview()
                
//                let image = UIImage(named: "link")
//                let imageLink = UIImageView(image: image)
                self.contentView.addSubview(linkButton)
                linkButton.snp.makeConstraints { make in
                    make.trailing.equalToSuperview().offset(-10)
                    make.width.equalTo(24)
                    make.height.equalTo(24)
                    //                    make.left.equalToSuperview().offset(-12)
                    make.centerY.equalToSuperview()
                }
            }
        }
    }
    
    func toLink() {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    func configure (name: String, link1: String) {
        nameLabel.text = name
        link = link1
    }

}
