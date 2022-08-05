//
//  ImageViewController.swift
//  Multithreading
//
//  Created by M1 on 04.08.2022.
//

import UIKit

class ImageViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCurrentImage()
    }
    
    private func stopAnimatedIndecatorFirst() {
        DispatchQueue.main.async { [weak self] in
            self?.ibActivityIndicatorFirst.stopAnimating()
            return
        }
    }
    
    private func stopAnimatedIndecatorSecond() {
        DispatchQueue.main.async { [weak self] in
            self?.ibActivityIndicatorSecond.stopAnimating()
            return
        }
    }
    
    private func stopAnimatedIndecatorThird() {
        DispatchQueue.main.async { [weak self] in
            self?.ibActivityIndicatorThird.stopAnimating()
            return
        }
    }

    @IBAction func refreshPressed(_ sender: Any) {
        imageIndex = (imageIndex + 1) % imageArrayFirst.count
        loadCurrentImage()
    }
    
    private func loadCurrentImage() {
        loadImageFirst(by: imageIndex)
        loadImageSecond(by: imageIndex)
        loadImageThird(by: imageIndex)
    }
    
    private func loadImageFirst(by index: Int) {
        guard index >= 0, index < imageArrayFirst.count else { return }
        let imageStringUrl = imageArrayFirst[index]
        guard let url = URL(string: imageStringUrl) else { return }
        ibActivityIndicatorFirst.startAnimating()
        DispatchQueue.global().async { [weak self]  in
        guard let imageData = try? Data(contentsOf: url) else {
            self?.stopAnimatedIndecatorFirst()
            return
        }
        let loadImage = UIImage(data: imageData)
            DispatchQueue.main.async {
                self?.ibImageViewFirst.image = loadImage
                self?.stopAnimatedIndecatorFirst()
            }
        }
    }
    private func loadImageSecond(by index: Int) {
        guard index >= 0, index < imageArraySecond.count else { return }
        let imageStringUrl = imageArraySecond[index]
        guard let url = URL(string: imageStringUrl) else { return }
        ibActivityIndicatorSecond.startAnimating()
        DispatchQueue.global().async { [weak self]  in
        guard let imageData = try? Data(contentsOf: url) else {
            self?.stopAnimatedIndecatorSecond()
            return
        }
        let loadImage = UIImage(data: imageData)
            DispatchQueue.main.async {
                self?.ibImageSecond.image = loadImage
                self?.stopAnimatedIndecatorSecond()
            }
        }
    }
    private func loadImageThird(by index: Int) {
        guard index >= 0, index < imageArrayThird.count else { return }
        let imageStringUrl = imageArrayThird[index]
        guard let url = URL(string: imageStringUrl) else { return }
        ibActivityIndicatorThird.startAnimating()
        DispatchQueue.global().async { [weak self]  in
        guard let imageData = try? Data(contentsOf: url) else {
            self?.stopAnimatedIndecatorThird()
            return
        }
        let loadImage = UIImage(data: imageData)
            DispatchQueue.main.async {
                self?.ibImageThird.image = loadImage
                self?.stopAnimatedIndecatorThird()
            }
        }
    }
}
