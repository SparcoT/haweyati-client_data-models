import 'package:haweyati_client_data_models/services/hyerptrack_service.dart';

class Trip {
	String tripId;
	String deviceId;
	String startedAt;
	String completedAt;
	String status;
	Views views;
	DeviceInfo deviceInfo;
	Destination destination;
	List<TripOrder> orders;
	// Null summary;

	Trip({this.tripId, this.deviceId, this.startedAt, this.completedAt, this.status, this.views,
		this.deviceInfo,
		this.destination,
		this.orders,
		// this.summary,
	});

	Trip.fromJson(Map<String, dynamic> json) {
		tripId = json['trip_id'];
		deviceId = json['device_id'];
		startedAt = json['started_at'];
		completedAt = json['completed_at'];
		status = json['status'];
		views = json['views'] != null ? new Views.fromJson(json['views']) : null;
		deviceInfo = json['device_info'] != null ? new DeviceInfo.fromJson(json['device_info']) : null;
		destination = json['destination'] != null ? new Destination.fromJson(json['destination']) : null;
		orders = (json['orders'] as List)
				?.map((i) => TripOrder.fromJson(i))
				?.toList();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['trip_id'] = this.tripId;
		data['device_id'] = this.deviceId;
		data['started_at'] = this.startedAt;
		data['completed_at'] = this.completedAt;
		data['status'] = this.status;
		if (this.views != null) {
      data['views'] = this.views.toJson();
    }
		if (this.deviceInfo != null) {
      data['device_info'] = this.deviceInfo.toJson();
    }
		if (this.orders != null) {
      data['orders'] = this.orders.map((e) => e.toJson()).toList();
    }
		// data['summary'] = this.summary;
		return data;
	}
}

class Views {
	String embedUrl;
	String shareUrl;

	Views({this.embedUrl, this.shareUrl});

	Views.fromJson(Map<String, dynamic> json) {
		embedUrl = json['embed_url'];
		shareUrl = json['share_url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['embed_url'] = this.embedUrl;
		data['share_url'] = this.shareUrl;
		return data;
	}
}

class DeviceInfo {
	String osVersion;
	String sdkVersion;
	String osName;

	DeviceInfo({this.osVersion, this.sdkVersion, this.osName});

	DeviceInfo.fromJson(Map<String, dynamic> json) {
		osVersion = json['os_version'];
		sdkVersion = json['sdk_version'];
		osName = json['os_name'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['os_version'] = this.osVersion;
		data['sdk_version'] = this.sdkVersion;
		data['os_name'] = this.osName;
		return data;
	}
}

class Destination {
	// Geometry geometry;
	// int radius;
	// String scheduledAt;
	String arrivedAt;

	Destination({this.arrivedAt,
		// this.radius, this.scheduledAt, this.address
	});

	Destination.fromJson(Map<String, dynamic> json) {
		// geometry = json['geometry'] != null ? new Geometry.fromJson(json['geometry']) : null;
		// radius = json['radius'];
		arrivedAt = json['arrived_at'];
		// address = json['address'];
	}

	// Map<String, dynamic> toJson() {
	// 	final Map<String, dynamic> data = new Map<String, dynamic>();
	// 	if (this.geometry != null) {
  //     data['geometry'] = this.geometry.toJson();
  //   }
	// 	data['radius'] = this.radius;
	// 	data['scheduled_at'] = this.scheduledAt;
	// 	data['address'] = this.address;
	// 	return data;
	// }
}

class Geometry {
	String type;
	List<double> coordinates;

	Geometry({this.type, this.coordinates});

	Geometry.fromJson(Map<String, dynamic> json) {
		type = json['type'];
		coordinates = json['coordinates'].cast<double>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['type'] = this.type;
		data['coordinates'] = this.coordinates;
		return data;
	}
}
