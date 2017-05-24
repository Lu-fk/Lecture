<%@ page contentType="image/jpeg" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"  pageEncoding="gbk"%>   
<%!   
	Color getRandColor(int fc,int bc)   {   
		 Random random = new Random();   
		 if(fc>255) fc=255;   
		 if(bc>255) bc=255;   
		 int r=fc+random.nextInt(bc-fc);   
		 int g=fc+random.nextInt(bc-fc);   
		 int b=fc+random.nextInt(bc-fc);   
		 return new Color(r,g,b);   
	}   
%> 
  
<%   
	//设置请求范围
	response.setHeader("Pragma","No-cache");   
	response.setHeader("Cache-Control","no-cache");   
	response.setDateHeader("Expires", 0);   
	  
	int width=60, height=20;   
	BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);   
	  
	  
	Graphics g = image.getGraphics();   
	Random random = new Random();   
	  
	g.setColor(getRandColor(200,250));   //设置颜色（从200-250内取随机颜色）
	g.fillRect(0, 0, width, height);     //填充矩形（从0，0即左上角开始，填充高度和宽度为设置的参数；但是为啥要填充。。）
	  
	g.setFont(new Font("Times New Roman",Font.PLAIN,18));   //设置字体？
	    
	g.setColor(getRandColor(160,200));   
	for (int i=0;i<155;i++)   {   
		int x = random.nextInt(width);   
		int y = random.nextInt(height);   
		int xl = random.nextInt(12);   
		int yl = random.nextInt(12);   
		g.drawLine(x,y,x+xl,y+yl);   //用取的随机数画线？
	}   
	  
	char c[] = new char[62];   
	  
	for (int i = 97, j = 0; i < 123; i++, j++) {   
		c[j] = (char) i;   
		}   
	for (int o = 65, p = 26; o < 91; o++, p++) {   
		c[p] = (char) o;   
		}   
	for (int m = 48, n = 52; m < 58; m++, n++) {   
		c[n] = (char) m;   
	}           
	String sRand="";   
	for (int i=0;i<4;i++){   
		int x = random.nextInt(62);   
		String rand=String.valueOf(c[x]);   
		sRand+=rand;   
	  
		//String sRand="";   
		//for (int i=0;i<4;i++){   
		//String rand=String.valueOf(random.nextInt(10));   
		//sRand+=rand;   
  
		g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));   
		g.drawString(rand,13*i+6,16);   
	}   
  
// 将认证码存入SESSION   
	session.setAttribute("rand",sRand);   
  
	g.dispose();   
  
	ImageIO.write(image, "JPEG", response.getOutputStream());   
	out.clear();   
	out = pageContext.pushBody();    
%>  
