
<!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="active">
                      <a class="" ui-sref="Home">
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
                      <a class="" ui-sref="schedule">
                          <i class="icon_genius"></i>
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
                          <i class="icon_desktop"></i>
                          <span>Inst. Structure</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" ui-sref="existingInstituteStructure" >View Structure</a></li>
                          <li ng-show="permissions.alterInstituteStructure"><a class="" href="ModifyInstitueStructure">Modify Structure</a></li>                        
                      </ul>
                  </li>
                  
                   <li  class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>App Manager</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub" >
                          <li ng-show="permissions.authoriseStudent"><a class="" ui-sref="studentRequest" ui-sref-active="active">Student Requests</a></li>
                           <li ng-show="permissions.authoriseTeacher"><a class="" ui-sref="teacherRequest" ui-sref-active="active">Teacher Request </a></li>    
                       <!--    <li ng-if="permissions.authoriseStudent"><a class="" href="#">Edit/Delete Student</a></li> -->
                           <li ng-show="permissions.authoriseStudent"><a class="" ui-sref="addStudentToDivision" ui-sref-active="active">Add Student to Division</a></li>
                           <li ng-show="permissions.authoriseStudent"><a class="" ui-sref="StudenInDivision" ui-sref-active="active">Division's student</a></li>
                         <!--  <li ng-if="permissions.authoriseTeacher"><a class="" href="#">Edit/Delete Teacher</a></li>       -->                 
                      </ul>
                  </li>
                  
                   <li>
                      <a class="" ui-sref="Exams" ui-sref-active="active">
                           <i class="icon_document_alt"></i>
                          <span>Exam</span>
                      </a>
                  </li>
                 
                 
                 
                   <li ng-show="permissions.updateResults">
                      <a class="" ui-sref="result.Exams" ui-sref-active="active">
                           <i class="icon_document_alt"></i>
                             <span>Result</span>
                      </a>
                  </li>
                  
                  
                  
                  
                  
                     <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>Subject Manager</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                           <li><a class="" href="AddEditSubject">Add/Edit Subject</a></li>
                          <li><a class="" href="SubjectInDivision">Division's Subject</a></li>
                                                 
                      </ul>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>Profile</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="teacherShowProfile">View Profile</a></li>                          
                          <li><a class="" href="teacherEditProfile">Edit Profile</a></li>
                          <li><a class="" href="teacherChangePassword">Change Password</a></li>
                      </ul>
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