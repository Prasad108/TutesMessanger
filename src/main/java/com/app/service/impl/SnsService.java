package com.app.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.services.sns.model.MessageAttributeValue;
import com.amazonaws.services.sns.model.PublishRequest;
import com.amazonaws.services.sns.model.PublishResult;
import com.amazonaws.services.sns.model.SetSMSAttributesRequest;

@Service("snsService")
public class SnsService {
	
	@SuppressWarnings("deprecation")
	private static AmazonSNSClient snsClient = new AmazonSNSClient();
	
	private static SetSMSAttributesRequest setRequest = new SetSMSAttributesRequest().addAttributesEntry("DefaultSMSType", "Transactional");
	
	private static Map<String, MessageAttributeValue> smsAttributes =new HashMap<String, MessageAttributeValue>();
	
	static void build_cred() {		
		snsClient.setSMSAttributes(setRequest);
	}
	
	public String sendSMSMessage(String msg,String phoneNumber) {		
		 PublishResult result = snsClient.publish(new PublishRequest()
                .withMessage(msg)
                .withPhoneNumber(phoneNumber)
                .withMessageAttributes(smsAttributes));
		return result.getMessageId();
	}
	
//	public void SNS() {
//		 @SuppressWarnings("deprecation")
//			AmazonSNSClient snsClient = new AmazonSNSClient();
//	     SetSMSAttributesRequest setRequest = new SetSMSAttributesRequest().addAttributesEntry("DefaultSMSType", "Transactional");
//	     //		.addAttributesEntry("DefaultSenderID", "TutesMessanger");
//	     snsClient.setSMSAttributes(setRequest);
//	     //setDefaultSmsAttributes(snsClient);
//	     String message = "My SMS message from aws cloud";
//	     String phoneNumber = "+919657939975"; //919730912708
//	     Map<String, MessageAttributeValue> smsAttributes = 
//	             new HashMap<String, MessageAttributeValue>();
//	     //<set SMS attributes>
//	     sendSMSMessage(snsClient, message, phoneNumber, smsAttributes);
//		
//	}
	
	
	
	
     
//     public static void sendSMSMessage(AmazonSNSClient snsClient, String message, 
//     		String phoneNumber, Map<String, MessageAttributeValue> smsAttributes) {
//             PublishResult result = snsClient.publish(new PublishRequest()
//                             .withMessage(message)
//                             .withPhoneNumber(phoneNumber)
//                             .withMessageAttributes(smsAttributes));
//             System.out.println(result); // Prints the message ID.
//     }

}
