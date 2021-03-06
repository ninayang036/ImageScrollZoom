//
//  ViewController.swift
//  ImageScrollZoom
//
//  Created by Yang Nina on 2021/5/4.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        let point = CGPoint(x: scrollview.bounds.width*CGFloat(sender.currentPage), y: 0)
        scrollview.setContentOffset(point, animated: true)
    }
}
extension ViewController:UIScrollViewDelegate{
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

