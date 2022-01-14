//
//  HomeBodyCell.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 12.01.2022.
//

import UIKit

public class HomeBodyCell: UICollectionViewCell, ReusableView {
    
     weak var viewModel: HomeBodyCellProtocol?
    static public let cellID = "homeBodyCell"
    

    private let subtitleStackView : UIStackView = {
        let stackView = UIStackView()
         stackView.axis = .horizontal
        stackView.alignment = .center
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
    }()
    
    private let dividerLabel : UIView = {
        let divider = UIView()
        divider.layer.borderWidth = 1
        divider.layer.borderColor = UIColor.gray.cgColor.copy(alpha: 0.3)
        divider.translatesAutoresizingMaskIntoConstraints = false
         return divider
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 2

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let detailImage : UIImageView = {
        let detailImage = UIImageView()
        detailImage.image = UIImage(named: "arrow_right_icon")
        detailImage.tintColor = .gray
        
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        return detailImage
    }()
    private let dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageView : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configureContents()
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview()
        configureContents()
    }
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.subtitleLabel.text = nil
        self.titleLabel.text = nil
        self.imageView.image = nil
        self.dateLabel.text = nil
    }
    
    private func configureContents() {
        self.imageView.kf.setImage(with: viewModel?.image)
        self.titleLabel.text = viewModel?.title
        self.subtitleLabel.text = viewModel?.subTitle
        self.dateLabel.text = viewModel?.dateLabel
    }
    
    public func set(viewModel: HomeBodyCellProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
}

extension HomeBodyCell {
    private func addSubview(){
        addImageView()
        addTitleLabel()
        addSubtitle()
        addDetailImage()
       addSubtitleStackView()
       addDateLabel()
        addDivider()
    }
    
    private func addImageView(){
        self.contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                          constant: 8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            imageView.widthAnchor.constraint(equalToConstant: 104),
        ])
    }
    
    private func addTitleLabel(){
        self.contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor,constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor,constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -44),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    private func addSubtitle(){
        self.contentView.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8),
            subtitleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor,constant: 8),
        ])
    }
    private func addDetailImage(){
        self.contentView.addSubview(detailImage)
        NSLayoutConstraint.activate([
            detailImage.widthAnchor.constraint(equalToConstant: 12),
            detailImage.heightAnchor.constraint(equalToConstant: 12),
        ])
        
    }
    private func addDateLabel(){
        self.contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: subtitleStackView.bottomAnchor,constant: 8),
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -19),
        ])
    }
    
    private func addSubtitleStackView(){
        self.contentView.addSubview(subtitleStackView)
        NSLayoutConstraint.activate([
            subtitleStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8),
            subtitleStackView.leftAnchor.constraint(equalTo: imageView.rightAnchor),
            subtitleStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -19),
            subtitleStackView.heightAnchor.constraint(equalToConstant: 36)

        ])
        self.subtitleStackView.addArrangedSubview(subtitleLabel)
        self.subtitleStackView.addArrangedSubview(detailImage)
    }
    private func addDivider(){
        self.contentView.addSubview(dividerLabel)
        NSLayoutConstraint.activate([
            dividerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 8),
            dividerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dividerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dividerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
            dividerLabel.heightAnchor.constraint(equalToConstant: 1)

        ])
    
    }
    
}



/*
 
 private let horizontalStackView : UIStackView = {
     let stackView = UIStackView()
      stackView.axis = .horizontal
      
      stackView.distribution = .fillEqually
      stackView.alignment = .leading
      stackView.translatesAutoresizingMaskIntoConstraints = false
      return stackView
 }()
 private let verticalStackView : UIStackView = {
     let stackView = UIStackView()
      stackView.axis = .vertical
      
      
     stackView.distribution = .fillEqually
      stackView.translatesAutoresizingMaskIntoConstraints = false
      return stackView
 }()
 */
