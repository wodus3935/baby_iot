class FlickrApi {
	//생성자
	constructor(){
		//url상에 jsoncallback=? 이 있으면 jsonp로 얻겠다!
		 this.url = 'http://api.flickr.com/services/rest/?jsoncallback=?';
		 this.api_key = '7841b5086e3ea07c0a1cfb9a0f4ee455';
		 this.format = 'json';
	}
	
	//프로토 타입메서드를 만들자! (인스턴스 메서드는 생성자안에서 this.메서드명()으로 배정함)
	getRecent(parse) {
		//함수가 전될 되었다면 parse가 전달되고 없으면 현재 parse로
		parse = parse || this.parse;
		
		var param = {
			api_key : this.api_key,
			//최근에 가져온 파일들
			method : 'flickr.photos.getRecent',
			//한페이지에 20
			per_page : 20,
			format : this.format
		};
		
		//url param, parse메서드(콜백)-> 따로 정의해주자
		$.getJSON(this.url, param, parse);
	}
	
	search(keyword){
		var param = {
			api_key : this.api_key,
			method : 'flickr.photos.search',
			// text : keyword,
			tags : keyword,
			content_type : 1,
			safe_search : 1,
			sort : 'interestingness-desc',
			per_page : 5,
			per_page : 20,
			format : this.format
		};
		$.getJSON(this.url, param, this.parse);
	}

   parse(data) {
	   $('#panel').empty();
	   
	   $(data.photos.photo).each(function(i, photo){
	      // 작은 이미지
	      var img =`http://farm${photo.farm}.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}.jpg`; 
	      console.log(img);
	      
	      // 이미지 정보 페이지 
	      var img_info =`http://www.flickr.com/photos/${photo.owner}/${photo.id}/in/photostream`; 
		  console.log(img_info);
	      
	      //target="_blank"는 새창으로 띄워라 라는 뜻
	      var templ =
	    	  `<div class="col-md-3 mb-2">
		    	  <a href = "${img_info} target="_blank">
		    	  	<div class="view zoom">
		    	  		<img src = "${img}" width="200" class="z-depth-5 rounded">
		    	  		<div class=""mask flex-center">
		    	  			<p class="white-text">Zoom effect</p>
		    	  		</div>
		    	  	</div>
		    	  </a>	    	 	
	    	  </div>
	    	`;
	      
	      $(templ).appendTo("#panel");
      });
   }
}