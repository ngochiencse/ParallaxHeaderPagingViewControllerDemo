//
//  ParchmentExampleViewController.swift
//  HPParallaxHeader_Example
//
//  Created by Hien Pham on 29/05/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import Parchment
import HPParallaxHeader

class ParchmentExampleViewController: UIViewController {

    @IBOutlet weak var pagingContainer: UIView!
    @IBOutlet weak var pagingContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: HPScrollView!
    var viewControllers: [TableViewController] = []
    var pagingViewController: PagingViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.parallaxHeader.load(nibName: "StarshipHeader", bundle: nil, options: [:]) // You can set the parallax header view from a nib.
        scrollView.parallaxHeader.height = 300
        scrollView.parallaxHeader.mode = .fill

        viewControllers = [
            TableViewController(count: 500),
            TableViewController(count: 1),
            TableViewController(count: 10),
            TableViewController(count: 20),
        ]
        for index in 0..<viewControllers.count {
            viewControllers[index].title = String(index)
        }

        let pagingViewController = PagingViewController(viewControllers: viewControllers)

        // Make sure you add the PagingViewController as a child view
        // controller and constrain it to the edges of the view.
        addChild(pagingViewController)
        pagingContainer.addSubview(pagingViewController.view)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pagingViewController.view.topAnchor.constraint(equalTo: pagingContainer.topAnchor).isActive = true
        pagingViewController.view.bottomAnchor.constraint(equalTo: pagingContainer.bottomAnchor).isActive = true
        pagingViewController.view.leftAnchor.constraint(equalTo: pagingContainer.leftAnchor).isActive = true
        pagingViewController.view.rightAnchor.constraint(equalTo: pagingContainer.rightAnchor).isActive = true
        pagingViewController.didMove(toParent: self)
        
        self.pagingViewController = pagingViewController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.parallaxHeader.minimumHeight = view.safeAreaInsets.top
        pagingContainerHeightConstraint.constant = -(scrollView.parallaxHeader.minimumHeight)
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
