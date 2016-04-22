//
//  ViewController.swift
//  ConvertImageToGray
//
//  Created by 黄海燕 on 16/4/22.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "1.jpg")
        //调用灰度图转换方法，将图片转换为灰度图
        let grayedImage = self.grayImage(image!)

        let imageView = UIImageView(image: grayedImage)
        imageView.center = CGPointMake(190, 260)
        self.view.addSubview(imageView)
        
    }

    //创建一个方法，传递一个图像参数，实现将图像，转换为灰度图功能
    func grayImage(image:UIImage) -> UIImage {
        //获得源图像的尺寸属性
        let imageSize = image.size
        //获得源图像的宽度和高度数值
        let width = Int(imageSize.width)
        let height = Int(imageSize.height)
        //创建灰度色空间对象。各种设备对待颜色的方式都不同，颜色必须有一个相关的色彩空间。否则，图形上下文将不知道如何解释相关的颜色值
        let spaceRef:CGColorSpaceRef = CGColorSpaceCreateDeviceGray()!
        //参数1，指向要渲染的绘制内存的地方，参数2，3分别表示宽度和高度，参数4表示内存中像素的每个组件的位数，参数5 表示一行，在内存所占的比特数，参数6，表示上下文使用的颜色空间，参数7表示是否包含alpha通道
        let context:CGContextRef = CGBitmapContextCreate(nil, width, height, 8, 0, spaceRef, CGBitmapInfo.ByteOrderDefault.rawValue)!
        //创建一个和源图像相同尺寸的空间
        let rect = CGRectMake(0, 0, imageSize.width, imageSize.height)
        //在灰度上下文画入图片
        CGContextDrawImage(context, rect, image.CGImage)
        //从上下文中，获取并生成转为灰度的图片
        let grayImage = UIImage(CGImage: CGBitmapContextCreateImage(context)!)
        //返回灰度图片
        return grayImage
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

