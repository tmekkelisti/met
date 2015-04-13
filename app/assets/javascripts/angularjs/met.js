var met = angular.module('met', []);

met.controller("StoriesController", function($scope, $http){
   $http.get('stories.json').success(function(data, status, headers, config){
       $scope.stories = data;
   });
});