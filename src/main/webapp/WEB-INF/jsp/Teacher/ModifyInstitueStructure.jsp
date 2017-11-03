<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<title>Modify Institute Structure </title>

   	    <script>
   	 $(document).ready(function(){

   	
   		$('#disabledInputForClasses').attr('disabled','disabled'); 

   		$('#disabledSelectForClassesInAddDividion').attr('disabled','disabled'); 

   		$('#AddNewClassSaveBTN').attr('disabled','disabled'); 

   	   $('#saveDivisionSubmitBTN').attr('disabled','disabled'); 

   	 $('#disabledInputForDivisionName').attr('disabled','disabled');

   	
   		
   	//----------------select branch in Add Division-------------- 
	   	$('#SelectBranch2').change(function() {
	   	   

	   	 var  others = $(this).find(":selected").val();
	        if(others != 0){      

	        	 $.getJSON("GetClassesList/"+$(this).find(":selected").val(), function(jsonData){
	        	     cb = '';
	        	     $.each(jsonData, function(i,data){
	        	         cb+='<option value="'+data.value+'">'+data.name+'</option>';
	        	     });
	        	     $("#disabledSelectForClassesInAddDividion").html(cb);
	        	});	
		        		            
	   		     $('#disabledSelectForClassesInAddDividion').removeAttr('disabled'); 
	   		     	                      
	         }else{
	         $('#disabledSelectForClassesInAddDividion').attr('disabled','disabled'); 
	         $('#disabledInputForDivisionName').attr('disabled','disabled'); 
	         $('#saveDivisionSubmitBTN').attr('disabled','disabled'); 
	     
	        }  
	   	});



	  //----------------select Class in Add Division-------------- 

	   	$('#disabledSelectForClassesInAddDividion').on('change',function(){
	   	 var  others = $(this).find(":selected").val();

	   	if(others != 0){           
   	        $('#saveDivisionSubmitBTN').removeAttr('disabled'); 
   	     $('#disabledInputForDivisionName').removeAttr('disabled');   
   	               
   	         }else{
   	         $('#saveDivisionSubmitBTN').attr('disabled','disabled'); 
   	      $('#disabledInputForDivisionName').attr('disabled','disabled'); 
   	        }  
	   	 
	    });


	  //----------------select branch in Add Class-------------- 
   		       
   	    $('#SelectBranch').on('change',function(){
  	   	    
   	     var  others = $(this).find(":selected").val();
   	        if(others != 0){           
   	        $('#disabledInputForClasses').removeAttr('disabled'); 
   	     $('#AddNewClassSaveBTN').removeAttr('disabled');   
   	               
   	         }else{
   	         $('#disabledInputForClasses').attr('disabled','disabled'); 
   	      $('#AddNewClassSaveBTN').attr('disabled','disabled'); 
   	        }  
 
   	      });

 	      
   	  });

 
   
    </script>	

   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		
<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />
</head>
<body >
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" /> 

 <aside>
  <section id="main-content">
          <section class="wrapper">  
          
          <c:if test="${!empty ErrorMessage}">
  					  <div class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                <strong> ${ErrorMessage} </strong> 
                              </div>
		</c:if>
		 <c:if test="${!empty SaveSuccessMessage}">
  					  <div class="alert alert-success fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>${SaveSuccessMessage}</strong> 
                              </div>
		</c:if>	

 <!--collapse start-->
<!-- -----------------------------    Add Branch to Institute  ---------------------------------->  
                      <div class="panel-group m-bot20" id="accordion">
                          <div class="panel panel-primary">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                          Add Branch to Institute 
                                      </a>
                                  </h4>
                              </div>
                              <div id="collapseOne" class="panel-collapse collapse in">
                                  <div class="panel-body">
			                                  
			                                     <div class="form">
			                                      <form:form class="form-validate form-horizontal " id="register_form" method="post" action="AddNewBranch" modelAttribute="Branch">
			                                  
					                                      <div class="form-group ">
					                                          <label for="cname" class="control-label col-lg-2">New Branch Name <span class="required">*</span></label>
					                                          <div class="col-lg-10">
					                                              <form:input path="name" class="form-control" id="Branch" name="branch" maxlength="50" type="text" required="required" />
					                                          </div>
					                                      </div>
					                                     
					                                      <div class="form-group">
					                                          <div class="col-lg-offset-2 col-lg-10">
					                                              <button class="btn btn-primary" type="submit">Add Branch</button>
					                                          </div>
					                                      </div>
			                                       </form:form>
			                                  
			                              </div>
			                                
                                  </div>
                              </div>
                          </div>
 <!-- -----------------------------   Add Class into Branch ---------------------------------->                          
                          <div class="panel panel-success">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                        Add Class into Branch
                                      </a>
                                  </h4>
                              </div>
                              <div id="collapseTwo" class="panel-collapse collapse">
				                  <div class="panel-body">
				
										<form:form modelAttribute="Classes" class="form-validate form-horizontal " id="SelectBranch" action="AddNewClass" method="POST">
											<div class="form-group ">
											
												<label for="fullname" class="control-label col-lg-2">Select The Branch 
												 <span class="required">*</span>
												</label>
												<div class="col-lg-10">
													<form:select path="branch.id" class="form-control input-lg m-bot15" onchange="" form="SelectBranch" id="SelectBranch">
														<option value="0">--- Select Branch---</option>
														<c:forEach items="${BranchesOfInst}" var="branch">
															<option value="${branch.id}">${branch.name}</option>
														</c:forEach>
													</form:select>
												</div>
												
													 <label for="fullname" class="control-label col-lg-2">Add new Class <span class="required">*</span></label>
													<div class="col-lg-10">
														<form:input path="name" class="form-control" id="disabledInputForClasses" type="text" placeholder="Add new class" required="required" />
													</div>								
											</div>
											<div class="form-group">
			                                          <div class="col-lg-offset-2 col-lg-10">
			                                              <button class="btn btn-primary" id="AddNewClassSaveBTN"type="submit">Add Class</button>
			                     					 </div>
			                                </div>
										</form:form>
					
								</div>
                          </div>
                          </div>
                          
                          
                          
 <!-- -----------------------------   Add Division into Class ---------------------------------->
 
                          <div class="panel panel-warning">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                           Add Division into Class
                                      </a>
                                  </h4>
                              </div>
                              <div id="collapseThree" class="panel-collapse collapse">
                                  <div class="panel-body">
                                     
										<form:form modelAttribute="Division" class="form-validate form-horizontal " id="AddNewDivision" action="AddNewDivision" method="POST">
											<div class="form-group ">
											
												<label for="fullname" class="control-label col-lg-2">Select The Branch 
												 <span class="required">*</span>
												</label>
												<div class="col-lg-10">
													<form:select path="classes.branch.id" class="form-control input-lg m-bot15 "  form="AddNewDivision" id="SelectBranch2">
														<option value="0">--- Select Branch---</option>
														<c:forEach items="${BranchesOfInst}" var="branch">
															<option value="${branch.id}">${branch.name}</option>
														</c:forEach>
													</form:select>
												</div>
												
													 <label for="fullname" class="control-label col-lg-2">Select the Class <span class="required">*</span></label>
													<div class="col-lg-10">
														<form:select path="classes.id" class="form-control m-bot15" id="disabledSelectForClassesInAddDividion" type="text" placeholder="Add new class" required="required" >
															<option value="0">--- Select Class---</option>
														</form:select>
													</div>		
													
													 <label for="fullname" class="control-label col-lg-2">Add new Division <span class="required">*</span></label>
													<div class="col-lg-10">
														<form:input path="name" class="form-control" id="disabledInputForDivisionName" type="text" placeholder="Add new class" required="required" />
													</div>
																			
											</div>
											<div class="form-group">
			                                          <div class="col-lg-offset-2 col-lg-10">
			                                              <button class="btn btn-primary" id="saveDivisionSubmitBTN" type="submit">Add Class</button>
			                     					 </div>
			                                </div>
										</form:form>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <!--collapse end-->
                      
  
    </section>   
   </section> 
    </aside>  
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->                    

</body>
</html>