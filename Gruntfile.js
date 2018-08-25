/*global module:false*/
module.exports = function(grunt) {

	// Project configuration.
	grunt
			.initConfig({
				concat : {
					options : {
						separator : ';',
					},
					appAdmin : {
						src : [ 'src/main/webapp/app/appAdmin/app.js',
								'src/main/webapp/app/appAdmin/**/*.js' ],
						dest : 'src/main/webapp/app/appAdmin/appAdminAllCompomentsAndControllers.js',
					},
					commanDirectives : {
						src : [ 'src/main/webapp/app/commanDirectives/**/*.js' ],
						dest : 'src/main/webapp/app/commanDirectives/AllcommanDirectives.js',
					},
					commanService : {
						src : [ 'src/main/webapp/app/commanService/**/*.js' ],
						dest : 'src/main/webapp/app/commanService/AllcommanService.js',
					},
					student : {
						src : [ 'src/main/webapp/app/student/app.js',
							'src/main/webapp/app/student/**/*.js' ],
						dest : 'src/main/webapp/app/student/appStudentAllCompomentsAndControllers.js',
					},
					teacher : {
						src : [ 'src/main/webapp/app/teacher/app.js',
							'src/main/webapp/app/teacher/**/*.js' ],
						dest : 'src/main/webapp/app/teacher/appTeacherAllCompomentsAndControllers.js',
					},

				},
				clean : {
					build : {
						options : {
							force : true
						},
						src : [
								'src/main/webapp/app/appAdmin/appAdminCompomentsAndControllers.js',
								'src/main/webapp/app/commanDirectives/AllcommanDirectives.js',
								'src/main/webapp/app/commanService/AllcommanService.js',
								'src/main/webapp/app/student/appStudentCompomentsAndControllers.js',
								'src/main/webapp/app/teacher/appTeacherCompomentsAndControllers.js']
					}
				},watch: {
				    files: ['src/main/webapp/app/**/*.js','!src/main/webapp/app/**/*All*.js'],
				    tasks: ['default'],
				  },
			});

	// These plugins provide necessary tasks.
	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-watch');
	// grunt.loadNpmTasks('grunt-contrib-jshint');

	// Default task.
	grunt.registerTask('default', [ 'clean', 'concat' ]);

};
