export default function($scope, $state, $stateParams, $window, $filter, Asset, Upload) {
    Asset.query().then(function(results) {
        $scope.assets = results;
    });

    $scope.uploadAssets = function(files) {
        $scope.btnDisabled = true;

        if (files && files.length) {
            for (var i = 0; i < files.length; i++) {

                $scope.upload = Upload.upload({
                    url: '/admin/assets',
                    method: 'POST',
                    data: {
                        asset: {
                            asset: files[i],
                            title: files[i].name
                        }
                    }
                }).then(function() {
                    Asset.query().then(function(results) {
                        $scope.assets = results;
                    })
                })

            }

            $scope.files = null;
            $scope.btnDisabled = false;

        }
    }
};

//  Загрузка одного файла
// $scope.assetCreate = function(file) {
//     if (file != null) {
//         $scope.upload = Upload.upload({
//             url: '/admin/assets',
//             method: 'POST',
//             data: {
//                 asset: {
//                     asset: file,
//                     title: file.name
//                 }
//             }
//         }).then(function() {
//             $scope.file = null;
//             Asset.query().then(function(results) {
//                 $scope.assets = results;
//             });
//         });
//     }

// };
