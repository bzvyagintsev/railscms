export default function($scope, $state, $stateParams, $window, $filter, Product, productsCategory, Upload) {
    Product.query().then(function(results) {
        $scope.products = results;
        if ($stateParams.id) {
            $scope.product = $filter('filter')($scope.products, { id: parseInt($stateParams.id) })[0];

            $scope.productTitle = $scope.product.title;
            $scope.productPrice = $scope.product.price;
            $scope.productDescription = $scope.product.description;
            $scope.productWeight = $scope.product.weight;
            $scope.productLength = $scope.product.length;
            $scope.productHeight = $scope.product.height;
            $scope.productWidth = $scope.product.width;
            $scope.productSeoTitle = $scope.product.seoTitle;
            $scope.productSeoDescription = $scope.product.seoDescription;
            $scope.productActive = $scope.product.active;
            $scope.cover = $scope.product.thumb.url;
            $scope.productCategory = $scope.product.category.id
        }
    });

    productsCategory.query().then(function(results) {
        $scope.categories = results;
    });

    $scope.categoryPath = function(array) {
        var filtered = [];
        angular.forEach(array, function(item) {
            filtered.push(item.title);
        });

        return filtered.join(" > ");
    };


    $scope.createProduct = function(file) {
        // $scope.uploader = new FileUploader({ url: 'admin/products' });
        // new Product({
        //     title: $scope.productTitle,
        //     price: $scope.productPrice,
        //     description: $scope.productDescription,
        //     weight: $scope.productWeight,
        //     length: $scope.productLength,
        //     height: $scope.productHeight,
        //     width: $scope.productWidth,
        //     active: $scope.productActive,
        //     seo_title: $scope.productSeoTitle,
        //     seo_description: $scope.productSeoDescription,
        //     cover: file
        // }).create()


        $scope.upload = Upload.upload({
            url: '/admin/products',
            method: 'POST',
            data: {
                product: {
                    'title': $scope.productTitle,
                    'price': $scope.productPrice,
                    'products_category_id': $scope.productCategory,
                    'description': $scope.productDescription,
                    'weight': $scope.productWeight,
                    'length': $scope.productLength,
                    'height': $scope.productHeight,
                    'width': $scope.productWidth,
                    'active': $scope.productActive,
                    'seo_title': $scope.productSeoTitle,
                    'seo_description': $scope.productSeoDescription,
                    'cover': file

                }
            },

        });

    };

    $scope.updateProduct = function() {
        Product.get($scope.product.id).then(function(product) {
            product.title = $scope.productTitle;
            product.price = $scope.productPrice;
            product.description = $scope.productDescription;
            product.weight = $scope.productWeight;
            product.length = $scope.productLength;
            product.height = $scope.productHeight;
            product.width = $scope.productWidth;
            product.active = $scope.productActive;
            product.seo_title = $scope.productSeoTitle;
            product.seo_description = $scope.productSeoDescription;

            product.update();
        });
    };

};
