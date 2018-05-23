//date 객체 날짜 출력 문자열 proto type 메서드 정의
Date.prototype.toString = function() {
	//연 구하기
	var year = this.getFullYear();
	//월 구하기
	var month = this.getMonth() +1;
	month = month < 10 ? '0' + month : month;
	var date = this.getDate();
	//10 이하면 0 붙여줘~
	date = date< 10 ?  '0' + date : date;
	return year + '-' + month + '-' + date;
}

Date.prototype.toDatetime = function() {
	var hour = this.getHours();
	hour = hour<10 ? '0' + hour : hour;
	var minute = this.getMinutes();
	minute = minute<10 ? '0' + minute : minute;
	var second = this.getSeconds();
	second = second < 10 ? '0' + second : second;
	
	return this.toString() + ' ' + hour + ' : ' + minute + ' : ' + second;
}