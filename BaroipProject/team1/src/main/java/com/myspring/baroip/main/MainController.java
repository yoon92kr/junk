package com.myspring.baroip.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping(value= "/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value= "/admin.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView admin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value= "/myPage_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ȸ������ ����
	@RequestMapping(value= "/myPage_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ȸ������ ���� �Է�
	@RequestMapping(value= "/myPage_02_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_02_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// �ֹ� ��� ��ȸ
	@RequestMapping(value= "/myPage_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// �ֹ� �� ����
	@RequestMapping(value= "/myPage_03_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_03_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ��ǰ ��ȯ ��û
	@RequestMapping(value= "/myPage_03_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_03_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ��ǰ �ı�
	@RequestMapping(value= "/myPage_03_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_03_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ����Ʈ ����
	@RequestMapping(value= "/myPage_04.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_04(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ȸ����� �ȳ�
	@RequestMapping(value= "/myPage_05.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_05(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ���� ����
	@RequestMapping(value= "/myPage_06.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_06(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ���� ���� ��
	@RequestMapping(value= "/myPage_06_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_06_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ��ǰ �ı�
	@RequestMapping(value= "/myPage_07.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_07(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// ��ǰ �ı� ����
	@RequestMapping(value= "/myPage_07_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView user_mypage_07_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	// ȸ��Ż��
	@RequestMapping(value= "/dropOut_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView dropOut_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ȸ��Ż�� �Ϸ�
	@RequestMapping(value= "/dropOut_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView dropOut_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// �α��� ������
	@RequestMapping(value= "/login_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ���̵� ��й�ȣ ã��
	@RequestMapping(value= "/login_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ���̵� ã�� ���
	@RequestMapping(value= "/login_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ��й�ȣ ã��
	@RequestMapping(value= "/login_04.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login_04(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// ��й�ȣ ã�� �Ϸ�
	@RequestMapping(value= "/login_05.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login_05(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// �������� ������
	@RequestMapping(value= "/notice_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView notice_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// �������� ��������
		@RequestMapping(value= "/notice_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView notice_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
	
	// ��ٱ��� ������
	@RequestMapping(value= "/cart.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView cart(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// �������
	@RequestMapping(value= "/join_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView join_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ȸ������ ���� �Է�
	@RequestMapping(value= "/join_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView join_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ȸ������ �Ϸ�
	@RequestMapping(value= "/join_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView join_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ������ ���ֹ�������
	@RequestMapping(value= "/cs_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView cs_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 1:1���� ����Ʈ
	@RequestMapping(value= "/cs_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView cs_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 1:1 ���� �ۼ�
	@RequestMapping(value= "/cs_02_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView cs_02_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// 1:1 ���� �󼼺���
	@RequestMapping(value= "/cs_02_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView cs_02_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ��ǰ ���
	@RequestMapping(value= "/product_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// ��ǰ ��
	@RequestMapping(value= "/product_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ��ǰ ��_���ı�
	@RequestMapping(value= "/product_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	// ��ǰ ��_��۾ȳ�
	@RequestMapping(value= "/product_04.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_04(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	// ��ǰ ��_��ǰ ����
	@RequestMapping(value= "/product_05.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_05(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	// ��ǰ ���� �ۼ�
	@RequestMapping(value= "/product_06.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView product_06(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	// ȸ�� �ֹ� / ����
		@RequestMapping(value= "/order_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView order_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
	// �ֹ� ���� �Ϸ�
		@RequestMapping(value= "/order_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView order_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		// admin-ȸ�� ����
		@RequestMapping(value= "/adminUser_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminUser_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		// admin-ȸ�� ���� ��
				@RequestMapping(value= "/adminUser_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
				public ModelAndView adminUser_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
					// HttpSession session;
					ModelAndView mav = new ModelAndView();
					String viewName = (String)request.getAttribute("viewName");
					mav.setViewName(viewName);
					return mav;
		}
		
		// admin- Q&A ���� ���
		@RequestMapping(value= "/adminCS_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminCS_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
		// admin- Q&A �ۼ�
		@RequestMapping(value= "/adminCS_01_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminCS_01_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
		// admin- Q&A ����
		@RequestMapping(value= "/adminCS_01_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminCS_01_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
		// admin- Q&A ��
		@RequestMapping(value= "/adminCS_01_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminCS_01_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
		// admin- Q&A ���� ����
		@RequestMapping(value= "/adminCS_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminCS_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
		// admin- Q&A ���� �亯 �ۼ�
		@RequestMapping(value= "/adminCS_02_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminCS_02_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
//		admin - �ֹ� ����
		@RequestMapping(value= "/adminOrder.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
//		admin - ��ǰ / ��ȯ ����
		@RequestMapping(value= "/adminReturn_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminReturn_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
		
//		admin - ��ǰ / ��ȯ ��û�� Ȯ�� ������
		@RequestMapping(value= "/adminReturn_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminReturn_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}

//		admin - ��ǰ ����
		@RequestMapping(value= "/adminProduct_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminProduct_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
//		 admin - ��ǰ ���
		@RequestMapping(value= "/adminProduct_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminProduct_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
//		admin - ��ǰ ����
		@RequestMapping(value= "/adminProduct_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminProduct_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
//		admin - ��������
		@RequestMapping(value= "/adminNotice_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminNotice_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
//		admin - ��������
		@RequestMapping(value= "/adminNotice_02.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminNotice_02(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
//		admin - ��������
		@RequestMapping(value= "/adminNotice_02_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminNotice_02_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
//		admin - ��������
		@RequestMapping(value= "/adminNotice_03.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminNotice_03(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
//		admin - ����
		@RequestMapping(value= "/adminReview_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminReview_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
//		admin - ����
		@RequestMapping(value= "/adminReview_01_01.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView adminReview_01_01(HttpServletRequest request, HttpServletResponse response) throws Exception{
			// HttpSession session;
			ModelAndView mav = new ModelAndView();
			String viewName = (String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
}
