//
//	Weahter.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Weahter{

	var cityInfo : CityInfo!
	var data : Data!
	var date : String!
	var message : String!
	var status : Int!
	var time : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let cityInfoData = dictionary["cityInfo"] as? NSDictionary{
				cityInfo = CityInfo(fromDictionary: cityInfoData)
			}
		if let dataData = dictionary["data"] as? NSDictionary{
				data = Data(fromDictionary: dataData)
			}
		date = dictionary["date"] as? String
		message = dictionary["message"] as? String
		status = dictionary["status"] as? Int
		time = dictionary["time"] as? String
	}

}