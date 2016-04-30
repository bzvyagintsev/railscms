export default function($scope, $filter, $window, Order) {
    Order.query().then(function(results) {
        $scope.orders = results;
    });

    $scope.sortType = 'title';
    $scope.sortReverse = false;

};
