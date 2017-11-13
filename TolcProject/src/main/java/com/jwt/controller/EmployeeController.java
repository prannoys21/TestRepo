package com.jwt.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.model.Chat;
import com.jwt.model.Course;
import com.jwt.model.Employee;
import com.jwt.model.Ticker;
import com.jwt.service.ChatService;
import com.jwt.service.CourseService;
import com.jwt.service.EmployeeService;
import com.jwt.service.TickerService;

@Controller
public class EmployeeController {

	private static final Logger logger = Logger
			.getLogger(EmployeeController.class);

	public EmployeeController() {
		System.out.println("EmployeeController()");
	}

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private TickerService tickerService;
	
	

	@RequestMapping(value = "/")
	public ModelAndView listEmployee(ModelAndView model) throws IOException {
		List<Employee> listEmployee = employeeService.getAllEmployees();
		model.addObject("listEmployee", listEmployee);
		model.setViewName("welearn-home");
		return model;
	}
	


	@RequestMapping(value = "/newEmployee", method = RequestMethod.GET)
	public ModelAndView newContact(ModelAndView model) {
		Employee employee = new Employee();
		model.addObject("employee", employee);
		model.setViewName("signUpPage");
		return model;
	}


	@RequestMapping(value = "/saveEmployee", method = RequestMethod.POST)
	public ModelAndView saveEmployee(@ModelAttribute Employee employee) {
		if (employee.getId() == 0) { // if employee id is 0 then creating the
			// employee other updating the employee
			employeeService.addEmployee(employee);
			return new ModelAndView("redirect:/loginPage");
		} else {
			employeeService.updateEmployee(employee);
			ModelAndView model = new ModelAndView("postLogin");
			model.addObject("employee", employee);
			return model;
		}
		
	}

	@RequestMapping(value = "/deleteEmployee", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(HttpServletRequest request) {
		int employeeId = Integer.parseInt(request.getParameter("id"));
		employeeService.deleteEmployee(employeeId);
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/editEmployee", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) {
		int employeeId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(employeeId);
		ModelAndView model = new ModelAndView("editProfilePage");
		model.addObject("employee", employee);

		return model;
	}
	
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public ModelAndView loginPage(ModelAndView model) {
		Employee employee = new Employee();
		model.addObject("employee", employee);
		model.setViewName("loginPage");
		return model;
	}
	
	@RequestMapping(value = "/loginPage", method = RequestMethod.POST)
	public ModelAndView validateUser(HttpServletRequest request, @ModelAttribute Employee employee, BindingResult result, SessionStatus status) {
		DecimalFormat df2 = new DecimalFormat(".##");
		double overallProgress = 0.0;
		boolean error = false;
		System.out.println(employee);
		if(employee.getUserName().isEmpty()){
		        result.rejectValue("userName", "userName.required");
		        error = true;
		}
		if(employee.getPassword().isEmpty()){
	        result.rejectValue("password", "password.required");
	        error = true;
		}
		String userName = request.getParameter("userName");
		String password= request.getParameter("password"); 
		Employee employee2 = employeeService.validateUser(userName,password);
		if(employee2 == null && !employee.getPassword().isEmpty() && !employee.getUserName().isEmpty()) {
			result.rejectValue("password", "combinationWrong");
			error = true;
		}
		ModelAndView model = new ModelAndView();
		if(error) {
			model.setViewName("loginPage");
			return model;
		} else {
			model.setViewName("postLogin");
			List<Chat> sentMessageList = chatService.getSentMessageCount(employee2.getId());
			List<Chat> receivedMessageList = chatService.getReceivedMessageCount(employee2.getId());
			List<Ticker> algoTopics = tickerService.getAlgoTopicsCompleted(employee2.getId());
			List<Ticker> dbTopics = tickerService.getDbmsTopicsCompleted(employee2.getId());
			List<Ticker> osTopics = tickerService.getOsTopicsCompleted(employee2.getId());
			Map<String,Integer>  topicWiseHelpingCountAlgorithms = chatService.getTopicWiseHelpingCount(employee2.getId(),"Algorithms");
			Map<String,Integer>  topicWiseHelpingCountDatabases = chatService.getTopicWiseHelpingCount(employee2.getId(),"Databases");
			Map<String,Integer>  topicWiseHelpingCountOperatingSystems = chatService.getTopicWiseHelpingCount(employee2.getId(),"Operating Systems");
			int numberOfPeopleHelped = chatService.getListOfUsersHelped(employee2.getId());
			int algoLevel =0 ;
			int dbLevel =0 ;
			int osLevel = 0;
			int sentCount =0 ;
			int receivedCount=0;
			if(!algoTopics.isEmpty()) {
				algoLevel = algoTopics.get(0).getCourseLevel();
			}
			if(!dbTopics.isEmpty()) {
				dbLevel = dbTopics.get(0).getCourseLevel();
			}
			if(!osTopics.isEmpty()) {
				osLevel = osTopics.get(0).getCourseLevel();
			}
			overallProgress = (double)(algoLevel + dbLevel + osLevel)/12;
			if(!sentMessageList.isEmpty()) {
				sentCount = sentMessageList.size();
			}
			if(!receivedMessageList.isEmpty()) {
				receivedCount = receivedMessageList.size();
			}
			double socialLearningRate = (double) numberOfPeopleHelped/(algoLevel + dbLevel + osLevel);
			model.addObject("employee", employee2);
			model.addObject("topicWiseHelpingCountAlgorithms", topicWiseHelpingCountAlgorithms);
			model.addObject("topicWiseHelpingCountDatabases", topicWiseHelpingCountDatabases);
			model.addObject("topicWiseHelpingCountOperatingSystems", topicWiseHelpingCountOperatingSystems);
			model.addObject("socialLearningRate", df2.format(socialLearningRate));
			model.addObject("sentCount", sentCount);
			model.addObject("receivedCount", receivedCount);
			model.addObject("algoLevel", algoLevel);
			model.addObject("dbLevel", dbLevel);
			model.addObject("osLevel", osLevel);
			model.addObject("overallProgress", df2.format(overallProgress*100));
			status.setComplete();
			return model;
		}
	}
	
	@RequestMapping(value = "/userHomepage", method = RequestMethod.GET)
	public ModelAndView userHomepage(HttpServletRequest request) {
		DecimalFormat df2 = new DecimalFormat(".##");
		double overallProgress = 0.0;
		int empId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(empId);
		ModelAndView model = new ModelAndView();
		List<Chat> sentMessageList = chatService.getSentMessageCount(empId);
		List<Chat> receivedMessageList = chatService.getReceivedMessageCount(empId);
		List<Ticker> algoTopics = tickerService.getAlgoTopicsCompleted(empId);
		List<Ticker> dbTopics = tickerService.getDbmsTopicsCompleted(empId);
		List<Ticker> osTopics = tickerService.getOsTopicsCompleted(empId);
		Map<String,Integer> topicWiseHelpingCountAlgorithms = chatService.getTopicWiseHelpingCount(empId,"Algorithms");
		Map<String,Integer>  topicWiseHelpingCountDatabases = chatService.getTopicWiseHelpingCount(empId,"Databases");
		Map<String,Integer>  topicWiseHelpingCountOperatingSystems = chatService.getTopicWiseHelpingCount(empId,"Operating Systems");
		int numberOfPeopleHelped = chatService.getListOfUsersHelped(empId);
		
		int algoLevel =0 ;
		int dbLevel =0 ;
		int osLevel = 0;
		int sentCount =0 ;
		int receivedCount=0;
		if(!sentMessageList.isEmpty()) {
			sentCount = sentMessageList.size();
		}
		if(!receivedMessageList.isEmpty()) {
			receivedCount = receivedMessageList.size();
		}
		if(!algoTopics.isEmpty()) {
			algoLevel = algoTopics.get(0).getCourseLevel();
		}
		if(!dbTopics.isEmpty()) {
			dbLevel = dbTopics.get(0).getCourseLevel();
		}
		if(!osTopics.isEmpty()) {
			osLevel = osTopics.get(0).getCourseLevel();
		}
		overallProgress = (double)(algoLevel + dbLevel + osLevel)/12;
		double socialLearningRate = (double) numberOfPeopleHelped/(algoLevel + dbLevel + osLevel);
		
		model.addObject("algoLevel", algoLevel);
		model.addObject("topicWiseHelpingCountAlgorithms", topicWiseHelpingCountAlgorithms);
		model.addObject("topicWiseHelpingCountDatabases", topicWiseHelpingCountDatabases);
		model.addObject("topicWiseHelpingCountOperatingSystems", topicWiseHelpingCountOperatingSystems);
		model.addObject("dbLevel", dbLevel);
		model.addObject("osLevel", osLevel);
		model.addObject("overallProgress", df2.format(overallProgress*100));
		model.addObject("socialLearningRate", df2.format(socialLearningRate));
		model.addObject("employee", employee);
		model.addObject("sentCount", sentCount);
		model.addObject("receivedCount", receivedCount);
		model.setViewName("postLogin");
		return model;
	}
	
	
	
	@RequestMapping(value = "/chatAndLearn", method = RequestMethod.GET)
	public ModelAndView chatAndLearn(HttpServletRequest request,HttpServletResponse reponse) {
		int empId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(empId);
		ModelAndView model = new ModelAndView();
		List<Chat> allMessages = chatService.getAllMessages();
		Integer messageCount = chatService.getMessageCount();
		model.addObject("allMessages",allMessages);
		model.addObject("messageCount",messageCount);
		model.addObject("employee", employee);
		model.setViewName("chatAndLearn");
		return model;
		
		
		
	}
	
	@RequestMapping(value = "/courseList", method = RequestMethod.GET)
	public ModelAndView showCoursesList(HttpServletRequest request) {
		int empId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(empId);
		ModelAndView model = new ModelAndView();
		model.addObject("employee", employee);
		model.setViewName("courseList");
		return model;
	}
	
	@RequestMapping(value = "/enrollUser", method = RequestMethod.POST)
	public ModelAndView enrollUser(HttpServletRequest request,@RequestParam String courseName) {
		//String courseName = request.getParameter("courseName");
		int empId = Integer.parseInt(request.getParameter("id"));
		Employee employee = employeeService.getEmployee(empId);
		Course  course = new Course();
		course.setEmployee(employee);
		course.setCourseName(courseName);
		course.setCourseTopicNumber(0);
		courseService.addCourse(course);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("courseList");
		modelAndView.addObject("course", course);
		modelAndView.addObject("employee", employee);
		return modelAndView;
		
	}
	
	
	@RequestMapping(value = "/initialPage", method = RequestMethod.GET)
	public ModelAndView initialPage(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		model.setViewName("welearn-home");
		return model;
	}
	
	@RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
	public ModelAndView aboutUs(HttpServletRequest request) {
		Employee employee = new Employee();
		ModelAndView model = new ModelAndView();
		model.addObject("employee", employee);
		model.setViewName("aboutUs");
		return model;
	}
	
	@RequestMapping(value = "/customers", method = RequestMethod.GET)
	public ModelAndView customers(HttpServletRequest request) {
		Employee employee = new Employee();
		ModelAndView model = new ModelAndView();
		model.addObject("employee", employee);
		model.setViewName("customers");
		return model;
	}

}