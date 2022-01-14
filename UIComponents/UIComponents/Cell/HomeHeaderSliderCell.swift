//
//  HomeHeaderSliderCell.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 12.01.2022.
//

import UIKit
import Kingfisher
public class HomeHeaderSliderCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: HomeHeaderSliderCellProtocol?
    static let homeSliderCellID = "HomeSliderCellID"
    

    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
    
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageView : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let blackView : UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.50)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    private let stackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = -50
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configureContents()
        
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.subtitleLabel.text = nil
        self.imageView.image = nil
        self.subtitleLabel.text = nil
        self.titleLabel.text = nil
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview()
        configureContents()
    }
    
    private func configureContents() {
        self.titleLabel.text = viewModel?.title
        self.subtitleLabel.text = viewModel?.subTitle
        self.imageView.kf.setImage(with: viewModel?.image)
             
    }
    
    public func set(viewModel: HomeHeaderSliderCellProtocol) {
        self.viewModel = viewModel
        
        
        
        
        configureContents()
        
    }
    
}


extension HomeHeaderSliderCell {
    private func addSubview(){
        addImageView()
        addBlackView()
        addStackView()
        
    }
    
    
    private func addStackView(){
        self.contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 100),
            self.stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            self.stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -30),
        ])
        self.stackView.addArrangedSubview(titleLabel)
        self.stackView.addArrangedSubview(subtitleLabel)

    }
    private func addTitleLabel(){
        self.contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            self.titleLabel.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            self.titleLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor),
                    ])
        
    }
    private func addImageView(){
        self.contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            self.imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
        
    }
    private func addSubtitleView(){
        self.contentView.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            self.subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            self.subtitleLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            self.subtitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            self.subtitleLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor,constant: 130),
        ])
    }

    private func addBlackView(){
        self.contentView.addSubview(blackView)
        NSLayoutConstraint.activate([
            self.blackView.topAnchor.constraint(equalTo: imageView.topAnchor),
            self.blackView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            self.blackView.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            self.blackView.rightAnchor.constraint(equalTo: imageView.rightAnchor),
        ])
    }

}
