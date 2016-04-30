export default function($scope, $filter, $window, $http, Settings) {
    Settings.query().then(function(results) {
        $scope.settings = results;

        $scope.mailHost = $scope.settings['mail.host'];
        $scope.mailFrom = $scope.settings['mail.from'];
        $scope.mailAddress = $scope.settings['mail.address'];
        $scope.mailPort = $scope.settings['mail.port'];
        $scope.mailUserName = $scope.settings['mail.userName'];
        $scope.mailPassword = $scope.settings['mail.password'];

        $scope.baseSiteName = $scope.settings['base.siteName'];
        $scope.baseEmail = $scope.settings['base.email'];
        $scope.baseTel = $scope.settings['base.tel'];
        $scope.baseSecondTel = $scope.settings['base.secondTel'];
        $scope.baseAddress = $scope.settings['base.address'];
        $scope.baseWorkTime = $scope.settings['base.workTime'];
        $scope.baseInfo = $scope.settings['base.info'];

        $scope.seoTitle = $scope.settings['seo.title'];
        $scope.seoDescription = $scope.settings['seo.description'];

        $scope.addtlScripts = $scope.settings['addtl.scripts'];


        // $scope.mailHost = $scope.settings.mailHost;
        // $scope.mailFrom = $scope.settings.mailFrom;
        // $scope.mailAddress = $scope.settings.mailAddress;
        // $scope.mailPort = $scope.settings.mailPort;
        // $scope.mailUserName = $scope.settings.mailUserName;
        // $scope.mailPassword = $scope.settings.mailPassword;

        // $scope.baseSiteName = $scope.settings.baseSiteName;
        // $scope.baseEmail = $scope.settings.baseEmail;
        // $scope.baseTel = $scope.settings.baseTel;
        // $scope.baseSecondTel = $scope.settings.baseSecondTel;
        // $scope.baseAddress = $scope.settings.baseAddress;
        // $scope.baseWorkTime = $scope.settings.baseWorkTime;
        // $scope.baseInfo = $scope.settings.baseInfo;

        // $scope.seoTitle = $scope.settings.seoTitle;
        // $scope.seoDescription = $scope.settings.seoDescription;

    });

    $scope.saveSettings = function() {
        Settings.query().then(function(settings) {
            settings['mail.host'] = $scope.mailHost;
            settings['mail.from'] = $scope.mailFrom;
            settings['mail.address'] = $scope.mailAddress;
            settings['mail.port'] = $scope.mailPort;
            settings['mail.userName'] = $scope.mailUserName;
            settings['mail.password'] = $scope.mailPassword;

            settings['base.siteName'] = $scope.baseSiteName;
            settings['base.email'] = $scope.baseEmail;
            settings['base.tel'] = $scope.baseTel;
            settings['base.secondTel'] = $scope.baseSecondTel;
            settings['base.address'] = $scope.baseAddress;
            settings['base.workTime'] = $scope.baseWorkTime;
            settings['base.info'] = $scope.baseInfo;

            settings['seo.title'] = $scope.seoTitle;
            settings['seo.description'] = $scope.seoDescription;

            settings['addtl.scripts'] = $scope.addtlScripts;

            settings.update();
        });

        // var url = '/admin/settings';
        // var settings = {
        //     'base.address': $scope.baseAddress,
        //     'base.email': $scope.baseEmail,
        // };

        // $http.patch(url, { settings }).then(function() {

        // });
    };
};
