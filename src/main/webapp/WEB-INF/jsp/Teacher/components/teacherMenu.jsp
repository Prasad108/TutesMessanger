
<!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="active">
                      <a class="" href="TeacherHome">
                          <i class="icon_house_alt"></i>
                          <span>Home{{4+4}}</span>
                      </a>
                  </li>
                   <li>
                      <a class="" href="widgets.html">
                          <i class="icon_genius"></i>
                          <span>Messages</span>
                      </a>
                  </li>
                  <li>
                      <a class="" href="widgets.html">
                          <i class="icon_genius"></i>
                          <span>Emails</span>
                      </a>
                  </li>
                  <li>
                      <a class="" href="scheduletree">
                          <i class="icon_genius"></i>
                          <span>Schedule</span>
                      </a>
                  </li>
                   <li>
                      <a class="" href="widgets.html">
                          <i class="icon_genius"></i>
                          <span>Attendance</span>
                      </a>
                  </li>
                   <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>Inst. Structure</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="ViewInstitueStructure">View Structure</a></li>
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
                          <li ng-show="permissions.authoriseStudent"><a class="" href="#">Student Requests</a></li>
                           <li ng-show="permissions.authoriseTeacher"><a class="" href="TeacherRequestForApproval">Teacher Request </a></li>    
                          <li ng-show="permissions.authoriseStudent"><a class="" href="#">Edit/Delete Student</a></li>
                          <li ng-show="permissions.authoriseTeacher"><a class="" href="#">Edit/Delete Teacher</a></li>                       
                      </ul>
                  </li>
                  <li>
                      <a class="" href="widgets.html">
                          <i class="icon_genius"></i>
                          <span>Request Approver</span>
                      </a>
                  </li>
                  
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>Profile</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="form_component.html">View Profile</a></li>                          
                          <li><a class="" href="form_validation.html">Edit Profile</a></li>
                          <li><a class="" href="teacherChangePassword">Change Password</a></li>
                      </ul>
                  </li>                                                        				                    
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->