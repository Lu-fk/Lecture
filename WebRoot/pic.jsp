<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style>
 *{
  margin:0px;
  padding:0px;
 }
 #d1{
  border : 1px solid #aaaaaa;
  margin-left:200px;
  margin-top:40px;
  width:1000px; 
  height:600px; 
  overflow:hidden;
  position:relative;
 }
 
 #adv,#num{
  position:absolute;
 }
 
 ul li{
  float:left;
  list-style:none;
  display:inline;
 }
 ul img{
  width:1000px; 
  height:600px;
  display:block;
 }
 
 #num{
  
  bottom:5px;
 }
 
 #num li{
  float: left;
  color: #FF7300;
  text-align: center;
  line-height: 16px;
  width: 16px;
  height: 16px;
  font-family: Arial;
  font-size: 12px;
  cursor: pointer;
  overflow: hidden;
  margin: 3px 1px;
  border: 1px solid #FF7300;
  
 }
 
 .on{
  line-height: 21px;
  width: 21px;
  height: 21px;
  font-size: 16px;
  margin: 0 1px;
  border: 0;
  background-color:red;
  font-weight: bold;
 }
</style>

<script type="text/javascript" src="js/jquery-3.2.0.min.js"></script>

<script type="text/javascript">
	$(function(){
	$('#num li').mouseenter(function(){
	//jquery类数组的操作
		var index = $('#num li').index(this);
		showImag(index);
	}).eq(0).mouseenter();//.mouseenter()模拟鼠标进入事件
});
	
	var taskId;
	var i = 0;
 
	$(function(){
		$('#d1').hover(function(){
			clearInterval(taskId);           //鼠标位于图片上方时不动
		},function(){
			taskId = setInterval(function(){    //setInterval(function，2000)每隔2000ms就调用function
				showImag(i);
				i++;
				if(i==3){
				i=0;
				}
			},2000);
		}).mouseleave();//.mouseleave()模拟鼠标离开事件
	});
 
 //滚动图片
	function showImag(index){
		$('#adv').stop(true).animate({'top':-index*600},2000);
		$('#num li').eq(index).addClass('on').siblings().removeClass('on');
	}
</script>
</head>

<body>
	<div id="d1">
		<ul id="adv">
			<li><img src="pictures/jobs.JPG"/></li>
			<li><img src="pictures/timg.jpg"/></li>
			<li><img src="pictures/zkbg.jpg"/></li>
		</ul>
		<ul id="num">
			<li>1</li>
			<li>2</li>
			<li>3</li>
		</ul>
	</div>
</body>
</html>

 