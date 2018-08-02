package javaa.swagger.mail;

import java.util.Random;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javaa.swagger.vo.UsersVo;

@Controller
public class MailController {

	private MailSender mailSender;
	
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	//email 확인-------------------------------------------------------
	@RequestMapping("account/mailTest.do")
	@ResponseBody
	public String emailcheck(String user_email)
	{
		String str = "";
	
		Random random = new Random();
			int code = 0;
			
			while(true) {
				code = random.nextInt(999999);
				if(code > 100000) {
					break;
				}
			}
			str = code+"";
			//mav.addObject("user_email",user_email);
			
			try {
			SimpleMailMessage mailMessage = new SimpleMailMessage();
			mailMessage.setSubject("eden 회원등록 인증 이메일발송");
			mailMessage.setFrom("sanghyupz@naver.com");
			mailMessage.setText("당신의 코드는 "+ code +"입니다. 페이지에 코드를 입력하세요");
			//mailMessage.setTo("sanghyupz@naver.com");
			mailMessage.setTo(user_email);

			mailSender.send(mailMessage);
			} catch (Exception e) {
				
				System.out.println("Exception:"+e.getMessage());
			}	
			
			return str;
	}
	
	@RequestMapping(value="account/confirm.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String check(int input, int code) {
		String msg = "";
		
		if(input == code) {
			msg = "메일인증성공!";
			
		} else {
			msg = "회원가입 실패! 코드가 틀렸습니다.";
		}
		return msg;
	}//email 확인-------------------------------------------------------
}
