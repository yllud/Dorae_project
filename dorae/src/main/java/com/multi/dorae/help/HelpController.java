package com.multi.dorae.help;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.dorae.login.KakaoVO;

@Controller
@RequestMapping("help")
public class HelpController {

	@Autowired
	FaqService faqService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	ContactService contactService;
	@Autowired
	HelpCategoryService helpCategoryService;
	
	@RequestMapping()
	public String main() {
		return "redirect:main";
	}
	
	@ResponseBody
	@RequestMapping("helpCategoryListByParentId")
	public List<HelpCategoryVO> helpCategoryListByParentId(String parent_category_id) {
		return helpCategoryService.listByParentId(parent_category_id);
	}
	
	@RequestMapping("main")
	public void helpMain(Model model, HttpSession session) {
		System.out.println("email : " + session.getAttribute("email"));
		model.addAttribute("helpCategory", helpCategoryService.listByParentId("None"));
	}
	
	@ResponseBody
	@RequestMapping("faq/one")
	public FaqVO faqOne(int faq_id) {
		return faqService.one(faq_id);
	}
	
	@ResponseBody
	@RequestMapping("faq/list")
	public List<FaqVO> faqList() {
		return faqService.list();
	}
	
	@RequestMapping("faq/category")
	public void faqListByHelpCategory(String help_category_id, Model model) {
		model.addAttribute("helpCategory", helpCategoryService.listByParentId("None"));
		model.addAttribute("faqList", faqService.listByCategory(help_category_id));
	}
	
	@RequestMapping("faq/search")
	public void faqSearch(String search, Model model) {
		model.addAttribute("faqList", faqService.listBySearch(search));
		model.addAttribute("search", search);
	}
	
	@ResponseBody
	@RequestMapping("notice/one")
	public NoticeVO noticeOne(long notice_id) {
		System.out.println("notice_id >> " + notice_id);
		return noticeService.one(notice_id);
	}
	
	@ResponseBody
	@RequestMapping("notice/list")
	public List<NoticeVO> noticeList() {
		return noticeService.list();
	}
	
	@RequestMapping("contact")
	public void contact(Model model, HttpSession session) {
		System.out.println(session.getAttribute("email"));
		System.out.println(session.getAttribute("kakaoE"));
		KakaoVO kvo = (KakaoVO) session.getAttribute("kakaoE");
		model.addAttribute("contactList", contactService.listByMemberId(kvo.getEmail()));
	}
	
	@RequestMapping("contact/one")
	public String contactOne(long contact_id, HttpSession session, Model model) {
		ContactVO contactVO = contactService.one(contact_id, (KakaoVO) session.getAttribute("kakaoE"));
		
		if (contactVO == null) {
			return "redirect:/help/main";
		} else {
			model.addAttribute("vo", contactVO);
			return "one";
		}
	}
	
	@ResponseBody
	@RequestMapping("contact/list")
	public List<ContactVO> contactList(HttpSession session) {
		return contactService.listByMemberId(((KakaoVO) session.getAttribute("kakaoE")).getEmail());
	}
	
	@RequestMapping(value = "contact/create", method = RequestMethod.GET)
	public void contactCreatePage() {

	}
	
	@RequestMapping(value = "contact/create", method = RequestMethod.POST, produces="application/text;charset=UTF-8")
	public String contactCreate(ContactVO vo, HttpSession session) {
		System.out.println(session.getAttribute("kakaoE"));
		KakaoVO kvo = (KakaoVO) session.getAttribute("kakaoE");
		vo.setMember_id(kvo.getEmail());
		
		contactService.create(vo);
		return "redirect:/help/contact";
	}
}
