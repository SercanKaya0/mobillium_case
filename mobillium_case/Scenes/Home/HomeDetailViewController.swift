//
//  HomeDetailViewController.swift
//  mobillium_case
//
//  Created by Sercan KAYA on 13.01.2022.
//

import UIKit

final class HomeDetailViewController: BaseViewController<HomeDetailViewModel> {
     private let imageView : UIImageView = {
           let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
    }()
    private let imdbLogo : UIImageView = {
          let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "imdb_logo")
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
   }()
    private let starIconImage : UIImageView = {
          let starIconImage = UIImageView()
        starIconImage.contentMode = .scaleAspectFit
        starIconImage.image = UIImage(named: "rate_icon")
        starIconImage.translatesAutoresizingMaskIntoConstraints = false
           return starIconImage
   }()
    private let titleLabel : UILabel = {
          let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
           return label
   }()
    private let descriptionLabel : UILabel = {
          let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
           return label
   }()
    private let rateLabel : UILabel = {
          let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
           return label
   }()
    private let dotImageView : UIImageView = {
        let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFit
      imageView.image = UIImage(systemName: "circle.fill")
        imageView.tintColor = .red
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
   }()
    private let rateCountLabel : UILabel = {
          let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
           return label
   }()

    private let dateLabel : UILabel = {
          let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
           return label
   }()
 
    private let navigationBar : UINavigationBar = {
        let navBar = UINavigationBar()
        let navigationItem =  UINavigationItem()
        let button = UIBarButtonItem()
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        standardAppearance.backgroundColor = .white
        navigationItem.standardAppearance = standardAppearance
        navigationItem.scrollEdgeAppearance = standardAppearance
        navigationItem.compactAppearance = standardAppearance
        
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black,.font : UIFont.systemFont(ofSize: 17, weight: .bold)]
        button.tintColor = .black
        navigationItem.standardAppearance?.buttonAppearance = buttonAppearance
        navigationItem.compactAppearance?.buttonAppearance = buttonAppearance
        
        button.image = UIImage(named: "arrow_left_icon")
        button.action = #selector(goBack)
        
        
        navigationItem.title = navBar.topItem?.title
        navigationItem.leftBarButtonItem = button
        navBar.setItems([navigationItem], animated: false)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    

  
   @objc func goBack(){
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configrueContent()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getMovieDetail()

    }
}



extension HomeDetailViewController {
    private func fillData(){
        self.imageView.kf.setImage(with: URL(string:"https://image.tmdb.org/t/p/original" + (viewModel.image ?? "")))
        self.dateLabel.text = viewModel.date
        navigationBar.topItem?.title = viewModel.title
        self.rateLabel.text = "\(viewModel.rate ?? 0)"
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.subTitle
        self.rateCountLabel.text = "/ 10"
        

    }
    
    private func configrueContent(){
        self.viewModel.reloadDetailData = { [weak self] in
            guard let self = self else { return }
            self.fillData()
        }
        
    }
    
    
    private func addSubViews(){
        addNavigationBar()
        addImageView()
        addImdbLogo()
        addStarIcon()
        addRateLabel()
        addRateCountLabel()
        addDotImageView()
        addDateLabel()
        addTitleLabel()
        addDescriptionLabel()
    }
    
    private func addImageView(){
        self.view.addSubview(imageView)
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor,constant: 16),
            self.imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 256)
        ])
    }
 
    private func addTitleLabel(){
        self.view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: imdbLogo.bottomAnchor,constant: 19),
            self.titleLabel.leadingAnchor.constraint(equalTo: imdbLogo.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    private func addDescriptionLabel(){
        self.view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ])
    }
    private func addRateCountLabel(){
        self.view.addSubview(rateCountLabel)
        NSLayoutConstraint.activate([
            self.rateCountLabel.topAnchor.constraint(equalTo: rateLabel.topAnchor),
          self.rateCountLabel.leadingAnchor.constraint(equalTo: rateLabel.trailingAnchor,constant: 3),
        
        ])
    }
    private func addRateLabel(){
        self.view.addSubview(rateLabel)
        NSLayoutConstraint.activate([
            self.rateLabel.topAnchor.constraint(equalTo: starIconImage.topAnchor),
            self.rateLabel.leadingAnchor.constraint(equalTo: starIconImage.trailingAnchor,constant: 8),
        ])
    }
    private func addDateLabel(){
        self.view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            self.dateLabel.topAnchor.constraint(equalTo: rateCountLabel.topAnchor),
          self.dateLabel.leadingAnchor.constraint(equalTo: dotImageView.trailingAnchor,constant: 16),
        ])
    }
    private func addDotImageView(){
        self.view.addSubview(dotImageView)
        NSLayoutConstraint.activate([
            self.dotImageView.leadingAnchor.constraint(equalTo: rateCountLabel.trailingAnchor,constant: 16),
                        self.dotImageView.centerYAnchor.constraint(equalTo: rateCountLabel.centerYAnchor),
                        self.dotImageView.widthAnchor.constraint(equalToConstant: 4)

        ])
    }
    private func addImdbLogo(){
        view.addSubview(imdbLogo)
        NSLayoutConstraint.activate([
            self.imdbLogo.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 16),
            self.imdbLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            self.imdbLogo.widthAnchor.constraint(equalToConstant: 49)
        ])
    }
    private func addStarIcon(){
        self.view.addSubview(starIconImage)
        NSLayoutConstraint.activate([
            self.starIconImage.topAnchor.constraint(equalTo: imdbLogo.topAnchor,constant: 4),
            self.starIconImage.leadingAnchor.constraint(equalTo: imdbLogo.trailingAnchor,constant: 8),
            self.starIconImage.widthAnchor.constraint(equalToConstant: 16),
            self.starIconImage.heightAnchor.constraint(equalToConstant: 16)

        ])
        
    }
 
    
 
    private func addNavigationBar(){
        self.view.addSubview(navigationBar)
        NSLayoutConstraint.activate([
            self.navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),


            
        ])
    }
}


