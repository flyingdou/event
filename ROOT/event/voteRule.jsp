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
		<title>投票结算规则</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<script src="event/js/jquery.js" ></script>
		<script src="event/js/vue.min.js" ></script>
		

	
<style>
		    html,body{
		       padding: 0;
		       margin: 0;
		    }
		    
		    ::-webkit-input-placeholder { /* WebKit, Blink, Edge */
		        font-size: 13px;
			    color:#999999;
			}
			:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
			   font-size: 13px;
			   color:#999999;
			}
			::-moz-placeholder { /* Mozilla Firefox 19+ */
			    font-size: 13px;
			    color:#999999;
			}
			:-ms-input-placeholder { /* Internet Explorer 10-11 */
			    font-size: 13px;
			    color:#999999;
			}
		    
		    
			body {
				background: #f2f2f2;
			}
			
			
			
			ul{
			  padding: 0;
			  margin: 0;
			}
			
			li{
			    list-style: none;
			    padding-top:12px;
			    padding-bottom: 12px;
			    border-top: 1px solid #BCA9B1;
			    border-left: 1px solid #BCA9B1;
			}
			
			
			.dou-bottom{
			    border-bottom: 1px solid #BCA9B1;
			}
			
			
			.dou-div{
			   background-color: white;
			}
			
			.dou-voteRule-ul{
			   margin-top: 9px;
			}
			
			.dou-voteRule-li{
			   padding-left: 8px;
			  
			}
			
			.dou-voteRule-font{
			   
			}
			
			.dou-funcoin-li{
			   padding-left: 15px;
			  
			}
			
			.dou-span-input{
			   margin: 0;
			   padding: 0;
			   
			}
			
			.dou-input{
			  float: right;
			  width: 30%;
			  line-height: 18px;
			  border:none;
			  text-align: center;
			   
			}
			
			
			
			.dou-balanceRule-div{
			   margin-top: 15px;
			}
			
			.dou-balance-li-font{
			   padding: 8px;
			}
			
			.dou-balance-li{
			   padding-left: 15px;
			}
			
			
			
			.dou-balance-li-div{
			  padding-left: 10px;
			  border: 1px solid #BCA9B1;
			  border-right: none;
			}
			
			.dou-balance-counts{
			    border-left: none;
			    border-top: none;
			}
			
			.dou-balance-rates{
			    border-left: none;
			}
			.dou-balance-radio{
			  float: right;
			  margin-right: 10px;
			}
			
			.dou-balance-remark{
			   margin: 0;
			   padding: 8px 0;
			}
			
			
			
			/* footer */
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
			
			.font1{
			   font-size: 13px;
			   color: black;
			}
			
			.font2{
			   font-size: 13px;
			   color: #999999;
			}
</style>
	
	</head>
	<body>
	     <div id = "app">
	     
	     
			<div class = "dou-div dou-voteRule-div" >
					<ul class = "dou-voteRule-ul" >
						<li class="dou-voteRule-li">
							<span class = "dou-voteRule-font font1" >投票规则</span>
						</li>
						<li class="dou-funcoin-li font1">
								投票奖励数量
								<span class="dou-span-input"> 
										<input type="number"  class="dou-input font2" placeholder="输入funcoino数量" v-model="model.pariseFuncoin"  /> 
								</span>
						</li>
						<li class="dou-funcoin-li dou-bottom font1">
								投注最小数量 
								<span class="dou-span-input">
										<input type="number"  class="dou-input font2"  placeholder="输入funcoino数量" v-model="model.minFuncoin" />
								</span>
						</li>
					</ul>
			</div>
			<div class = "dou-div dou-balanceRule-div">
			        <ul class = "dou-balanceRule-ul" >
			             <li class = "dou-balance-li-font ">
			                  <span class="dou-balance-p font1">结算规则</span>
			             </li>
			          <div class = "dou-balance-li-div">
				             <li class = "dou-balance-li dou-balance-counts">
				             	  <span class="dou-balance-font font1">按注分润</span>
				             	  <span class = "dou-balance-radio-span">
				                  		<input type="radio" name = "balanceType" value="0" id = "balance0" v-model="model.balanceType" class = "dou-balance-radio" />
				             	  </span>
				             	  <br/>
				             	  <p class = "dou-balance-remark font2">活动发起人收取负方投注额10%，余额胜方按比例分配</p>
				                                     
				             </li>
				             <li class = "dou-balance-li  dou-balance-rates">
				            	  <span class="dou-balance-font font1">按率分润</span>
				            	  <span class = "dou-balance-radio-span">
				                  		<input type="radio" name = "balanceType" value="1" id = "balance1" v-model="model.balanceType" class = "dou-balance-radio" />
				             	  </span>
				             	  <br/>
				             	  <p class = "dou-balance-remark font2">活动发起人按赔率分润给胜方</p>
				             </li>
			           </div>
			        </ul>
			
			</div>
			
			<div class = "dou-footer">
			    <div class=  "dou-sure-div">
			        <button  class = "dou-sure" onclick="saveVoteRule()" >确定</button>
			    </div>
		    </div>
     </div>	
     
     <script type="text/javascript">
        //加载用户之前在页面填写的数值，用vue渲染页面(如果用户第一次进入，则不渲染页面)
        var preData = sessionStorage.voteRule == undefined ? {} : JSON.parse(sessionStorage.voteRule);
       
        //绑定vue
        var betBalanceData = new Vue({
        	el:"#app",
        	data:{
        		model: preData
        		
        	},
        	created: function () {
        		if (preData == {} || preData.balanceType == undefined || preData.balanceType == "0") {
        			this.model.balanceType = 0;
        		}
        	}
        	
        	
        });
        
        
        
        //当用户点击"确定"时，将用户填写的值保存到js中
        function saveVoteRule(){
        	var params = betBalanceData.model;
        	if (params.pariseFuncoin == undefined || parseInt(params.pariseFuncoin) == 0 ){
        		alert("请填写大于0的投票奖励funcoin数量！");
        		return;
        	}
        	if (params.minFuncoin == undefined || parseInt(params.minFuncoin) == 0 ){
        		alert("请填写大于0的最小投注funcoin数量！");
        		return;
        	}
        	if (params.balanceType == undefined){
        		alert("请选择结算规则！");
        		return;
        	}
        	sessionStorage.voteRule = JSON.stringify(betBalanceData.model);
        	history.go(-1);
        }
     
        
       
     
     </script>
     
     
	</body>
</html>