
<!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="active">
                      <a class="toggle-IfSmallScreen" ui-sref="Home">
                          <i class="icon_house_alt"></i>
                          <span>Home{{4+4}}</span>
                      </a>
                  </li>
                 <!--   <li>
                      <a class="" href="#">
                          <i class="icon_genius"></i>
                          <span>Messages</span>
                      </a>
                  </li>
                  <li>
                      <a class="" href="#">
                          <i class="icon_genius"></i>
                          <span>Emails</span>
                      </a>
                  </li> -->
                  <li>
                      <a class="toggle-IfSmallScreen" ui-sref="schedule">
                         <i class="far fa-calendar-alt"></i>
                          <span>Schedule</span>
                      </a>
                  </li>
                   <!-- <li>
                      <a class="" href="#">
                          <i class="icon_genius"></i>
                          <span>Attendance</span>
                      </a>
                  </li> -->
                   <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="fa fa-university"></i>
                          <span>Inst. Structure</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="toggle-IfSmallScreen" ui-sref="existingInstituteStructure" >View Structure</a></li>
                          <li ng-show="permissions.alterInstituteStructure"><a class="toggle-IfSmallScreen" ui-sref="ModifyInstituteStructure">Modify Structure</a></li>                        
                      </ul>
                  </li>
                  
                   <li  class="sub-menu">
                      <a href="javascript:;" class="">
                         <i class="fas fa-user-tie"></i>
                          <span>App Manager</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub" >
                          <li ng-show="permissions.authoriseStudent"><a class="toggle-IfSmallScreen" ui-sref="studentRequest" ui-sref-active="active">Student Requests</a></li>
                           <li ng-show="permissions.authoriseTeacher"><a class="toggle-IfSmallScreen" ui-sref="teacherRequest" ui-sref-active="active">Teacher Request </a></li>    
                       <!--    <li ng-if="permissions.authoriseStudent"><a class="" href="#">Edit/Delete Student</a></li> -->
                           <li ng-show="permissions.authoriseStudent"><a class="toggle-IfSmallScreen" ui-sref="addStudentToDivision" ui-sref-active="active">Add Student to Division</a></li>
                           <li ng-show="permissions.authoriseStudent"><a class="toggle-IfSmallScreen" ui-sref="StudenInDivision" ui-sref-active="active">Division's student</a></li>
                         <!--  <li ng-if="permissions.authoriseTeacher"><a class="" href="#">Edit/Delete Teacher</a></li>       -->                 
                      </ul>
                  </li>
                  
                   <li>
                      <a class="toggle-IfSmallScreen" ui-sref="Exams" ui-sref-active="active">
                           <i class="fab fa-etsy"></i>
                          <span>Exam</span>
                      </a>
                  </li>
                 
                 
                 
                   <li ng-show="permissions.updateResults">
                      <a class="toggle-IfSmallScreen" ui-sref="result.Exams" ui-sref-active="active">
                         <i class="fas fa-graduation-cap"></i>
                             <span>Result</span>
                      </a>
                  </li>
                   <li ng-show="permissions.updateResults">
                      <a class="toggle-IfSmallScreen" ui-sref="paginationTest" ui-sref-active="active">
                           <i class="icon_document_alt"></i>
                             <span>paginationTest</span>
                      </a>
                  </li>
                  
                  
                  
                  
                  
                     <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="fa fa-book" aria-hidden="true"></i>
                          <span>Subject Manager</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                           <li><a class="toggle-IfSmallScreen" ui-sref="subject.addEdit" ui-sref-active="active">Add/Edit Subject</a></li>
                          <li><a class="toggle-IfSmallScreen" ui-sref="subject.divisionSubjects" ui-sref-active="active">Division's Subject</a></li>
                                                 
                      </ul>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="fa fa-user-circle" aria-hidden="true"></i>
                          <span>Profile</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="toggle-IfSmallScreen" ui-sref="profile.view" ui-sref-active="active">View Profile</a></li>                          
                          <!-- <li><a class="" ui-sref="profile.edit" ui-sref-active="active">Edit Profile</a></li> -->
                          <li><a class="toggle-IfSmallScreen" ui-sref="ChangeUsername" ui-sref-active="active">Change Username</a></li>
                          <li><a class="toggle-IfSmallScreen" ui-sref="ChangePassword" ui-sref-active="active">Change Password</a></li>
                      </ul>
                  </li>  
                  <li>
                      <a class="toggle-IfSmallScreen" ui-sref="sms" ui-sref-active="active">
                          <i class="far fa-envelope"></i>
                          <span>SMS</span>
                      </a>
                  </li> 
                  
                  <li>
                      <a class="toggle-IfSmallScreen" ui-sref="sns" ui-sref-active="active">
                          <i class="far fa-envelope"></i>
                          <span>SNS testing</span>
                      </a>
                  </li>   
                  
                    
                   <li>
                      <a class="" href="${pageContext.request.contextPath}/logout" >
                          <i class="icon_key_alt"></i>
                          <span>Log Out</span>
                      </a>
                  </li>                                                      				                    
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->