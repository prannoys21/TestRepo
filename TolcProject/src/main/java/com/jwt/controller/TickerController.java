package com.jwt.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.google.gson.Gson;
import com.jwt.model.Employee;
import com.jwt.model.Ticker;
import com.jwt.service.EmployeeService;
import com.jwt.service.TickerService;

/**
 * @author  Prannoy Chandra
 *
 */
@RestController
public class TickerController {

	private static final Logger logger = Logger
			.getLogger(TickerController.class);

	public TickerController() {
		System.out.println("TickerController()");
	}

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private TickerService tickerService;
	
	
private List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	
	@RequestMapping("/tickerNotification")
	public SseEmitter tickerNotifications() {
		SseEmitter sseEmitter = new SseEmitter();
		emitters.add(sseEmitter);
		sseEmitter.onCompletion(() -> emitters.remove(sseEmitter));
		return sseEmitter;
	}
	
	@RequestMapping(value = "/sendNotification", method = RequestMethod.POST)
	public void  sendNotification(HttpServletRequest request, @RequestParam String courseName, @RequestParam String topicName, @RequestParam String topicUrl) {
		//String controllerMapping = this.getClass().getAnnotation(RequestMapping.class).value()[0];
		//System.out.println(controllerMapping);
		int empId = Integer.parseInt(request.getParameter("id"));
		int courseLevel = Integer.parseInt(request.getParameter("courseLevel")); 
		Employee employee = employeeService.getEmployee(empId);
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		Ticker currentUser = new Ticker();
		String tickerJSONString = new String();
		Gson gson = new Gson();
		List<Ticker> coursesCompletedByuser = tickerService.getCoursesCompleted(empId,courseName);
		if(!coursesCompletedByuser.isEmpty()) {
			currentUser =coursesCompletedByuser.get(0);
			if(currentUser!=null) {
				if(currentUser.getCourseLevel() < courseLevel) {
					Ticker newUpdate = new Ticker();
					newUpdate.setCourseLevel(courseLevel);
					newUpdate.setTopicName(topicName);
					newUpdate.setCourseName(courseName);
					newUpdate.setEmployee(employee);
					newUpdate.setTimeStamp(sdf.format(cal.getTime()));
					tickerService.addNotification(newUpdate);
					tickerJSONString = gson.toJson(newUpdate);
				} else if (currentUser.getCourseLevel() > courseLevel || currentUser.getCourseLevel() == courseLevel){
					System.out.println("you already finished this course");
				} 
			} } else {
			Ticker ticker = new Ticker();
			ticker.setCourseName(courseName);
			ticker.setTopicName(topicName);
			ticker.setEmployee(employee);
			ticker.setTimeStamp(sdf.format(cal.getTime()));
			ticker.setCourseLevel(courseLevel);
			tickerService.addNotification(ticker);
			tickerJSONString = gson.toJson(ticker);
		}
		
		if (!(currentUser.getCourseLevel() > courseLevel || currentUser.getCourseLevel() == courseLevel)){
		for (SseEmitter emitter : emitters) {
			try {
				emitter.send(SseEmitter.event().name("tickNotifcication").data(tickerJSONString));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		}
		/*ModelAndView model = new ModelAndView();
		model.addObject("employee",employee);
		model.setViewName("redirect:/"+topicUrl+"?id="+empId);
		return model;*/
		 
	}
	
	@RequestMapping(value = "/showPreviousNotifications", method = RequestMethod.GET)
	public ModelAndView showPreviousNotifications(HttpServletRequest request,HttpServletResponse reponse) {
		int empId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(empId);
		ModelAndView model = new ModelAndView();
		List<Ticker> allNotifications = tickerService.getAllNotifications();
		model.addObject("allNotifications",allNotifications);
		model.addObject("employee", employee);
		model.setViewName("algorithms");
		return model;
		
		
		
	}
}