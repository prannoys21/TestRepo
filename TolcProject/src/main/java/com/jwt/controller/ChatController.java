package com.jwt.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.google.gson.Gson;
import com.jwt.model.Chat;
import com.jwt.model.Employee;
import com.jwt.model.Ticker;
import com.jwt.service.ChatService;
import com.jwt.service.EmployeeService;
import com.jwt.service.TickerService;

@RestController
public class ChatController {

	private static final Logger logger = Logger.getLogger(ChatController.class);

	public ChatController() {
		System.out.println("TickerController()");
	}

	@Autowired
	private ChatService chatService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private TickerService tickerService;
	
	private List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	
	@RequestMapping("/chatMessages")
	public SseEmitter chatMessages() {
		SseEmitter sseEmitter = new SseEmitter();
		emitters.add(sseEmitter);
		sseEmitter.onCompletion(() -> emitters.remove(sseEmitter));
		return sseEmitter;
	}
	
	@RequestMapping("/inCoursechatMessages")
	public SseEmitter inCoursechatMessages() {
		SseEmitter sseEmitter = new SseEmitter();
		emitters.add(sseEmitter);
		sseEmitter.onCompletion(() -> emitters.remove(sseEmitter));
		return sseEmitter;
	}
	
	
	@RequestMapping(value = "/sendMessageInCourse", method = RequestMethod.POST)
	public void sendMessageInCourse(HttpServletRequest request, @RequestParam String actualMessage) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		int senderId = Integer.parseInt(request.getParameter("sender"));
		Employee sender = employeeService.getEmployee(senderId);
		int recipientId = Integer.parseInt(request.getParameter("recipient"));
		Employee recipient = employeeService.getEmployee(recipientId);
		String thisPageUrl = request.getParameter("thisPageUrl");
		String processedMessage = chatService.processMessage(actualMessage,senderId);
		Chat chat = new Chat();
		chat.setTimeStamp(sdf.format(cal.getTime()));
		chat.setSender(sender);
		chat.setRecipient(recipient);
		chat.setMessage(processedMessage);
		if(!processedMessage.isEmpty()) {
			chatService.addMessage(chat);
		}
		Gson gson = new Gson();
		String chatJSONString = gson.toJson(chat);
		for (SseEmitter emitter : emitters) {
			try {
				emitter.send(SseEmitter.event().name("inCourseChatAdd").data(chatJSONString));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		/*ModelAndView model = new ModelAndView();
		model.addObject("employee",sender);
		model.setViewName("redirect:/"+thisPageUrl+"?id="+senderId);
		return model;*/
	}
	
	
	
	
	@RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
	public void sendMessage(HttpServletRequest request, @RequestParam String actualMessage) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		int senderId = Integer.parseInt(request.getParameter("sender"));
		Employee sender = employeeService.getEmployee(senderId);
		int recipientId = Integer.parseInt(request.getParameter("recipient"));
		Employee recipient = employeeService.getEmployee(recipientId);
		String processedMessage = chatService.processMessage(actualMessage,senderId);
		Chat chat = new Chat();
		chat.setTimeStamp(sdf.format(cal.getTime()));
		chat.setSender(sender);
		chat.setRecipient(recipient);
		chat.setMessage(processedMessage);
		if(!processedMessage.isEmpty()) {
			chatService.addMessage(chat);
		}
		Gson gson = new Gson();
		String chatJSONString = gson.toJson(chat);
		for (SseEmitter emitter : emitters) {
			try {
				emitter.send(SseEmitter.event().name("chatAdd").data(chatJSONString));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		/*ModelAndView model = new ModelAndView();
		model.addObject("employee",sender);
		model.setViewName("redirect:/chatAndLearn?id="+senderId);
		return model;*/
	}
 
	/*/////////////////////////////////Algorithms///////////////////////////////////*/

	@RequestMapping(value = "/algorithms", method = RequestMethod.GET)
	public ModelAndView algorithmsPage(HttpServletRequest request) {
			ModelAndView model = new ModelAndView("algorithms/algorithms");
			model.addObject("markAsCompleted", false);
			int empId = Integer.parseInt(request.getParameter("id"));
			Employee employee = employeeService.getEmployee(empId);
			List<Ticker> allNotifications = tickerService.getAllNotifications();
			Collections.reverse(allNotifications);
			List<Ticker> currentCourseLevel = tickerService.getCoursesCompleted(empId, "Algorithms");
			int pageTopicLevel = 1;
			if(!currentCourseLevel.isEmpty()) {
				int currCourseLevel = currentCourseLevel.get(0).getCourseLevel();
				if(!currentCourseLevel.isEmpty()) {
					currCourseLevel = currentCourseLevel.get(0).getCourseLevel();
						pageTopicLevel = 1;
						if (currCourseLevel >= pageTopicLevel){
							model.addObject("markAsCompleted", true);
					} 
					}
				model.addObject("currCourseLevel", currCourseLevel);
			} else {
				model.addObject("currCourseLevel", 0);
			}
			List<Chat> allMessages = chatService.getAllMessages();
			model.addObject("allMessages",allMessages);
			model.addObject("tickerCourse","Algorithms");
			model.addObject("allNotifications",allNotifications);
			model.addObject("employee", employee);
			
			return model;
	}
	
	@RequestMapping(value = "/algorithms/{param1}", method = RequestMethod.GET)
	public ModelAndView algorithmsTopics(HttpServletRequest request, @PathVariable String param1) {
		ModelAndView model = new ModelAndView();
		model.addObject("markAsCompleted", false);
			if(param1.equals("divideAndConquer")) {
				model.setViewName("algorithms/algorithms_divideAndConquer");
			}
			else if(param1.equals("dynamicProgramming")) {
				model.setViewName("algorithms/algorithms_dynamicProgramming");
			}
			else if(param1.equals("greedyApproach")) {
				model.setViewName("algorithms/algorithms_greedyApproach");
			}
			int empId = Integer.parseInt(request.getParameter("id"));
			Employee employee = employeeService.getEmployee(empId);
			List<Ticker> allNotifications = tickerService.getAllNotifications();
			Collections.reverse(allNotifications);
			List<Ticker> currentCourseLevel = tickerService.getCoursesCompleted(empId, "Algorithms");
			int currCourseLevel;
			int pageTopicLevel;
			if(!currentCourseLevel.isEmpty()) {
				currCourseLevel = currentCourseLevel.get(0).getCourseLevel();
				if (param1.equals("greedyApproach")) {
					pageTopicLevel = 2;
					if (currCourseLevel >= pageTopicLevel){
						model.addObject("markAsCompleted", true);
					}
				} else if (param1.equals("divideAndConquer")) {
					pageTopicLevel = 3;
					if (currCourseLevel >= pageTopicLevel){
						model.addObject("markAsCompleted", true);
					}
				} else if  (param1.equals("dynamicProgramming")) {
					pageTopicLevel = 4;
					if (currCourseLevel >= pageTopicLevel){
						model.addObject("markAsCompleted", true);
					}
				}
			model.addObject("currCourseLevel", currCourseLevel);
			} else {
				model.addObject("currCourseLevel", 0);
				}
			model.addObject("tickerCourse","Algorithms");
			model.addObject("allNotifications",allNotifications);
			model.addObject("employee", employee);
			return model;
			
	}
	
	/*/////////////////////////////////Databases///////////////////////////////////*/
	
	
	@RequestMapping(value = "/databases", method = RequestMethod.GET)
	public ModelAndView databasesPage(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("databases/databases");
		model.addObject("markAsCompleted", false);
		int empId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(empId);
		List<Ticker> allNotifications = tickerService.getAllNotifications();
		Collections.reverse(allNotifications);
		List<Ticker> currentCourseLevel = tickerService.getCoursesCompleted(empId, "Databases");
		int pageTopicLevel = 1;
		if(!currentCourseLevel.isEmpty()) {
			int currCourseLevel = currentCourseLevel.get(0).getCourseLevel();
			if(!currentCourseLevel.isEmpty()) {
				currCourseLevel = currentCourseLevel.get(0).getCourseLevel();
					pageTopicLevel = 1;
					if (currCourseLevel >= pageTopicLevel){
						model.addObject("markAsCompleted", true);
				} 
				}
			model.addObject("currCourseLevel", currCourseLevel);
		} else {
			model.addObject("currCourseLevel", 0);
		}
		model.addObject("tickerCourse","Databases");
		model.addObject("allNotifications",allNotifications);
		model.addObject("employee", employee);
		return model;
	}
	
	@RequestMapping(value = "/databases/{param2}", method = RequestMethod.GET)
	public ModelAndView architecture(HttpServletRequest request, @PathVariable String param2) {
		ModelAndView model = new ModelAndView();
		model.addObject("markAsCompleted", false);
		if(param2.equals("architecture")) {
			model.setViewName("databases/databases_architecture");
		}
		else if(param2.equals("models")) {
			model.setViewName("databases/databases_models");
		}
		else if(param2.equals("schemas")) {
			model.setViewName("databases/databases_schemas");
		}
		int empId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(empId);
		List<Ticker> allNotifications = tickerService.getAllNotifications();
		Collections.reverse(allNotifications);
		List<Ticker> currentCourseLevel = tickerService.getCoursesCompleted(empId, "Databases");
		int currCourseLevel;
		int pageTopicLevel;
		if(!currentCourseLevel.isEmpty()) {
			currCourseLevel = currentCourseLevel.get(0).getCourseLevel();
			if (param2.equals("schemas")) {
				pageTopicLevel = 4;
				if (currCourseLevel >= pageTopicLevel){
					model.addObject("markAsCompleted", true);
				}
			} else if (param2.equals("models")) {
				pageTopicLevel = 3;
				if (currCourseLevel >= pageTopicLevel){
					model.addObject("markAsCompleted", true);
				}
			} else if  (param2.equals("architecture")) {
				pageTopicLevel = 2;
				if (currCourseLevel >= pageTopicLevel){
					model.addObject("markAsCompleted", true);
				}
			} else {
			model.addObject("currCourseLevel", 0);
			}
		}
		model.addObject("tickerCourse","Databases");
		model.addObject("allNotifications",allNotifications);
		model.addObject("employee", employee);
		return model;
	}
	
	/*/////////////////////////////////Operating Systems///////////////////////////////////*/
	
	@RequestMapping(value = "/operatingSystems", method = RequestMethod.GET)
	public ModelAndView operatingSystemsPage(HttpServletRequest request) {
			ModelAndView model = new ModelAndView("operatingSystems/operatingSystems");
			model.addObject("markAsCompleted", false);
			int empId = Integer.parseInt(request.getParameter("id"));
			Employee employee = employeeService.getEmployee(empId);
			List<Ticker> allNotifications = tickerService.getAllNotifications();
			Collections.reverse(allNotifications);
			List<Ticker> currentCourseLevel = tickerService.getCoursesCompleted(empId, "Operating Systems");
			int pageTopicLevel = 1;
			if(!currentCourseLevel.isEmpty()) {
				int currCourseLevel = currentCourseLevel.get(0).getCourseLevel();
				if(!currentCourseLevel.isEmpty()) {
					currCourseLevel = currentCourseLevel.get(0).getCourseLevel();
						pageTopicLevel = 1;
						if (currCourseLevel >= pageTopicLevel){
							model.addObject("markAsCompleted", true);
					} 
					}
				model.addObject("currCourseLevel", currCourseLevel);
			} else {
				model.addObject("currCourseLevel", 0);
			}
			model.addObject("tickerCourse","Operating Systems");
			model.addObject("allNotifications",allNotifications);
			model.addObject("employee", employee);
			return model;
	}
	@RequestMapping(value = "/operatingSystems/{param3}", method = RequestMethod.GET)
	public ModelAndView operatingSystemsTopics(HttpServletRequest request, @PathVariable String param3) {
		ModelAndView model = new ModelAndView();
		
		
		model.addObject("markAsCompleted", false);
		if(param3.equals("cache")) {
			model.setViewName("operatingSystems/operatingSystems_cache");
		}
		else if(param3.equals("memoryManagement")) {
			model.setViewName("operatingSystems/operatingSystems_memoryManagement");
		}
		else if(param3.equals("secondaryStorage")) {
			model.setViewName("operatingSystems/operatingSystems_secondaryStorage");
		}
		int empId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(empId);
		List<Ticker> allNotifications = tickerService.getAllNotifications();
		Collections.reverse(allNotifications);
		List<Ticker> currentCourseLevel = tickerService.getCoursesCompleted(empId, "Operating Systems");
		int currCourseLevel;
		int pageTopicLevel;
		if(!currentCourseLevel.isEmpty()) {
			currCourseLevel = currentCourseLevel.get(0).getCourseLevel();
			if (param3.equals("cache")) {
				pageTopicLevel = 3;
				if (currCourseLevel >= pageTopicLevel){
					model.addObject("markAsCompleted", true);
				}
			} else if (param3.equals("memoryManagement")) {
				pageTopicLevel = 2;
				if (currCourseLevel >= pageTopicLevel){
					model.addObject("markAsCompleted", true);
				}
			} else if  (param3.equals("secondaryStorage")) {
				pageTopicLevel = 4;
				if (currCourseLevel >= pageTopicLevel){
					model.addObject("markAsCompleted", true);
				}
			}
			model.addObject("currCourseLevel", currCourseLevel);
		} else {
			model.addObject("currCourseLevel", 0);
		}
		model.addObject("tickerCourse","Operating Systems");
		model.addObject("allNotifications",allNotifications);
		model.addObject("employee", employee);
		return model;
	}
	/*/////////////////////////////////Machine Learning///////////////////////////////////*/
	
	@RequestMapping(value = "/machineLearning", method = RequestMethod.GET)
	public ModelAndView machineLearningPage(HttpServletRequest request) {
			ModelAndView model = new ModelAndView("machineLearning/machineLearning");
			int empId = Integer.parseInt(request.getParameter("id"));
			Employee employee = employeeService.getEmployee(empId);
			List<Ticker> allNotifications = tickerService.getAllNotifications();
			Collections.reverse(allNotifications);
			model.addObject("allNotifications",allNotifications);
			model.addObject("employee", employee);
			return model;
	}
	
	@RequestMapping(value = "/machineLearning/{param4}", method = RequestMethod.GET)
	public ModelAndView machineLearningTopics(HttpServletRequest request, @PathVariable String param4) {
		ModelAndView model = new ModelAndView();
		if(param4.equals("classification")) {
			model.setViewName("machineLearning/machineLearning_classification");
		}
		else if(param4.equals("clustering")) {
			model.setViewName("machineLearning/machineLearning_clustering");
		}
		else if(param4.equals("dataMining")) {
			model.setViewName("machineLearning/machineLearning_dataMining");
		}
		int empId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(empId);
		List<Ticker> allNotifications = tickerService.getAllNotifications();
		Collections.reverse(allNotifications);
		model.addObject("allNotifications",allNotifications);
		model.addObject("employee", employee);
		return model;
	}
	
	
	/*/////////////////////////////////Software Engineering///////////////////////////////////*/
	
	@RequestMapping(value = "/softwareEngineering", method = RequestMethod.GET)
	public ModelAndView softwareEngineeringPage(HttpServletRequest request) {
			ModelAndView model = new ModelAndView("softwareEngineering/softwareEngineering");
			int empId = Integer.parseInt(request.getParameter("id"));
			Employee employee = employeeService.getEmployee(empId);
			List<Ticker> allNotifications = tickerService.getAllNotifications();
			Collections.reverse(allNotifications);
			model.addObject("allNotifications",allNotifications);
			model.addObject("employee", employee);
			return model;
	}
	
	@RequestMapping(value = "/softwareEngineering/{param5}", method = RequestMethod.GET)
	public ModelAndView softwareEngineeringTopics(HttpServletRequest request, @PathVariable String param5) {
		ModelAndView model = new ModelAndView();
		if(param5.equals("design")) {
			model.setViewName("softwareEngineering/softwareEngineering_design");
		}
		else if(param5.equals("maintenance")) {
			model.setViewName("softwareEngineering/softwareEngineering_maintenance");
		}
		else if(param5.equals("projectManagement")) {
			model.setViewName("softwareEngineering/softwareEngineering_projectManagement");
		}
		int empId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(empId);
		List<Ticker> allNotifications = tickerService.getAllNotifications();
		Collections.reverse(allNotifications);
		model.addObject("allNotifications",allNotifications);
		model.addObject("employee", employee);
		return model;
	}
		
}