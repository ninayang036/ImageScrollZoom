//
//  randomViewController.swift
//  ImageScrollZoom
//
//  Created by Yang Nina on 2021/5/4.
//

import UIKit

class randomViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet var imageviews: [UIImageView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIUpdate()
    }
    @IBAction func pageChange(_ sender: UIPageControl) {
        let point = CGPoint(x: scrollview.bounds.width*CGFloat(sender.currentPage), y: 0)
        scrollview.setContentOffset(point, animated: true)
    }
    @objc func UIUpdate(){
        for imageView in imageviews {
            //隨機圖片網址
            let str = "https://picsum.photos/455/774"
            if let url = URL(string: str){
                URLSession.shared.dataTask(with: url){ (data , response ,error) in
                    if let date = data,
                       let image = UIImage(data: date){
                           DispatchQueue.main.async {
                           imageView.image = image
                         }
                    }
                }.resume()
            }
        }
    }
}
extension randomViewController:UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.bounds.width
        pagecontrol.currentPage = Int(page)
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for pageview in scrollview.subviews{
            if pageview.isKind(of: UIView.self){
                return pageview
            }
        }
        return nil
    }
}
