package javaa.swagger.mail;

import java.util.Random;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javaa.swagger.vo.UsersVo;

@Controller
public class MailController {

	private MailSender mailSender;
	
	public void setMailSender(MailSender mailSender) {
		System.out.println("setter가 동작함");
		this.mailSender = mailSender;
	}

	//email 확인-------------------------------------------------------
	@RequestMapping(value="account/mailTest.do",method=RequestMethod.GET)
	public ModelAndView emailcheck(String user_emil)
	{
		ModelAndView mav = new ModelAndView();
	
		Random random = new Random();
			int code = 0;
			
			while(true) {
				code = random.nextInt(999999);
				if(code > 100000) {
					break;
				}
			}
			mav.addObject("code",code);
			//mav.addObject("user_email",user_email);
			
			try {
			SimpleMailMessage mailMessage = new SimpleMailMessage();
			mailMessage.setSubject("eden 회원등록 인증 이메일발송");
			mailMessage.setFrom("sanghyupz@naver.com");
			mailMessage.setText("당신의 코드는 "+ code +"입니다. 페이지에 코드를 입력하세요");
			mailMessage.setTo(user_emil);
			
			System.out.println("user_emil:"+user_emil);
			System.out.println("코드:"+code);
			
			mailSender.send(mailMessage);
			} catch (Exception e) {
				
				System.out.println(e.getMessage());
			}	
			
			return mav;
	}
	
	@RequestMapping(value="account/confirm.do")
	public ModelAndView check(int input, int code) {
		ModelAndView mav = new ModelAndView();
		String msg = "";
		
		if(input == code) {
			msg = "메일인증성공!";
			mav.setViewName("account/create");
			
		} else {
			msg = "회원가입 실패! 코드가 틀렸습니다.";
		}
		
		mav.addObject("msg",msg);
		
		return mav;
	}//email 확인-------------------------------------------------------
}
