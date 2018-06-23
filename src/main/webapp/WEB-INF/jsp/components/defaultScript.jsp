	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.4.min.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script> --%>
  <%--   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.9.2.custom.min.js"></script> --%>
    <!-- bootstrap -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="${pageContext.request.contextPath}/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- charts 
    <script src="${pageContext.request.contextPath}/assets/jquery-knob/js/jquery.knob.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.sparkline.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script> scripts -->
    <script src="${pageContext.request.contextPath}/js/owl.carousel.js" ></script>
    <!-- jQuery full calendar 
    <script src="${pageContext.request.contextPath}/js/fullcalendar.min.js"></script> 
	<script src="${pageContext.request.contextPath}/assets/fullcalendar/fullcalendar/fullcalendar.js"></script> -->
    <!--script for this page only-->
 <%--    <script src="${pageContext.request.contextPath}/js/calendar-custom.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.rateit.min.js"></script> --%>
    <!-- custom select -->
    <%--<script src="${pageContext.request.contextPath}/js/jquery.customSelect.min.js" ></script>
	 <script src="${pageContext.request.contextPath}/assets/chart-master/Chart.js"></script> --%>
   
    <!--custome script for all page-->
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
   
   
    <!-- custom script for this page-->
   
   

	<%-- <script src="${pageContext.request.contextPath}/js/xcharts.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.autosize.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.placeholder.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/morris.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/sparklines.js"></script>	
	
	<script src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script> --%>
	
	<%--
	<script src="${pageContext.request.contextPath}/js/sparkline-chart.js"></script>
	<script src="${pageContext.request.contextPath}/js/easy-pie-chart.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="${pageContext.request.contextPath}/js/gdp-data.js"></script>
	<script src="${pageContext.request.contextPath}/js/charts.js"></script> --%>

<!-- 	<script src="${pageContext.request.contextPath}/assets/angular.min.js"></script> -->
	
	
	
	  <script src="${pageContext.request.contextPath}/js/pikaday.js"></script>
	  
	  <script>
   /*!
    * Pikaday jQuery plugin.
    *
    * Copyright © 2013 David Bushell | BSD & MIT license | https://github.com/dbushell/Pikaday
    */

   (function (root, factory)
   {
       'use strict';

       if (typeof exports === 'object') {
           // CommonJS module
           factory(require('jquery'), require('pikaday'));
       } else if (typeof define === 'function' && define.amd) {
           // AMD. Register as an anonymous module.
           define(['jquery', 'pikaday'], factory);
       } else {
           // Browser globals
           factory(root.jQuery, root.Pikaday);
       }
   }(this, function ($, Pikaday)
   {
       'use strict';

       $.fn.pikaday = function()
       {
           var args = arguments;

           if (!args || !args.length) {
               args = [{ }];
           }

           return this.each(function()
           {
               var self   = $(this),
                   plugin = self.data('pikaday');

               if (!(plugin instanceof Pikaday)) {
                   if (typeof args[0] === 'object') {
                       var options = $.extend({}, args[0]);
                       options.field = self[0];
                       self.data('pikaday', new Pikaday(options));
                   }
               } else {
                   if (typeof args[0] === 'string' && typeof plugin[args[0]] === 'function') {
                       plugin[args[0]].apply(plugin, Array.prototype.slice.call(args,1));

                       if (args[0] === 'destroy') {
                           self.removeData('pikaday');
                       }
                   }
               }
           });
       };

   }));
   
   </script>
	
<!-- 	
  <script>

      //knob
      $(function() {
        $(".knob").knob({
          'draw' : function () { 
            $(this.i).val(this.cv + '%')
          }
        })
      });

      //carousel
      $(document).ready(function() {
          $("#owl-slider").owlCarousel({
              navigation : true,
              slideSpeed : 300,
              paginationSpeed : 400,
              singleItem : true

          });
      });

      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });
	  
	  /* ---------- Map ---------- */
	$(function(){
	  $('#map').vectorMap({
	    map: 'world_mill_en',
	    series: {
	      regions: [{
	        values: gdpData,
	        scale: ['#000', '#000'],
	        normalizeFunction: 'polynomial'
	      }]
	    },
		backgroundColor: '#eef3f7',
	    onLabelShow: function(e, el, code){
	      el.html(el.html()+' (GDP - '+gdpData[code]+')');
	    }
	  });
	});

  </script> -->