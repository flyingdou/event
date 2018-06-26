package com.whhyl.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.whhyl.common.Constants;
import com.whhyl.service.sendMessageService;
import com.whhyl.util.commentsUtil;

import net.sf.json.JSONObject;

@Transactional
@Service
public class sendMessageServiceImpl  implements sendMessageService{
	
	 //产品名称:云通信短信API产品,开发者无需替换
    static final String product = "Dysmsapi";
    //产品域名,开发者无需替换
    static final String domain = "dysmsapi.aliyuncs.com";

    static final String accessKeyId = Constants.ACCESS_KEY;
    static final String accessKeySecret = Constants.ACCESS_SECRET;

    public static  JSONObject sendSms(String mobilephone, String templateCode, JSONObject param) throws ClientException {
    	JSONObject ret = new JSONObject();
    	try {
    		//可自助调整超时时间
            System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
            System.setProperty("sun.net.client.defaultReadTimeout", "10000");

            //初始化acsClient,暂不支持region化
            IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
            DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
            IAcsClient acsClient = new DefaultAcsClient(profile);

            //组装请求对象-具体描述见控制台-文档部分内容
            SendSmsRequest request = new SendSmsRequest();
            //必填:待发送手机号
            request.setPhoneNumbers(mobilephone);
            //必填:短信签名-可在短信控制台中找到
            request.setSignName(Constants.FUNCOIN_SIGN);
            //必填:短信模板-可在短信控制台中找到
            request.setTemplateCode(templateCode);
            //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
            request.setTemplateParam(param.toString());

            //选填-上行短信扩展码(无特殊需求用户请忽略此字段)
            //request.setSmsUpExtendCode("90997");

            //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
            request.setOutId("yourOutId");

            //hint 此处可能会抛出异常，注意catch
            SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);

            if ("OK".equals(sendSmsResponse.getCode())){
    			ret.accumulate("success", true).accumulate("mobilephone", request.getPhoneNumbers());
    		} else {
    			ret.accumulate("success", false).accumulate("message", sendSmsResponse.getMessage());
    		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

        
        return ret;
    }

	

    
    /**
     * 获取手机验证码
     */
	@Override
	public JSONObject getMobileCode(HttpServletRequest request, JSONObject obj) {
		JSONObject ret = new JSONObject();
		try {
			String mobilephone = obj.getString("mobilephone");
			mobilephone = mobilephone.trim();
			String code = commentsUtil.getRandom(6);
			JSONObject param = new JSONObject();
			param.accumulate("code", code);
		    ret =  sendSms(mobilephone, Constants.PRODUCT_EXCHANGE, param);
		    if (ret.containsKey("success") && ret.getBoolean("success")){
		    	ret.accumulate("code", code);
		    }
		} catch (Exception e) {
			e.printStackTrace();
			ret.accumulate("success", false)
			   .accumulate("msg", e)
			   ;
		}
		return ret;
	}
	
	
	
	

}
