package com.saic.csc.test;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.test.web.servlet.ResultActions;

import com.meidusa.fastjson.JSON;

public class UserCouponControllerTest extends ControllerTest {

	@Test
	public void testQueryCoupon() throws Exception {
		Map<String, String> params = new HashMap<>();
		params.put("pageIndex", "1");
		params.put("pageSize", "10");
		params.put("userId", "282977");

		List userCouponViewObjects = new ArrayList<>();

		ResultActions perform = mockMvc.perform(post(
				"/order/operate/queryCoupon/0").header(
				"content-type", CONTENT_TYPE_JSON).content(
				JSON.toJSONString(params)));

		// ResultActions andExpect = perform.andExpect(status().isOk())
		// .andExpect(content().contentType(CONTENT_TYPE_JSON))
		// .andExpect(content().encoding(CONTENT_ENCODE));
		//
		// andExpect = andExpect.andExpect(content().string(
		// GrapeServiceUtils.toJson(ResultInfoUtil
		// .setSuccessInfo(userCouponViewObjects))));
    	
    }
}
