// app.js
var app = angular.module('app', ['ui.router', 'ngMaterial']);

routerApp.config(function($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/');

    // PATH TO TEMPLATES =======================================================
    var $path = '../../templates/';

    $stateProvider

        // HOME STATES AND NESTED VIEWS ========================================
        .state('home', {
            url: '/',
            templateUrl: path+'home.html'
        })

        // ABOUT PAGE AND MULTIPLE NAMED VIEWS =================================
        .state('about', {
            url: '/about',
            templateUrl: path+'about.html'
        });

});