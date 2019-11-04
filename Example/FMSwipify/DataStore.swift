//
//  File.swift
//  FMSwipify_Example
//
//  Created by Franck-Stephane Ndame Mpouli on 15/09/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit


struct DataStore {
    static let store = DataStore()
    
    let icons = [#imageLiteral(resourceName: "home"),#imageLiteral(resourceName: "trending"),#imageLiteral(resourceName: "subscriptions"),#imageLiteral(resourceName: "account")]
    let posts = [
        
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        
        
        
        [],
        
        
        [Post(preview: "p7", acountImageStr: "cov5", title: "Neural Networks", subTitle: "3 Red 1 Green • 214k views • 6 days ago"),
         Post(preview: "p8", acountImageStr: "cov5", title: "Backpropagation Explained", subTitle: "3 Red 1 Green • 214k views • 12 hours ago"),
         Post(preview: "p3", acountImageStr: "p1", title: "Why we need to start caring for our environment", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago")],
        
        
        
        [Post(preview: "p9", acountImageStr: "cov2", title: "The Side Effects of Vaccines - How High is the Risk?", subTitle: "Kurzgezagt • 678k views • 3 weeks ago")]
        
    ]
    
    
    let twtrposts = [
        
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        
        
        [Post(preview: "p7", acountImageStr: "cov5", title: "Neural Networks", subTitle: "3 Red 1 Green • 214k views • 6 days ago"),
         Post(preview: "p8", acountImageStr: "cov5", title: "Backpropagation Explained", subTitle: "3 Red 1 Green • 214k views • 12 hours ago"),
         Post(preview: "p3", acountImageStr: "p1", title: "Why we need to start caring for our environment", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago")]
        
    ]
    
    
    
    
    
    let ptrstposts = [
        
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        [Post(preview: "p5", acountImageStr: "cov4", title: "Tayo Yusuff - Shooting Producer / Director at VICE Media Interviews Donald Glover", subTitle: "Noisey • 1.6M views • 14 hours ago"),Post(preview: "p1", acountImageStr: "cov2", title: "How to Cure Aging – During Your Lifetime?", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago"),
         Post(preview: "p3", acountImageStr: "cov3", title: "Elon Musk's Insane Schedule", subTitle: "Dummy • 432k views • 2 weeks ago"),
         Post(preview: "p2", acountImageStr: "cov", title: "Rick And Morty: Season 4 Trailer", subTitle: "Kurzgezagt • 7.6M views • 2 days ago")],
        
        
        [Post(preview: "p7", acountImageStr: "cov5", title: "Neural Networks", subTitle: "3 Red 1 Green • 214k views • 6 days ago"),
         Post(preview: "p8", acountImageStr: "cov5", title: "Backpropagation Explained", subTitle: "3 Red 1 Green • 214k views • 12 hours ago"),
         Post(preview: "p3", acountImageStr: "p1", title: "Why we need to start caring for our environment", subTitle: "Kurzgezagt • 1.6M views • 14 hours ago")]
        
    ]
    
    let emptyposts: [[Post]] = [[],[],[]]
    
}
