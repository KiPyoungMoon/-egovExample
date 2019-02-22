package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

//import org.apache.logging.log4j.core.util.JsonUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import egovframework.example.sample.service.EgovSampleService;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import org.springframework.ui.ModelMap;

@Controller
public class MainController {
	
	/** EgovSampleService */
	@Resource(name = "sampleService")
	private EgovSampleService sampleService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value = "main.do")
	public String initMain() throws Exception {
		
		return "main/main.tiles";
		
	}
	
	@RequestMapping(value = "menuFirst.do")
	public String menuFirst() throws Exception {

		return "main/menu1.tiles";
		
	}
	
	@RequestMapping(value = "menuSecond.do")
	public String menuSecond() throws Exception {
		
		return "main/menu2.tiles";
		
	}
	
	@RequestMapping(value = "menuThird.do")
	public String menuThird() throws Exception {
		
		return "main/menu3.tiles";
		
	}
	@ResponseBody
	@RequestMapping(value = "dataTables.do", method = RequestMethod.GET)
	public String dataTables(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> sampleList = sampleService.selectSampleList(searchVO);
		model.addAttribute("data", sampleList);

		int totCnt = sampleService.selectSampleListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		Gson gson = new Gson();
		String jsonString = gson.toJson(model);
		
		return jsonString;
	}
}
