export default function($scope, $filter, $window, Product, $http, $state) {
    Product.query().then(function(results) {
        $scope.products = results;
    });

    $scope.sortType = 'title';
    $scope.sortReverse = false;

    // Product.prototype.destroyProducts = function() {
    //     return this.$post(this.$url() + '/destroy_multiple');
    // };

    // Обновляет статус с получением актуальной информации о товаре

    $scope.statusToggle = function(product) {
        Product.get(product.id).then(function(p) {
            p.active = !p.active;
            p.update().then(function(result) {
                console.log(result);
                product.active = p.active;
            });
        });
    }

    // Обновляет статус без получения актуальной информации о товаре

    // $scope.statusToggle = function(product) {
    //     product.active = !product.active;
    //     product.update().then(function(result) {
    //         console.log(result);
    //     });
    // }

    $scope.deleteProducts = function() {

        // Product.prototype.destroyProducts = function() {
        // Product.$delete('/admin/products/destroy_multiple', { id: 4 });
        // };
        var url = '/admin/products/destroy_multiple';
        var data = $scope.checkedProducts.ids;


        $http.post(url, { products: data }).then(function() {
            $state.reload();
            // Product.query().then(function(results) {
            //     $scope.products = results;
            // });
        });

        //  Product.$post(url, { products: data }).then(function(result) {
        //     console.log(result);
        // });
    };

    // $scope.deleteProducts = function() {
    //     Product.$post('/admin/products/destroy_multiple', {
    //         products: $scope.productsChecked,
    //     }).then(function(result) {
    //         console.log(result);
    //     });
    // };

    $scope.checkedProducts = {
        ids: []
    };

    $scope.checkedAll = false;

    $scope.checkAllToggle = function() {
        if ($scope.checkedAll == true) {
            $scope.checkedProducts.ids = [];
        } else {
            var filtered = [];

            filtered = $filter('filter')($scope.products, $scope.searchProduct);

            $scope.checkedProducts.ids = filtered.map(function(item) {
                return item.id;
            });
        };
        $scope.checkedAll = !$scope.checkedAll;
    };

    $scope.$watch('searchProduct', function(val) {
        $scope.checkedProducts.ids = [];
        $scope.checkedAll = false;
    });

};

// var adminPanel = angular.module('adminPanel', ['ngResource', 'rails']);

// Дефолтный способ получения ресурсов
// productCenter.factory("Product", function($resource) {
//   return $resource("http://localhost:3000/products/:id", { id: '@id' }, { // получаем ресурс - товары
//     index:   { method: 'GET', isArray: true, responseType: 'json' },
//     update:  { method: 'PUT', responseType: 'json' }
//   }); 
// })

// Округление числа
// myApp.filter('setDecimal', ['$filter', function($filter) {
//     return function(input, places) {
//         if (isNaN(input)) return input;
//         // If we want 1 decimal place, we want to mult/div by 10
//         // If we want 2 decimal places, we want to mult/div by 100, etc
//         // So use the following to create that factor
//         var factor = "1" + Array(+(places > 0 && places + 1)).join("0");
//         return Math.round(input * factor) / factor;
//     };
// }]);

// myApp.factory('Product', ['railsResourceFactory', function(railsResourceFactory) {
//     return railsResourceFactory({
//         url: '/products_to_json',
//         name: 'product'
//     });
// }]);


// adminPanel.factory('LineItem', ['railsResourceFactory', function(railsResourceFactory) {
//     return railsResourceFactory({
//         url: '/line_items',
//         name: 'line_item'
//     });
// }]);




// myApp.controller("adminController", ['$scope', '$filter', '$window', 'Product', function($scope, $filter, $window, Product) {

// }])
