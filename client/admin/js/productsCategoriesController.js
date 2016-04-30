export default function($scope, $state, $stateParams, $filter, $window, productsCategory, $http, Upload) {
    productsCategory.query().then(function(results) {
        $scope.categories = results;
    });

    $scope.sortType = 'selfAndAncestors[0].title';
    $scope.sortReverse = false;

    $scope.statusToggle = function(category) {
        productsCategory.get(category.id).then(function(c) {
            c.active = !c.active;
            c.update().then(function(result) {
                console.log(result);
                category.active = c.active;
            });
        });
    }

    $scope.categoryPath = function(array) {
        var filtered = [];
        angular.forEach(array, function(item) {
            filtered.push(item.title);
        });

        return filtered.join(" > ");
    };

    $scope.createCategory = function() {
        new productsCategory({
            'title': $scope.categoryTitle,
            'parent_id': $scope.categoryParent,
            'description': $scope.categoryDescription,
            'active': $scope.categoryActive,
            'seo_title': $scope.categorySeoTitle,
            'seo_description': $scope.categorySeoDescription,
        }).create()

        // $scope.upload = Upload.upload({
        //     url: '/admin/products_categories',
        //     method: 'POST',
        //     data: {
        //         products_category: {
        //             'title': $scope.categoryTitle,
        //             'parent_id': $scope.categoryParent,
        //             'description': $scope.categoryDescription,
        //             'active': $scope.categoryActive,
        //             'seo_title': $scope.categorySeoTitle,
        //             'seo_description': $scope.categorySeoDescription,
        //         }
        //     },

        // });

    };


    $scope.deleteCategories = function() {
        var url = '/admin/products_categories/destroy_multiple';
        var data = $scope.checkedCategories.ids;

        $http.post(url, { products_categories: data }).then(function() {
            $state.reload();
        });
    };


    $scope.checkedCategories = {
        ids: []
    };

    $scope.checkedAll = false;

    $scope.checkAllToggle = function() {
        if ($scope.checkedAll == true) {
            $scope.checkedCategories.ids = [];
        } else {
            var filtered = [];

            filtered = $filter('filter')($scope.categories, $scope.searchCategory);

            $scope.checkedCategories.ids = filtered.map(function(item) {
                return item.id;
            });
        };
        $scope.checkedAll = !$scope.checkedAll;
    };

    $scope.$watch('searchCategory', function(val) {
        $scope.checkedCategories.ids = [];
        $scope.checkedAll = false;
    });

};
