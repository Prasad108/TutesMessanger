
<!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="active">
                      <a class="toggle-IfSmallScreen" ui-sref="Home" >
                          <i class="icon_house_alt"></i>
                          <span>Home{{4+4}}</span>
                      </a>
                  </li>
                
                  <li>
                      <a class="toggle-IfSmallScreen" ui-sref="Schedule" >
                          <i class="icon_genius"></i>
                          <span>Schedule</span>
                      </a>
                  </li>
              
              	  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>Profile</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="toggle-IfSmallScreen" href="studentShowProfile">View Profile</a></li>                          
                          <li><a class="toggle-IfSmallScreen" href="studentEditProfile">Edit Profile</a></li>
                           <li><a class="toggle-IfSmallScreen" href="studentChangePassword">Change Password</a></li> 
                          <!-- <li><a class="" href="studentChangePass">Change Password</a></li> -->
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