class Rest {
	
	constructor(url){
		this.url = url;
	}
	
	//list가져오기	
	list(params, callback){
		$.get(this.url + '?' + params, callback);
	}
	
	//항목하나 얻기
	get(id, callback){
		$.get(this.url + '/' + id, callback);
	}
	
	//만들기
	create(data, callback){
		$.ajax({
			url : this.url,
			type :  'post',
			contentType : 'application/json',
			data : JSON.stringify(data),
			success : callback
		});
	}
	
	//update
	update(data, callback){
		//여기는 왜 리턴?
		return $.ajax({
			url : this.url,
			type : 'put',
			contentType : 'application/json',
			data : JSON.stringify(data),
			success : callback
		});
	}
	
	remove(id, callback) {
		return $.ajax({
			url : this.url,
			type : 'delete',
			success : callback
		})
	}
}