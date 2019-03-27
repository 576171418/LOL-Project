//
//	Forecast.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Forecast{

	var aqi : Float!
	var date : String!
	var fl : String!
	var fx : String!
	var high : String!
	var low : String!
	var notice : String!
	var sunrise : String!
	var sunset : String!
	var type : String!
	var week : String!
	var ymd : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		aqi = dictionary["aqi"] as? Float
		date = dictionary["date"] as? String
		fl = dictionary["fl"] as? String
		fx = dictionary["fx"] as? String
		high = dictionary["high"] as? String
		low = dictionary["low"] as? String
		notice = dictionary["notice"] as? String
		sunrise = dictionary["sunrise"] as? String
		sunset = dictionary["sunset"] as? String
		type = dictionary["type"] as? String
		week = dictionary["week"] as? String
		ymd = dictionary["ymd"] as? String
	}

}