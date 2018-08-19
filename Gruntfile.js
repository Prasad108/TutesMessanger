/*global module:false*/
module.exports = function(grunt) {

	// Project configuration.
	grunt
			.initConfig({
				concat : {
					options : {
						separator : ';',
					},
					dist : {
						src : [ 'src/main/webapp/app/appAdmin/app.js',
								'src/main/webapp/app/appAdmin/**/*.js' ],
						dest : 'src/main/webapp/app/appAdmin/appAdminCompomentsAndControllers.js',
					},
				},
				clean : {
					build : {
						options : {
							force : true
						},
						src : [ 'src/main/webapp/app/appAdmin/appAdminCompomentsAndControllers.js' ]
					}
				},
			});

	// These plugins provide necessary tasks.
	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-contrib-concat');
	// grunt.loadNpmTasks('grunt-contrib-jshint');

	// Default task.
	grunt.registerTask('default', [ 'clean', 'concat' ]);

};
