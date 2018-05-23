package edu.iot.butter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.iot.butter.model.Image;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.service.ImageService;

@RestController
@RequestMapping("/api/gallery")
public class GalleryApiController {

		@Autowired
		ImageService service;
		
		@RequestMapping(method=RequestMethod.GET)
		public List<Image> list(@RequestParam(value="page",defaultValue="1") int page) throws Exception{
				Pagination pagination = service.getPagination(page);
				
				return service.getList(pagination);				
		}
		
		@RequestMapping(value="/{imageId}",method=RequestMethod.GET)
		public Image get(@PathVariable int imageId) throws Exception{
			return service.getImage(imageId);
		}
		
		
}
