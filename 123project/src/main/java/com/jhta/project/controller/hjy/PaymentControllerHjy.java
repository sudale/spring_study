package com.jhta.project.controller.hjy;

import java.util.HashMap;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.refund.PayRefund;


@RestController
public class PaymentControllerHjy {
	/**
	 * 카드취소 관련
	 * @param token
	 * @param mid
	 * @return
	 */
	@GetMapping(value="hjy/payment/refund")
	public HashMap<String, Object> refund(String token,String mid) {
		PayRefund pay = new PayRefund();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = pay.cancelPayment(token, mid);
		if(result>0) {
			map.put("result", "success");	
		}else {
			map.put("result", "fail");	
		}
		return map;
	}
}
