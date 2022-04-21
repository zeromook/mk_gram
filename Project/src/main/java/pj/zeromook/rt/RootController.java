package pj.zeromook.rt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RootController {
	
	@RequestMapping("{anything}.do")
	public String goDo(@PathVariable String anything){
		return anything;
	}
}
