import './css/admin.css';
import './js/bootstrap.min.js';
import './js/common.js';

import angular from 'angular';
import angularUiRouter from 'angular-ui-router';
import angularNgResource from 'angular-resource';
import railsResource from './admin/js/rails-resource.js'
import angularBreadcrumb from './admin/js/angular-breadcrumb.js';
import checkListModel from './admin/js/checklist-model.js';
import ngFileUpload from 'ng-file-upload';

// import fileUploader from './admin/js/fileUploader.js';
import catalogController from './admin/js/catalogController.js';
import productsController from './admin/js/productsController.js';
import productsCategoriesController from './admin/js/productsCategoriesController.js';

import productsDetailsController from './admin/js/productsDetailsController.js';
import ordersController from './admin/js/ordersController.js';
import settingsController from './admin/js/settingsController.js';
import assetsController from './admin/js/assetsController.js';



let catalog = angular.module('catalog', []);
catalog.controller('catalogController', catalogController);

let settings = angular.module('settings', []);
settings.controller('settingsController', settingsController);

let assets = angular.module('assets', []);
assets.controller('assetsController', assetsController);

let products = angular.module('products', []);
products.controller('productsController', productsController);

let productsCategories = angular.module('productsCategories', []);
productsCategories.controller('productsCategoriesController', productsCategoriesController);

let productsDetails = angular.module('productsDetails', []);
productsDetails.controller('productsDetailsController', productsDetailsController);

let orders = angular.module('orders', []);
orders.controller('ordersController', ordersController);

let myApp = angular.module('myApp', ['ui.router', 'ngResource', 'rails', 'settings', 'catalog', 'products', 'productsCategories', 'orders', 'assets', 'productsDetails', 'ncy-angular-breadcrumb', 'checklist-model', 'ngFileUpload']);

myApp.factory('Product', ['railsResourceFactory', function(railsResourceFactory) {
    return railsResourceFactory({
        url: '/admin/products',
        name: 'product'
    });
}]);

myApp.factory('productsCategory', ['railsResourceFactory', function(railsResourceFactory) {
    return railsResourceFactory({
        url: '/admin/products_categories',
        name: 'products_category',
        pluralName: 'products_categories'
    });
}]);

myApp.factory('Order', ['railsResourceFactory', function(railsResourceFactory) {
    return railsResourceFactory({
        url: '/admin/orders',
        name: 'order'
    });
}]);

myApp.factory('Settings', ['railsResourceFactory', function(railsResourceFactory) {
    return railsResourceFactory({
        url: '/admin/settings',
        name: 'settings'
    });
}]);

myApp.factory('Asset', ['railsResourceFactory', function(railsResourceFactory) {
    return railsResourceFactory({
        url: '/admin/assets',
        name: 'asset'
    });
}]);


myApp.config(function($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise("");

    $stateProvider
        .state('root', {
            url: "",
            templateUrl: "../assets/dashboard.html",
            controller: 'productsController',
            ncyBreadcrumb: {
                label: 'Сводка'
            }
        })
        .state('settings', {
            url: "/settings",
            templateUrl: "../assets/settings.html",
            controller: 'settingsController',
            ncyBreadcrumb: {
                label: 'Настройки',
            }
        })
        .state('catalog', {
            url: "/catalog",
            templateUrl: "../assets/catalog.html",
            controller: 'catalogController',
            abstract: true,
            ncyBreadcrumb: {
                label: 'Каталог',
                force: true,
            }
        })
        .state('catalog.products', {
            url: '',
            views: {
                'content': {
                    templateUrl: '../assets/products.html',
                    controller: 'productsController'
                }
            },
            ncyBreadcrumb: {
                label: 'Товары'
            }
        })
        .state('catalog.products.new', {
            url: "/products/new",
            views: {
                '@': {
                    templateUrl: "../assets/productsNew.html",
                    controller: 'productsDetailsController'
                }
            },
            ncyBreadcrumb: {
                label: 'Новый товар'
            }
        })
        .state('catalog.products.edit', {
            url: "/products/:id/edit",
            views: {
                '@': {
                    templateUrl: "../assets/productsForm.html",
                    controller: 'productsDetailsController'
                }
            },
            ncyBreadcrumb: {
                label: 'Редактирование'
            }
        })
        .state('catalog.categories', {
            url: '/categories',
            views: {
                'content': {
                    templateUrl: '../assets/categories.html',
                    controller: 'productsCategoriesController'
                }
            },
            ncyBreadcrumb: {
                label: 'Категории'
            }
        })
        .state('catalog.categories.new', {
            url: "/new",
            views: {
                '@': {
                    templateUrl: "../assets/categoriesNew.html",
                    controller: 'productsCategoriesController'
                }
            },
            ncyBreadcrumb: {
                label: 'Новая категория'
            }
        })
        .state('catalog.categories.edit', {
            url: "/:id/edit",
            views: {
                '@': {
                    templateUrl: "../assets/categoriesForm.html",
                    controller: 'productsCategoriesController'
                }
            },
            ncyBreadcrumb: {
                label: 'Редактирование'
            }
        })
        .state('orders', {
            url: "/orders",
            templateUrl: "../assets/orders.html",
            controller: 'ordersController',
            ncyBreadcrumb: {
                label: 'Заказы',
            }
        })
        .state('orders.edit', {
            url: "/:id/edit",
            views: {
                '@': {
                    templateUrl: "../assets/ordersEdit.html",
                    controller: 'ordersController'
                }
            },
            ncyBreadcrumb: {
                label: '№{{order.id}}',
            }
        })
        .state('assets', {
            url: "/assets",
            templateUrl: "../assets/assets.html",
            controller: 'assetsController',
            ncyBreadcrumb: {
                label: 'Файлы',
            }
        });
});

export default myApp;
