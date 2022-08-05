//
//  NewViewController.swift
//  Multithreading
//
//  Created by M1 on 05.08.2022.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet private var ibImageViewFirst: UIImageView!
    @IBOutlet private weak var ibActivityIndicatorFirst: UIActivityIndicatorView!
    @IBOutlet private var ibImageSecond: UIImageView!
    @IBOutlet private weak var ibActivityIndicatorSecond: UIActivityIndicatorView!
    @IBOutlet private var ibImageThird: UIImageView!
    @IBOutlet private weak var ibActivityIndicatorThird: UIActivityIndicatorView!
    
    private let imageArrayFirst = [
        "https://mobimg.b-cdn.net/v3/fetch/88/88f6407ee6093f84e0b3f93fe10bf1d8.jpeg?h=900&r=0.5",
        "https://mobimg.b-cdn.net/v3/fetch/8d/8dca316b3df500fe52c9f45834047f6a.jpeg?h=1200&r=0.5",
        "https://mobimg.b-cdn.net/v3/fetch/a5/a57b53b3f20aa8cfe95c33606891dfe5.jpeg?h=1200&r=0.5",
        "https://mobimg.b-cdn.net/v3/fetch/fe/fed6a9e82518f30f076d8ff037cc1ad6.jpeg?h=900&r=0.5"
    ]
    
    private let imageArraySecond = [
        "https://mobimg.b-cdn.net/v3/fetch/88/88f6407ee6093f84e0b3f93fe10bf1d8.jpeg?h=900&r=0.5",
        "https://mobimg.b-cdn.net/v3/fetch/8d/8dca316b3df500fe52c9f45834047f6a.jpeg?h=1200&r=0.5",
        "https://mobimg.b-cdn.net/v3/fetch/a5/a57b53b3f20aa8cfe95c33606891dfe5.jpeg?h=1200&r=0.5",
        "https://mobimg.b-cdn.net/v3/fetch/fe/fed6a9e82518f30f076d8ff037cc1ad6.jpeg?h=900&r=0.5"
    ]
    
    private let imageArrayThird = [
        "https://mobimg.b-cdn.net/v3/fetch/88/88f6407ee6093f84e0b3f93fe10bf1d8.jpeg?h=900&r=0.5",
        "https://mobimg.b-cdn.net/v3/fetch/8d/8dca316b3df500fe52c9f45834047f6a.jpeg?h=1200&r=0.5",
        "https://mobimg.b-cdn.net/v3/fetch/a5/a57b53b3f20aa8cfe95c33606891dfe5.jpeg?h=1200&r=0.5",
        "https://mobimg.b-cdn.net/v3/fetch/fe/fed6a9e82518f30f076d8ff037cc1ad6.jpeg?h=900&r=0.5"
    ]
    
    private var imageIndex = 0
    
    enum ImageScreen {
        case first
        case second
        case third
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCurrentImage()
    }
    
    @IBAction func refreshPressed(_ sender: Any) {
        imageIndex = (imageIndex + 1) % imageArrayFirst.count
        loadCurrentImage()
    }
    
    private func loadCurrentImage() {
        loadImage(by: imageIndex, for: .first)
        loadImage(by: imageIndex, for: .second)
        loadImage(by: imageIndex, for: .third)
    }
    
    private func loadImage(by index: Int, for type: ImageScreen) {
        switch type {
        case .first:
            guard index >= 0, index < imageArrayFirst.count else { return }
            let imageStringUrl = imageArrayFirst[index]
            guard let url = URL(string: imageStringUrl) else { return }
            startIndicator(for: type)
            DispatchQueue.global().async { [weak self]  in
                guard let imageData = try? Data(contentsOf: url) else { return }
                let loadImage = UIImage(data: imageData)
                    DispatchQueue.main.async { self?.ibImageViewFirst.image = loadImage }
            }
        case .second:
            guard index >= 0, index < imageArraySecond.count else { return }
            let imageStringUrl = imageArraySecond[index]
            guard let url = URL(string: imageStringUrl) else { return }
            startIndicator(for: type)
            DispatchQueue.global().async { [weak self]  in
                guard let imageData = try? Data(contentsOf: url) else { return }
                let loadImage = UIImage(data: imageData)
                    DispatchQueue.main.async { self?.ibImageSecond.image = loadImage }
            }
        case .third:
            guard index >= 0, index < imageArrayThird.count else { return }
            let imageStringUrl = imageArrayThird[index]
            guard let url = URL(string: imageStringUrl) else { return }
            startIndicator(for: type)
            DispatchQueue.global().async { [weak self]  in
                guard let imageData = try? Data(contentsOf: url) else { return }
                let loadImage = UIImage(data: imageData)
                    DispatchQueue.main.async { self?.ibImageThird.image = loadImage }
            }
        }
        stopIndicator(for: type)
    }
    func stopIndicator(for type: ImageScreen) {
        DispatchQueue.main.async { [weak self] in
            switch type {
            case .first:
                self?.ibActivityIndicatorFirst.stopAnimating()
                return
            case .second:
                self?.ibActivityIndicatorSecond.stopAnimating()
                return
            case .third:
                self?.ibActivityIndicatorThird.stopAnimating()
                return
            }
        }
        
    }
    
    func startIndicator(for type: ImageScreen) {
        DispatchQueue.main.async { [weak self] in
        switch type {
        case .first:
            self?.ibActivityIndicatorFirst.startAnimating()
            return
        case .second:
            self?.ibActivityIndicatorSecond.startAnimating()
            return
        case .third:
            self?.ibActivityIndicatorThird.startAnimating()
            return
        }
        }
    }
}
