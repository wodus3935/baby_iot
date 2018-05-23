var galleryTempl = {
		
		tableTempl : 
			`
				<table>
					<tbody>
					</tbody>
				</table>
			`
		,

		listTempl : function(image){
		return `			
						
					<tr>
						<td>
							<a href="image/${image.imageId}" data-lightbox="roadtrip">
								<img src="thumb/${image.imageId}" width="100" alt="${image.title}" class="z-depth-2 rounded">
							</a>
						</td>
						<td>
							<p>		
								<a href="download/${image.imageId}">${image.fileName}</a>
							</p>
						</td>
					</tr>	
				`
	}
}

$.fn.gallery=function(opt){
		var self = this;
		var api = new Rest(opt.url);
		
		console.log(this);
		
		self.append(galleryTempl.tableTempl);
		
		api.list('', function(images){
			
			images.forEach(function(image){
				var tr = galleryTempl.listTempl(image);
				self.find('tbody').append(tr);
			})
		});
		
		
}