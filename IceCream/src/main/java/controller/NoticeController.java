package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import notice.dto.NoticeDTO;
import service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

	// writeForm 이동
	@RequestMapping("/notice/writeForm.do")
	public ModelAndView writeForm() {
		ModelAndView modelAndView = new ModelAndView();

		System.out.println("******** controller - /notice/writeForm.do ******************");

		modelAndView.addObject("req", "notice/writeForm.jsp");
		modelAndView.setViewName("/");
		return modelAndView;
	}

	// insert : 게시물 등록
	@RequestMapping("/notice/insert.do")
	public ModelAndView insert(HttpServletRequest request, MultipartFile contentFile) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println("****Controller******* = /notice/insert.do 들어옴");

		// 파일 가져오기
		String filePath = request.getSession().getServletContext().getRealPath("/storage");
		String fileName = contentFile.getOriginalFilename();

		System.out.println("파일경로(filePath) ===" + filePath);
		System.out.println("파일명(fileName) === " + fileName);

		// 저장할 폴더
		File file = new File(filePath, fileName);

		try {
			FileCopyUtils.copy(contentFile.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		NoticeDTO dto = new NoticeDTO();
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setFileName(fileName);

		int result = noticeService.insert(dto);
		System.out.println("service 다녀온 결과:" + result);

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("result", result);
		modelAndView.addObject("req", "notice/noticeList.jsp");
		modelAndView.setViewName("/");
		return modelAndView;
	}

	// selsectList : 리스트 조회
	@RequestMapping("/notice/selectList.do")
	public ModelAndView selectList(HttpServletRequest request) {

		System.out.println("****Controller******* = /notice/selsectList.do 들어옴");

		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}

		/* 페이징 처리 */
		int totalA = noticeService.selectTotal();

		System.out.println("totalA ====" + totalA);

		int totalP = (totalA + 4) / 5;
		if (pg > totalP) {
			pg = totalP;
		}

		/* 목록 보기 */
		int endNum = pg * 5;
		int startNum = endNum - 4;

		List<NoticeDTO> list = noticeService.selectList(startNum, endNum);

		System.out.println(list);

		/* 블럭 처리 */
		int startPage = (pg - 1) / 3 * 3 + 1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);

		modelAndView.addObject("req", "notice/noticeList.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// select : 개별 조회
	@RequestMapping("/notice/selectOne.do")
	public ModelAndView selectOne() {
		ModelAndView modelAndView = new ModelAndView();

		System.out.println("/notice/selectOne.do 들어옴");

		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// selectTotal : 게시물 전체 갯수
	@RequestMapping("/notice/selectTotal.do")
	public ModelAndView selectTotal() {
		ModelAndView modelAndView = new ModelAndView();

		System.out.println("/notice/selectTotal.do 들어옴");

		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// modify : 게시물 수정
	@RequestMapping("/notice/modify.do")
	public ModelAndView modify() {
		ModelAndView modelAndView = new ModelAndView();

		System.out.println("/notice/modify.do 들어옴");

		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// updateHit : 조회수 수정
	@RequestMapping("/notice/updateHit.do")
	public ModelAndView updateHit() {
		ModelAndView modelAndView = new ModelAndView();

		System.out.println("/notice/updateHit.do 들어옴");

		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// delete : 게시물 삭제
	@RequestMapping("/notice/delete.do")
	public ModelAndView delete() {
		ModelAndView modelAndView = new ModelAndView();

		System.out.println("/notice/delete.do 들어옴");

		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

}
