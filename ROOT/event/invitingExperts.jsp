<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>邀请专家</title>

<link href="event/css/mui.min.css" rel="stylesheet" />
<script src="event/js/mui.min.js" ></script>
<script src="event/js/jquery.js"></script>
<script src="event/js/vue.min.js"></script>

<style>
   html,body{
      margin: 0;
      padding:0;
   }
  
  
  .dou-li{
     position: relative;
  } 
   .dou-delete-div{
      position: absolute;
      right: 10px;
   }
   
  .deleteButton {
    width: 50px;
    height: 30px;
    line-height: 30px;
    font-size: 16px;
    color: white;
    background: red;
    margin-top: -35px;
    border-radius: 5px;
    text-align: center;
  
  }  
  
  body{
	 position: relative;
	}
			
.dou-footer{
   position: fixed;
   bottom: 0;
   height: 40px;
   width: 100%;
}

.dou-sure-div{
  float: left;
  width: 100%;
  height: 100%;
}

.dou-sure{
  color: white;
  width: 100%;
  height: 100%;
  border: none;
  background-color: #FE970F;
}
  
  
 .noData-div{
 width: 100%;
 height: 90%;
 }
 
 .noData-img{
    width: 100%;
    height: 100%;
 }
</style>


</head>
<body>
   <!-- html开始 -->
   <div class = "mui-content" id = "app">
       <ul class = "mui-table-view">
           <li class = "mui-table-view-cell mui-left dou-li" v-for = "(v,i) in currentList" >
               <img class = "mui-media-object mui-pull-left" :src="'picture/'+v.image" >
               <div class = "mui-media-body">
                    {{v.nick}}
                    <p class = "dou-list-text">投票{{v.voteCount | NAAN}}次，投注{{v.betCount | NAAN}}次</p>
                    <div class = "dou-delete-div">
                        <div class = "deleteButton" onclick="deleteExpert(this)">删除</div>
                        <input type="hidden" :value = "i"/>
                    </div>
               </div>
           </li>
           
       </ul>
       
       <!--没有数据的提示-->
       <div  v-show="model.hasNoData" class="noData-div" >
            <img src="event/img/no-data.jpg" class="noData-img">
       </div>
       
       <!-- footer -->
		<div class = "dou-footer">
		   <div class=  "dou-sure-div">
		       <button  class = "dou-sure" onclick="selectExperts()">邀请专家</button>
		   </div>
		</div>
   </div>
   
   
   <!-- js开始 -->
   <script>
   Array.prototype.remove=function(obj){ 
	      for(var i =0;i <this.length;i++){ 
	      var temp = this[i]; 
	      if(!isNaN(obj)){ 
	      temp=i; 
	      } 
	      if(temp == obj){ 
	      for(var j = i;j <this.length;j++){ 
	      this[j]=this[j+1]; 
	      } 
	      this.length = this.length-1; 
	      } 
	      } 
	      } 
   /* 当前页面只需显示已被选中的专家，以及删除专家的操作 */
   
   	 //加载已被选中的专家(数据源)
   	 
     //载入函数
     $(function (){
    	 // 倒序
    	 currentExperts.currentList.reverse();
    	 $(".dou-li").each(function (i,item){
    		 var liHeight = $(item).innerHeight();
    		 toHeight = (liHeight-40)/2;
    		 $(".dou-delete-div").eq(i).css({"top":toHeight});
    	 });
     })
     
     
     var currentExperts = new Vue({
    	 el:"#app",
    	 data: {
	    		    currentList: [],
	    		    model:{
	    		    	hasNoData:true
	    		    }
    	 		},
	 	filters:{
	 		NAAN:function (value){
		 			if (value == null || value == undefined || value == "null" || value == "0"){
		 				return 0;
		 			} else {
		 				return value;
		 			}
	 		  }
	 		  
    	    
    	 	
	 		
	 		     },
	 		    created: function(){
		 			 window.onpageshow = function(){
		 		   		if(sessionStorage.getItem("experts")){
			 		   		currentExperts.currentList = JSON.parse(sessionStorage.getItem("experts"));
			 		   		currentExperts.model.hasNoData = false;
		 		   		}
		 	   	 }
		 		  }
    	 
     });
     
     //当用户点击删除专家时，删除该专家
     function deleteExpert(elem){
    	 var isDelete = confirm("确认删除该专家吗？");
  		 if  (isDelete) {
  			 //取下一个元素的值
  			 var i = $(elem).next().val();
  			currentExperts.currentList.remove(i);
  			sessionStorage.experts = JSON.stringify(currentExperts.currentList);
  			// 刷新当前页面
  			document.location.reload();
  			
  		 }
  		
    	 
     }
     
     
     
      //当用户点击邀请专家时，去查询专家的信息
      function selectExperts(){
    	  location.href = "member/selectExperts.html";
      }
     
      
     
     
     
   </script>
   
   
   
</body>
</html>