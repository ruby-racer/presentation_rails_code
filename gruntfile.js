module.exports = function(grunt) {
  grunt.initConfig({
    svgstore: {
      options: {
        cleanupdefs: true
      },
      default : {
        files: {
          'app/assets/images/icons.svg': ['app/assets/images/svgs/*.svg']
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-svgstore');
  grunt.registerTask('default', 'svgstore');
};