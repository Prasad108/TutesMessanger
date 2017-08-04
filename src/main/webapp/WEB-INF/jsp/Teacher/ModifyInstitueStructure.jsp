<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<title>Modify Institute Structure </title>
   	    <script>
   	 $(document).ready(function(){

   	
   		$('#disabledInputForClasses').attr('disabled','disabled'); 

   		
		
   		       
   	    $('#SelectBranch').on('change',function(){

   	    	var conceptName = $(this).find(":selected").text();
   	    	
   	   	    
   	   	    
   	     var  others = $(this).val();
   	        if(others == "Others"){           
   	        $('#disabledInputForClasses').removeAttr('disabled');          
   	         }else{
   	         $('#disabledInputForClasses').attr('disabled','disabled'); 
   	        }  
 
   	      });
   	  });

 
   
    </script>	

   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		
   		

</head>
<body>
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" /> 

 <aside>
  <section id="main-content">
          <section class="wrapper">  

 <!--collapse start-->
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
                         				 	
                            				  <form class="form-validate form-horizontal " id="SelectBranch" method="post">
                            				 	<p> Select Branch to which class is to be added</p>
	                            					
	                                     		 	 <select class="form-control input-lg m-bot15" onchange="" form="SelectBranch" id="SelectBranch" >
			                                             <option></option>
			                                             <c:forEach items="${BranchesOfInst}" var="branch" >			                                              
			                                              <option value="${branch.id}">${branch.name}</option>
			                                              </c:forEach>
	                                          		</select>
	                                          		
	                                   <div class="form-group">
	                                      <label class="col-sm-2 control-label">ADD new Class</label>
	                                      <div class="col-sm-10">
	                                          <input class="form-control" id="disabledInputForClasses" type="text" placeholder="Disabled input here..." >
	                                      </div>
                                      </div>
                                          		</form>
                                  			                               		
                              </div>
                          </div>
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
                                      Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anemiakeffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
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