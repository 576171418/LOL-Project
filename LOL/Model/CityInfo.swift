//
//	CityInfo.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct CityInfo{

	var city : String!
	var cityId : String!
	var parent : String!
	var updateTime : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		city = dictionary["city"] as? String
		cityId = dictionary["cityId"] as? String
		parent = dictionary["parent"] as? String
		updateTime = dictionary["updateTime"] as? String
	}

}
