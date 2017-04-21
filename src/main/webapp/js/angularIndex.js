var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) {
    $scope.panelShow=[true,false,false,false];
    $scope.updateShow=false;
    $scope.currentNav=0;
    $scope.navList=[
        {title:"用户管理"},
        {title:"角色管理"},
        {title:"权限管理"},
        {title:"授权管理"}
    ];
    $scope.navChange=function(index){
        $scope.currentNav=index;
    };
});