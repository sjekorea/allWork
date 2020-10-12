package allwork.controller;

import javax.annotation.Resource;

import allwork.service.NetfuMemberService;

public class NetfuMemberController {
	
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;

}
