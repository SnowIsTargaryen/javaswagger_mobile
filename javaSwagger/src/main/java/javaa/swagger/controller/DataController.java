package javaa.swagger.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.github.rcaller.rStuff.RCaller;
import com.github.rcaller.rStuff.RCode;

@Controller
public class DataController {
	
	
	@RequestMapping(value="/data/bigData",method=RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		String fname="";
		try {
			RCaller caller = new RCaller();
			caller.setRscriptExecutable("C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\Rscript.exe");
			
			RCode code = new RCode();
			RCode code2 = new RCode();
			code.clear();
			
			
			File file;
			file = code.startPlot();
			
			System.out.println(file.getPath());
			
			/*
			 * 	setwd("c:/r_temp")
				library(KoNLP)
				library(wordcloud)
				useSejongDic()
				
				data1=read.csv("keywordRank.csv",header=T)
				data2=data1[,c(2,3)]
				data3=subset(data2,날짜=="2018-9-12")
				data4=data3[,'검색어']
				keyword=unlist(data4)
				keyword=data.frame(keyword)
				wordcount=table(keyword)
				head(sort(wordcount,decreasing=T),20)
				palete = brewer.pal(9,"Set3")
				wordcloud( names(wordcount), freq=wordcount, scale=c(5,1), min.freq=1, random.order=F,random.color=T, colors=palete) 
				
				top5=head(sort(wordcount,decreasing=T),5)
				top5=list(top5)
				t5=data.frame(top5)
				write.csv(t5,'top5.csv')
			 * 
			 * */
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH)+1;
			int Date = cal.get(Calendar.DATE);
			String today = year+"-"+month+"-"+Date;
			System.out.println(today);
			
			
			code.addRCode("setwd(\"c:/r_temp\")");
			code.addRCode("library(KoNLP)");
			code.addRCode("library(wordcloud)");
			code.addRCode("useSejongDic()");
			code.addRCode("data1=read.csv(\"keywordRank.csv\",header=T)");
			code.addRCode("data2=data1[,c(2,3)]");
			code.addRCode("data3=subset(data2,날짜==\""+today+"\")");
			code.addRCode("data4=data3[,'검색어']");
			code.addRCode("keyword=unlist(data4)");
			code.addRCode("keyword=data.frame(keyword)");
			code.addRCode("wordcount=table(keyword)");
			
			code.addRCode("top5=head(sort(wordcount,decreasing=T),5)");
			code.addRCode("top5=list(top5)");
			code.addRCode("t5=data.frame(top5)");
			code.addRCode("write.csv(t5,'top5.csv',fileEncoding='euc-kr')");
			
		
			code.addRCode("palete = brewer.pal(9,\"Set3\")");
			code.addRCode("wordcloud( names(wordcount), freq=wordcount, scale=c(5,1), min.freq=1, random.order=F,random.color=T, colors=palete)");
			
			caller.setRCode(code);
			caller.runOnly();
			
			File csvfile = new File("C:\\r_temp\\top5.csv");
			String line = null;
			List<String> list = new ArrayList<String>();
			try 
			{
				BufferedReader bufReder = new BufferedReader(new FileReader(csvfile));
				while ((line = bufReder.readLine()) != null) 
				{
					String[] data = line.split(",");		
//					String idx = data[0].substring(data[0].indexOf('"')+1,data[0].lastIndexOf('"'));
//					String key = data[1].substring(data[1].indexOf('"')+1,data[1].lastIndexOf('"'));
					String idx = data[0];
					String key = data[1];
					
					if(!key.equals("keyword") && !data[2].equals("\"Freq\""))
					{
						list.add(key);
						list.add(data[2]);
					}

				}
			
				for(String a:list)
				{
					System.out.println(a);
			
				}
			} catch (FileNotFoundException e) {
			     // TODO Auto-generated catch block
			     e.printStackTrace();
			} catch (IOException e) {
			     // TODO Auto-generated catch block
			     e.printStackTrace();
			}
			
			
			
			
			
			String path = request.getRealPath("resources/chat");
			System.out.println(path);
			FileInputStream fis = new FileInputStream(file);
			FileOutputStream fos = new FileOutputStream(path+"/"+file.getName());
			FileCopyUtils.copy(fis, fos);
			
			fis.close();
			fos.close();
			
			fname = file.getName();
			
			
			
			mav.addObject("fname",fname);
			mav.addObject("rank",list);
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return mav;
		
	}

}
