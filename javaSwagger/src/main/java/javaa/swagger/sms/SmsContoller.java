package javaa.swagger.sms;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.youiwe.webservice.ServiceSMSSoapProxy;

@Controller
public class SmsContoller {
	
	@RequestMapping("account/send.do")
	@ResponseBody
	public String send(@RequestBody String user_phone)
	{
		System.out.println(user_phone);
		String r="";
		String smsID= "rola";	
		String smsPW="bit123400";
		Random ran = new Random();
		int n =0;
		System.out.println(1);
		while(n<=1000)
		{
			n=ran.nextInt(10000);
		}
		r=n+"";
		System.out.println("r:"+r);
		ServiceSMSSoapProxy sendsms = new ServiceSMSSoapProxy();
		try{
			System.out.println(3);
		ObjectMapper mapper = new ObjectMapper();
		r=mapper.writeValueAsString(r);
		System.out.println("r:"+r);
		String senderPhone= "01036517605";
		String subnum = r.substring(1, r.lastIndexOf("\""));
		
		String receivePhone= user_phone;
		String edem = "EveryDay EveryMoment!\n 코드번호를 인증해주세요 :)\n코드번호:";
		String smsContent= edem+subnum;
		String test1 = (smsID+smsPW+receivePhone);
		CEncrypt encrypt = new CEncrypt("MD5",test1);
		java.lang.String send=sendsms.sendSMS(smsID,encrypt.getEncryptData(), senderPhone, receivePhone, smsContent);
 		System.out.println("결과코드:"+send);
 		
		}catch(Exception e){
		System.out.println("Exception in main:" +e);
		}
		return r;
		
	}
	
	class CEncrypt
	{
	    MessageDigest md;
	    String strSRCData = "";
	    String strENCData = "";

	    public CEncrypt(){}
	    //인스턴스 만들 때 한방에 처리할 수 있도록 생성자 중복시켰습니다. 
	    public CEncrypt(String EncMthd, String strData)
	    {
	        this.encrypt(EncMthd, strData);
	    }

	    //암호화 절차를 수행하는 메소드입니다.
	    public void encrypt(String EncMthd, String strData)
	   {
	       try
	      {
	          MessageDigest md = MessageDigest.getInstance(EncMthd); // "MD5" or "SHA1"
	         byte[] bytData = strData.getBytes();
	         md.update(bytData);

	         byte[] digest = md.digest();
	         StringBuffer sb = new StringBuffer();
	         for(int i =0;i<digest.length;i++)
	         {
	        	 strENCData = sb.append(Integer.toString((digest[i]&0xff) + 0x100, 16).substring(1)).toString();
	         }
	       }catch(NoSuchAlgorithmException e)
	      {
	         System.out.print("암호화 알고리즘이 없습니다.");
	      };
	    
	      //나중에 원본 데이터가 필요할지 몰라서 저장해 둡니다.
	      strSRCData = strData;
	    }

	    //접근자 인라인 함수(아니, 메소드)들입니다.
	    public String getEncryptData(){return strENCData;}
	    public String getSourceData(){return strSRCData;}

	    //데이터가 같은지 비교해주는 메소드입니다.
	    public boolean equal(String strData)
	    {
	      //암호화 데이터랑 비교를 하던, 원본이랑 비교를 하던 맘대로....
	      if(strData == strENCData) return true;
	      return false;
	    }
		
	}


}
