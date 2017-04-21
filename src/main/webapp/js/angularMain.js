var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) {
    $scope.users=[
        {id:1,name:"柳明1",age:301},
        {id:2,name:"柳明2",age:302},
        {id:3,name:"柳明3",age:303}];
    $scope.abc=function(){
        $scope.users.push({id:4,name:"柳明4",age:304});
    };
});